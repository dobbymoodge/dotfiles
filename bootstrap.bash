#!/bin/bash

DOTFILES="${HOME}/.dotfiles"

do_link () {
    if [ -e "$2" ] ; then
	if ! [ -L "$2" ] ; then
	    echo "$2 exists, but is not a link!"
	else 
	    echo "$2 exists"
	fi
    else
	ln -s "$1" "$2"
    fi
}

# Are we in the .dotfiles directory?
if [ -d ./.git -a "${PWD}" == "${DOTFILES}" ] ; then
    do_link "${DOTFILES}/.config/subtle" "${HOME}/.config/subtle"
    do_link "${DOTFILES}/.emacs.d" "${HOME}/.emacs.d"
    do_link "${DOTFILES}/.emacs.d/init.el" "${HOME}/.emacs"
    do_link "${DOTFILES}/.Xresources" "${HOME}/.Xresources"
    do_link "${DOTFILES}/.tmux.conf" "${HOME}/.tmux.conf"
fi
