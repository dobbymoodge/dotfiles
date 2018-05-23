#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILES="${DIR}"
HOSTPATH="${DOTFILES}/hosts/${HOSTNAME}"
# [[ -e "${HOME}/dotfiles" ]] && DOTFILES="${HOME}/dotfiles"

do_link () {
    if [ -e "$2" ] ; then
	    if ! [ -L "$2" ] ; then
	        echo "$2 exists, but is not a link!"
	    else
	        echo "$2 exists"
	    fi
        return 1
    else
	  ln -s "$1" "$2"
      # echo "ln -s \"$1\" \"$2\""
    fi
}

if [[ -d "${HOSTPATH}" ]] ; then
  host_link () {
    if [[ -e "${HOSTPATH}/${1}" ]] ; then
      do_link "${HOSTPATH}/${1}" "${2}"
    else
      do_link "${DOTFILES}/${1}" "${2}"
    fi
  }
else
  host_link () {
    do_link "${DOTFILES}/${1}" "${2}"
  }
fi

# eval "$(echo "orig_theirfunc()"; declare -f theirfunc | tail -n +2)"

# Are we in the .dotfiles directory?
if [ -d ./.git -a "${PWD}" == "${DOTFILES}" ] ; then
#    host_link ".config/subtle" "${HOME}/.config/subtle"
#    if host_link ".emacs.d" "${HOME}/.emacs.d" ; then
#        host_link ".emacs.d/init.el" "${HOME}/.emacs"
#    fi
    host_link ".Xresources" "${HOME}/.Xresources"
    host_link ".tmux.conf" "${HOME}/.tmux.conf"
    host_link "git/.gitconfig" "${HOME}/.gitconfig"
    host_link "git/.git-templates" "${HOME}/.git-templates"
    host_link "bin/synovce" "${HOME}/bin/synovce"
    host_link ".fvwm" "${HOME}/.fvwm"
fi
