@*=
@script_variables
@functions

@functions+=
function! TangleCurrentBuffer(outputdir)
	@skip_if_one_line_or_less
	@parse_variables
	@read_line_by_line
	@traverse_node_and_output
endfunction

@read_line_by_line+=
for i in range(1, line('$'))
	@get_line_from_buffer
	@check_if_line_escape_double_at
	@check_if_line_is_section
	@check_if_line_is_reference
	@otherwise_add_to_section
endfor

@get_line_from_buffer+=
let line = getline(i)

@check_if_line_is_section+=
elseif line =~ '^@\S\+[+\-]\?=\s*$'
	@parse_section_name
	@create_new_section
	@link_to_previous_section_if_needed
	@otherwise_just_save_section

@parse_section_name+=
let ml = matchlist(line, '@\(.\{-}\)\([+\-]\?=\)')
let name = ml[1]
let op = ml[2]

@create_new_section+=
let section = { 'lines' : [] }

@parse_variables+=
let sections = {}

@link_to_previous_section_if_needed+=
if op == '+=' || op == '-=' 
	if has_key(sections, name)
		if op == '+='
			@add_back_to_section
		else " op == '-='
			@add_front_to_section
		endif
	else
		let sections[name] = [section]
		let cur_section = section
	endif

@otherwise_just_save_section+=
else
	let sections[name] = [section]
	let cur_section = section
endif


@add_back_to_section+=
call add(sections[name], section)
let cur_section = section

@add_front_to_section+=
call insert(sections[name], section, 0)
let cur_section = section

@check_if_line_is_reference+=
elseif line =~ '^\s*@\S\+\s*$'
	@get_reference_name
	@check_that_sections_is_not_empty
	@create_line_reference
	@add_line_to_current_section

@get_reference_name+=
let ml = matchlist(line, '\(\s*\)@\(\S\+\)')

@check_that_sections_is_not_empty+=
if len(sections) == 0
	@display_error_no_section
	continue
endif

@script_variables+=
let s:REFERENCE = 1

@create_line_reference+=
let l = { 'type' : s:REFERENCE, 'str' : ml[2], 'prefix' : ml[1] }

@add_line_to_current_section+=
call add(cur_section['lines'], l)

@otherwise_add_to_section+=
else
	@check_that_sections_is_not_empty
	@create_text_line
	@add_line_to_current_section
endif

@script_variables+=
let s:TEXT = 2

@create_text_line+=
let l = { 'type' : s:TEXT, 'str' : line }

@check_if_line_escape_double_at+=
if line =~ '^\s*@@'
	@check_that_sections_is_not_empty
	@create_text_line_without_at
	@add_line_to_current_section

@create_text_line_without_at+=
let ml = matchlist(line, '\(.*\)@@\(.*\)')
let text = ml[1] . "@" . ml[2]
let l = { 'type' : s:TEXT, 'str' : text }

@parse_variables+=
let roots = []

@create_new_section+=
if op == '='
	call add(roots, name)
endif

@traverse_node_and_output+=
@get_parent_directory
for outputnode in roots
	@call_recursive_traverse_nodes_function
	@output_to_file
endfor

@get_parent_directory+=
let parentdir = expand("%:p:h")

@call_recursive_traverse_nodes_function+=
let lines = []
call TraverseNode(lines, "", outputnode, sections)

@functions+=
function! TraverseNode(lines, prefix, name, sections)
	@get_section
	@loop_through_section
endfunction

@get_section+=
if !has_key(a:sections, a:name)
	return -1
endif
let sectionList = a:sections[a:name]

@loop_through_section+=
for section in sectionList
	for line in section["lines"]
		@output_line_reference
		@output_line_text
	endfor
endfor

@output_line_reference+=
if line['type'] == s:REFERENCE
	let totalprefix = a:prefix . line['prefix']
	call TraverseNode(a:lines, totalprefix, line['str'], a:sections)

@output_line_text+=
elseif line['type'] == s:TEXT
	let linetext = a:prefix . line['str']
	call add(a:lines, linetext)
endif

@output_to_file+=
let filename = outputnode
if filename == "*"
	let filename = expand("%:t:r")
endif
let fullpath = parentdir . "/" . a:outputdir . "/" . filename
@if_slashes_create_directories_and_fix_filename
call writefile(lines, fullpath)

@functions+=
function! GoToLine(args)
	@parse_variables
	@read_line_by_line
	@parse_argument
	@find_line_number
	@go_to_line_number
endfunction

@create_line_reference+=
let l['ref'] = i

@create_text_line+=
let l['ref'] = i

@create_text_line_without_at+=
let l['ref'] = i

@script_variables+=
let s:lineindex = 1

@find_line_number+=
let s:lineindex = 1
let linesnr = TraverseNodeLineNr(linesearch, node, sections)

@functions+=
function! TraverseNodeLineNr(linesearch, name, sections)
	@get_section
	@loop_through_section_line_number
	@if_not_reached_return_minus
endfunction

@loop_through_section_line_number+=
for section in sectionList
	for line in section["lines"]
		@output_line_reference_line_number
		@output_line_text_line_number
	endfor
endfor

@output_line_reference_line_number+=
if line['type'] == s:REFERENCE
	let linesnr = TraverseNodeLineNr(a:linesearch, line['str'], a:sections)
	if linesnr != -1
		return linesnr
	endif

@if_not_reached_return_minus+=
return -1

@output_line_text_line_number+=
elseif line['type'] == s:TEXT
	if s:lineindex == a:linesearch
		return line['ref']
	endif
	let s:lineindex = s:lineindex+1
endif

@go_to_line_number+=
if linesnr == -1
	echoerr "Could not go to line"
else
	call execute("normal " . linesnr . "gg")
endif

@parse_argument+=
let node = roots[0]
if a:args =~ ":"
	let m = split(a:args, ":")
	let node = m[0];
	let linesearch = str2nr(m[1])
else
	let linesearch = str2nr(a:args)
endif

@skip_if_one_line_or_less+=
if line('$') <= 1
	return
endif

@if_slashes_create_directories_and_fix_filename+=
if filename =~ '/'
	@split_path
	@create_directories
	@fix_full_path
endif

@split_path+=
let dirs = split(filename, '/')

@create_directories+=
let curdir = parentdir . "/" . a:outputdir . "/"
for i in range(0, len(dirs)-2)
	let curdir = curdir . dirs[i]
	if !isdirectory(curdir)
		call mkdir(curdir)
	endif
	let curdir = curdir . "/"
endfor

@fix_full_path+=
let fullpath = curdir . dirs[-1]