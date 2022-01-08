#!/usr/bin/env bash
set -exuo pipefail

# Mouse acceleration off; linear/1:1 mouse movement
defaults write -g com.apple.mouse.scaling -1

# Disable widget screen
defaults write com.apple.dashboard mcx-disabled -boolean YES

# Fix screenshot location
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Restart some services for changes to take effect
killall Dock
killall SystemUIServer
