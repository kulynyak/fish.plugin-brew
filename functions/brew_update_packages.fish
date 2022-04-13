function brew_update_packages --description "Updates installed homebrew packages including cask."
    echo "update brew..."
    brew update
    echo "upgrade brew packages..."
    brew upgrade

    # clean-up evil
    echo "clean-up evil symlinks..."
    set -l HB_PATH "$(brew --prefix)/Homebrew/Library/Homebrew"
    set -l EVILS $(ls -l $HB_PATH | grep homebrew-cask | awk '{print $9}')
    if test -n "$EVILS"
        for evil_symlink in $(echo $EVILS)
            rm -v "$HB_PATH/$evil_symlink"
        end
    end

    # update casks
    echo "check outdated casks..."
    set -l OUTDATED $(brew outdated --cask --greedy --verbose | sed -E '/latest/d' | awk '{print $1}' ORS=' ' | tr -d '\n')
    set OUTDATED (string trim $OUTDATED)
    if test -n "$OUTDATED"
        # there are outdated casks
        echo "outdated casks: $OUTDATED"
        echo "upgrade outdated casks..."
        brew reinstall --cask (string split " " $OUTDATED)
    else
        echo "No casks to upgrade"
    end

    # clean-up
    brew cleanup
    # check if ok
    brew doctor
end
