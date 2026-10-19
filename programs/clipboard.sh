#!/bin/bash

# Let's start by copying a file.
$ cb copy NuclearLaunchCodes.pdf

# Now, let's paste this file.
$ cb paste

# Not bad, right?

# Let's make a note for this clipboard.
$ cb note "Keep this a secret"

# What if you wanted to pipe the note in?
$ echo "Keep this a secret OR ELSE" | cb note

# Now let's cut a directory to a different clipboard.
$ cb cut69 MyDirectory

# We put the 69 right after "cut" to tell CB to put MyDirectory in clipboard 69.

# Let's add a file to this same clipboard.
$ cb add69 SomeFile

# To remove a file, enter its name to remove just that file.
$ cb remove69 SomeFile

# Alternatively, you can put in a regex pattern instead to generalize the removal.
$ cb remove69 "So.*le"

# Finally, let's paste what we have in clipboard 69.
$ cb paste69

# You can copy multiple files at the same time.
# Let's try the "_420" persistent clipboard for this one.
$ cb copy_420 foo.bar NotAVirus.bar.mp3.exe

# Like before, we can remove anything with a regex patttern.
$ cb remove_420 "*.mp3\.exe"

# Notes work exactly the same way for every clipboard.
$ cb note_420 "Some kosher content here"

# Let's look at everything we've stored in clipboard _420.
$ cb show_420

# Now let's see our original note and then clear that clipboard.
$ cb note
$ cb clear

# This is the same as "cb note" but for clipboard "_420" again.
$ cb note_420

# Let's shake things up. Say you have some kind of content you want to ignore.
# This content could be anything from a password to raw binary data.
# To ignore certain kinds of content, use a regex pattern of your choice.

# Let's try this with a classic example.
$ cb ignore "H.*2"

# This pattern will ignore anything starting with "H" and ending with "2."

# Now, this next command will fail because CB will ignore the content in it through the pattern.
$ cb copy "Hunter2"

# Let's get some more detailed information about our clipboards.
$ cb info
$ cb info69
$ cb info_420

# To wrap things up, let's get a bird's eye view of everything so far.
$ cb
# Doing "cb" is the exact same as "cb status."
$ cb status

# These are just a handful of examples.
# Check the documentation below for tons more examples of all the commands!
