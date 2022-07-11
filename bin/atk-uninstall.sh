#!/bin/bash
#INFO: uninstalls atk commands. 

# Now all the standard variables
ATK_HOME=$HOME/.atk
ATK_BIN=${ATK_HOME}/bin
REMOTE="git@github.com:aganitha/atk-setup.git"

remove_atk() {
    [ -d $ATK_HOME ] && {
        echo "Deleting $ATK_HOME"
        read -p "Are you sure? " -n 1 -r
        echo    # (optional) move to a new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            rm -rf ${ATK_HOME}
        fi
    }
}

remove_atk