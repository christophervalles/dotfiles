#!/bin/sh

#zsh
echo "Setting up zsh..."
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# git
echo "Setting up git..."
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

#slate
echo "Setting up slate..."
ln -s ~/.dotfiles/slate/slate ~/.slate