#!/bin/bash
#INFO: updates the atk commands from github, when invoked.

# Now all the standard variables
ATK_HOME=$HOME/.atk
ATK_BIN=${ATK_HOME}/bin
REMOTE="git@github.com:aganitha/atk-setup.git"
LAST_UPDATED_FILE=$ATK_HOME/.last_updated

update_atk() {
        cd "$ATK_HOME"
        git pull --quiet
        echo "ATK updated at $(date)" > $LAST_UPDATED_FILE
    }

update_atk
