#!/bin/bash

# https://askubuntu.com/questions/1541960/command-line-program-to-output-a-letter-by-its-unicode-name
# I think you are looking for uninames, which ships as part of the Unicode::Tussle Perl module. You can install this on Ubuntu with:

# sudo apt install cpanminus
# That will install the CPAN manager tool and you can then install the Unicode::Tussle module with:

# cpanm Unicode::Tussle
# You should now have the uniprops and uninames tools (among others, see man uniprops and the SEE ALSO section) available which let you do things like:

# $ uninames sigma | cat
# Duplicate specification "bmp|BMP|b" for option "bmp"
# uninames: using old UCD v6.0.0; current is v15.0.0
#  Ʃ  01A9    LATIN CAPITAL LETTER ESH
#     * African
#     * lowercase is 0283
#     x (greek capital letter sigma - 03A3)
#  ͻ  037B    GREEK SMALL REVERSED LUNATE SIGMA SYMBOL
#  ͼ  037C    GREEK SMALL DOTTED LUNATE SIGMA SYMBOL
#  ͽ  037D    GREEK SMALL REVERSED DOTTED LUNATE SIGMA SYMBOL
#  Σ  03A3    GREEK CAPITAL LETTER SIGMA
#     x (latin capital letter esh - 01A9)
#     x (n-ary summation - 2211)
#  ς  03C2    GREEK SMALL LETTER FINAL SIGMA
#     = stigma (the Modern Greek name for this letterform)
#     * not to be confused with the actual stigma letter
#     x (greek small letter stigma - 03DB)
#  σ  03C3    GREEK SMALL LETTER SIGMA
#     * used symbolically with a numeric value 200
#  Ϛ  03DA    GREEK LETTER STIGMA
#     * apparently in origin a cursive form of digamma
#     * the name "stigma" originally applied to a medieval sigma-tau ligature, whose shape was confusably similar to the cursive digamma
#     * used as a symbol with a numeric value of 6
#     x (roman numeral six late form - 2185)
#  ϛ  03DB    GREEK SMALL LETTER STIGMA
#     x (greek small letter final sigma - 03C2)
#  ϲ  03F2    GREEK LUNATE SIGMA SYMBOL
#     = greek small letter lunate sigma (1.0)
#     # 03C2 greek small letter final sigma
#  Ϲ  03F9    GREEK CAPITAL LUNATE SIGMA SYMBOL
#     # 03A3 greek capital letter sigma
#  Ͻ  03FD    GREEK CAPITAL REVERSED LUNATE SIGMA SYMBOL
#     = antisigma
#  Ͼ  03FE    GREEK CAPITAL DOTTED LUNATE SIGMA SYMBOL
#     = sigma periestigmenon
#  Ͽ  03FF    GREEK CAPITAL REVERSED DOTTED LUNATE SIGMA SYMBOL
#     = antisigma periestigmenon
#  Ↄ  2183    ROMAN NUMERAL REVERSED ONE HUNDRED
#     = apostrophic C
#     = Claudian antisigma
#     * used in combination with C and I to form large numbers
#     * lowercase is 2184
#     x (greek capital reversed lunate sigma symbol - 03FD)
#  ↄ  2184    LATIN SMALL LETTER REVERSED C
#     x (greek small reversed lunate sigma symbol - 037B)
#  ∑  2211    N-ARY SUMMATION
#     = summation sign
#     x (greek capital letter sigma - 03A3)
#     x (double-struck n-ary summation - 2140)
#  𝚺  1D6BA  MATHEMATICAL BOLD CAPITAL SIGMA
#     # <font> 03A3 greek capital letter sigma
#  𝛓  1D6D3  MATHEMATICAL BOLD SMALL FINAL SIGMA
#     # <font> 03C2 greek small letter final sigma
#  𝛔  1D6D4  MATHEMATICAL BOLD SMALL SIGMA
#     # <font> 03C3 greek small letter sigma
#  𝛴  1D6F4  MATHEMATICAL ITALIC CAPITAL SIGMA
#     # <font> 03A3 greek capital letter sigma
#  𝜍  1D70D  MATHEMATICAL ITALIC SMALL FINAL SIGMA
#     # <font> 03C2 greek small letter final sigma
#  𝜎  1D70E  MATHEMATICAL ITALIC SMALL SIGMA
#     # <font> 03C3 greek small letter sigma
#  𝜮  1D72E  MATHEMATICAL BOLD ITALIC CAPITAL SIGMA
#     # <font> 03A3 greek capital letter sigma
#  𝝇  1D747  MATHEMATICAL BOLD ITALIC SMALL FINAL SIGMA
#     # <font> 03C2 greek small letter final sigma
#  𝝈  1D748  MATHEMATICAL BOLD ITALIC SMALL SIGMA
#     # <font> 03C3 greek small letter sigma
#  𝝨  1D768  MATHEMATICAL SANS-SERIF BOLD CAPITAL SIGMA
#     # <font> 03A3 greek capital letter sigma
#  𝞁  1D781  MATHEMATICAL SANS-SERIF BOLD SMALL FINAL SIGMA
#     # <font> 03C2 greek small letter final sigma
#  𝞂  1D782  MATHEMATICAL SANS-SERIF BOLD SMALL SIGMA
#     # <font> 03C3 greek small letter sigma
#  𝞢  1D7A2  MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL SIGMA
#     # <font> 03A3 greek capital letter sigma
#  𝞻  1D7BB  MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL FINAL SIGMA
#     # <font> 03C2 greek small letter final sigma
#  𝞼  1D7BC  MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL SIGMA
#     # <font> 03C3 greek small letter sigma
# (the | cat is only there to show output here because without it, uninames automatically pipes to a pager making copy/pasting harder)

# Or, to see information about a specific character:

# $ uniprops "final sigma"
# charnames: some short character names may clash in [GREEK, LATIN], for example GAMMA
# U+03C2 ‹ς› \N{GREEK SMALL LETTER FINAL SIGMA}
#     \w \pL \p{LC} \p{L_} \p{L&} \p{Ll}
#     All Alnum X_POSIX_Alnum Alpha X_POSIX_Alpha Alphabetic Any Assigned Greek Is_Greek ID_Continue Is_IDC Cased Cased_Letter LC Changes_When_Casefolded CWCF
#        Changes_When_Casemapped CWCM Changes_When_NFKC_Casefolded CWKCF Changes_When_Titlecased CWT Changes_When_Uppercased CWU Ll L Gr_Base Grapheme_Base Graph X_POSIX_Graph
#        GrBase Grek Greek_And_Coptic InGreek IDC ID_Start IDS Letter L_ Lowercase_Letter Lower X_POSIX_Lower Lowercase Print X_POSIX_Print Unicode Word X_POSIX_Word
#        XID_Continue XIDC XID_Start XIDS
# Or

# $ uniprops ς
# charnames: some short character names may clash in [GREEK, LATIN], for example GAMMA
# U+03C2 ‹ς› \N{GREEK SMALL LETTER FINAL SIGMA}
#     \w \pL \p{LC} \p{L_} \p{L&} \p{Ll}
#     All Alnum X_POSIX_Alnum Alpha X_POSIX_Alpha Alphabetic Any Assigned Greek Is_Greek ID_Continue Is_IDC Cased Cased_Letter LC Changes_When_Casefolded CWCF
#        Changes_When_Casemapped CWCM Changes_When_NFKC_Casefolded CWKCF Changes_When_Titlecased CWT Changes_When_Uppercased CWU Ll L Gr_Base Grapheme_Base Graph X_POSIX_Graph
#        GrBase Grek Greek_And_Coptic InGreek IDC ID_Start IDS Letter L_ Lowercase_Letter Lower X_POSIX_Lower Lowercase Print X_POSIX_Print Unicode Word X_POSIX_Word
#        XID_Continue XIDC XID_Start XIDS
# Alternatively, you can try what @mutru suggested in a comment:

# $ curl  http://www.unicode.org/Public/UNIDATA/UnicodeData.txt 2>/dev/null |
#   grep -i sigma | awk -F';' '{printf "%s |0x%s| %c\n", $2, $1, strtonum("0x"$1)}'
# GREEK SMALL REVERSED LUNATE SIGMA SYMBOL |0x037B| ͻ
# GREEK SMALL DOTTED LUNATE SIGMA SYMBOL |0x037C| ͼ
# GREEK SMALL REVERSED DOTTED LUNATE SIGMA SYMBOL |0x037D| ͽ
# GREEK CAPITAL LETTER SIGMA |0x03A3| Σ
# GREEK SMALL LETTER FINAL SIGMA |0x03C2| ς
# GREEK SMALL LETTER SIGMA |0x03C3| σ
# GREEK LUNATE SIGMA SYMBOL |0x03F2| ϲ
# GREEK CAPITAL LUNATE SIGMA SYMBOL |0x03F9| Ϲ
# GREEK CAPITAL REVERSED LUNATE SIGMA SYMBOL |0x03FD| Ͻ
# GREEK CAPITAL DOTTED LUNATE SIGMA SYMBOL |0x03FE| Ͼ
# GREEK CAPITAL REVERSED DOTTED LUNATE SIGMA SYMBOL |0x03FF| Ͽ
# MATHEMATICAL BOLD CAPITAL SIGMA |0x1D6BA| 𝚺
# MATHEMATICAL BOLD SMALL FINAL SIGMA |0x1D6D3| 𝛓
# MATHEMATICAL BOLD SMALL SIGMA |0x1D6D4| 𝛔
# MATHEMATICAL ITALIC CAPITAL SIGMA |0x1D6F4| 𝛴
# MATHEMATICAL ITALIC SMALL FINAL SIGMA |0x1D70D| 𝜍
# MATHEMATICAL ITALIC SMALL SIGMA |0x1D70E| 𝜎
# MATHEMATICAL BOLD ITALIC CAPITAL SIGMA |0x1D72E| 𝜮
# MATHEMATICAL BOLD ITALIC SMALL FINAL SIGMA |0x1D747| 𝝇
# MATHEMATICAL BOLD ITALIC SMALL SIGMA |0x1D748| 𝝈
# MATHEMATICAL SANS-SERIF BOLD CAPITAL SIGMA |0x1D768| 𝝨
# MATHEMATICAL SANS-SERIF BOLD SMALL FINAL SIGMA |0x1D781| 𝞁
# MATHEMATICAL SANS-SERIF BOLD SMALL SIGMA |0x1D782| 𝞂
# MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL SIGMA |0x1D7A2| 𝞢
# MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL FINAL SIGMA |0x1D7BB| 𝞻
# MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL SIGMA |0x1D7BC| 𝞼
# Share
# Improve this answer
# Follow
# edited Feb 21 at 16:51
# answered Feb 21 at 16:01

# terdon
# 104k1515 gold badges205205 silver badges307307 bronze badges
# You may have to run cpanm Unicode::Tussle as sudo to install it into familiar paths (otherwise the Perl modules are installed in your home folder which may or may not be in your PATH). –
# Kedar Mhaswade
