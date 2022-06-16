# fish.plugin-brew.fish is only meant to be used in interactive mode.
# If not in interactive mode and not in CI, skip the config to speed up shell startup
if not status is-interactive && test "$CI" != true
    exit
end

# setup variables
set -gx HOMEBREW_CASK_OPTS --no-quarantine
set -gx HOMEBREW_NO_ENV_HINTS 1
set -l BREW_GITHUB_API_TOKEN_PATH "$HOME/Dropbox/sync.dotfiles/brew.github.token.txt"
if test -f $BREW_GITHUB_API_TOKEN_PATH
    read -gx HOMEBREW_GITHUB_API_TOKEN <$BREW_GITHUB_API_TOKEN_PATH
end
set -e BREW_GITHUB_API_TOKEN_PATH

alias up="brew_update_packages"
