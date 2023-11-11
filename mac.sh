#!/usr/bin/env bash
set -exuo pipefail

# Mouse acceleration off; linear/1:1 mouse movement
defaults write -g com.apple.mouse.scaling -1

# Disable widget screen
defaults write com.apple.dashboard mcx-disabled -boolean YES

# Fix screenshot location
mkdir -p ~/Pictures/Screenshots
defaults write com.apple.screencapture location ~/Pictures/Screenshots

# Do not use DS_Store on mounted network shares
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

# Restart some services for changes to take effect
killall Dock
killall SystemUIServer
