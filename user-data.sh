#!/bin/bash

# show Library folder
chflags nohidden ~/Library

# show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# add pathbar to title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# restart finder
killall Finder;

# Specify the number of columns to be used.
defaults write com.apple.dock springboard-columns -int 10

# Specify the number of rows to be used.
defaults write com.apple.dock springboard-rows -int 8

# Set the duration of the Dock animation to 0.5 seconds.
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Configure the Dock to have the fastest response time.
defaults write com.apple.dock autohide-delay -int 0

# Restart the Dock to apply the changes.
killall Dock;