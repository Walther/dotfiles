Some OSX usability fixes :)
===========================

## Mouse acceleration off; linear/1:1 mouse movement
    defaults write -g com.apple.mouse.scaling -1

## Disable widget screen
    defaults write com.apple.dashboard mcx-disabled -boolean YES
    killall Dock

## Disable capslock
- System preferences, Keyboard
- Modifier keys
- Remember to set for both internal and USB keyboard (see dropdown at top)

## Fix screenshot location
    defaults write com.apple.screencapture location ~/Pictures/Screenshots
    killall SystemUIServer

