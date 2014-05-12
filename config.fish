# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish
set TERM xterm-256color

# Set editors <3
set -x EDITOR vim

# Theme
set fish_theme bobthefish

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Override bobthefish theme default "motd"
function fish_greeting
end
