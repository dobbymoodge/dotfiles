#!/bin/bash

DOTFILES="${HOME}/.dotfiles"

# Are we in the .dotfiles directory?
if [ -d ./.git -a "${PWD}" == "${DOTFILES}" ] ; then
    ln -s "${DOTFILES}/.config/subtle" "${HOME}/.config/subtle"
    ln -s "${DOTFILES}/.Xresources" "${HOME}/.Xresources"
fi
