#!/bin/bash
# user provisioning script
# run with user privileges after main provisioning script

local dir=${pwd}

. $dir/provision.funcs.sh
. $dir/provision.opts.sh

msgHeader "($USER) Installing User Packages"

if [[ -z "$_PROV_SHELL" || "$_PROV_SHELL" == "1" ]]; then
  msgHeader "($USER) Shell Setup"
  . $dir/provision/user/shell/shell.zsh
  . $dir/provision/user/shell/termite.zsh
fi

if [[ -z "$_PROV_DEV_TOOLS" || "$_PROV_DEV_TOOLS" == "1" ]]; then
  msgHeader "($USER) Development Setup"
  . $dir/provision/user/dev.sh
fi

if [[ -z "$_PROV_PROJECTS" || "$_PROV_PROJECTS" == "1" ]]; then
  msgHeader "($USER) Projects Setup"
  . $dir/provision/user/projects.sh
fi

msgHeader "Other Misc Setup"
. /vagrant/user/misc.sh
