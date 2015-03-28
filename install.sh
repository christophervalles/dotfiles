#!/bin/sh

#bash
echo "Setting up bash..."
ln -s ~/.dotfiles/bash/bash_profile ~/.bash_profile

# git
echo "Setting up git..."
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

#tmux
echo "Setting up tmux..."
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf