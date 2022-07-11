#!/bin/bash
#INFO: updates the atk commands from github, only if last updated is > 7 days. Runs when you login.

# Now all the standard variables
ATK_HOME=$HOME/.atk
ATK_BIN=${ATK_HOME}/bin
REMOTE="git@github.com:aganitha/atk-setup.git"
LAST_UPDATED_FILE=$ATK_HOME/.last_updated

update_atk_if_not_recent() {
    if [ -f $LAST_UPDATED_FILE ]
    then
        [[ $(find $LAST_UPDATED_FILE -mtime +7 -print) ]] &&  {
            echo "It has been a while that atk is updated. Updating now."
            update_atk
        }
    else
        echo "Cannot determine when atk was updated.Updating now."
        update_atk
    fi
}

update_atk() {

        cd "$ATK_HOME"
        git pull --quiet
        echo "ATK updated at $(date)" > $LAST_UPDATED_FILE
    }

update_atk_if_not_recent
