set -U BROWSER chrome
set -U EDITOR vim

# Load additional configurations
set FISH_CONFIG $HOME/.config/fish/
. $FISH_CONFIG/autojump.fish

# Load private configurations
. $HOME/.private.fish
