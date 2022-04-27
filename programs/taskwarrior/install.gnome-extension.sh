#!/bin/bash

# https://github.com/sgaraud/gnome-extension-taskwarrior
# https://extensions.gnome.org/extension-data/taskwarrior-integration%40sgaraud.github.com.v4.shell-extension.zip

# git clone https://github.com/sgaraud/gnome-extension-taskwarrior.git \
#   ~/.local/share/gnome-shell/extensions/taskwarrior-integration@sgaraud.github.com

# enable with gnome-tweak-tool

# Usage
# The usage is similar to taskwarrior command line syntax without the need to the "task id cmd" prefix. To add a task just enter the description and extra attributes if needed inside the "Add task" field. For instance:

# Edit extension usage in github README prio:H due:today +gnome
# It will add a task with description "Edit extension usage in github README", priority H, tag "gnome" and due date set to today.

# The pending task list can be filtered using the "Add filter" field. The filter field is persistent. For instance for filtering all the task belonging to a specific project "gnome-extension":

# proj:gnome-extension
# When the task is done, simply click on "done" button. The task can be started and stopped if fitting your workflow.

# By clicking on the description, a submenu will be displayed allowing to "delete" or "modify" that specific task. For instance to modify the due date to next monday, click on "modify" button and enter in the modal window:
