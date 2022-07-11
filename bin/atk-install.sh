#!/bin/bash
#INFO: This command installs the atk commands from github. 

add_line() {
    line=$1
    file=$2
    if [ -f $file ] 
    then
        grep -q "${line}" $file || (echo "#Added by ATK setup on `date`" >> $file; echo $line >> $file)
    else
        echo "#Created by ATK Setup" > $file
        echo $line >> $file
    fi
}


# Now all the standard variables
ATK_HOME=$HOME/.atk
ATK_BIN=${ATK_HOME}/bin
REMOTE="git@github.com:aganitha/atk-setup.git"

setup_atk_bin() {
    [ -d $ATK_HOME ] && {
        echo "${ATK_HOME} exists. Remove it if you want fresh install. Otherwise run update_atk.sh"
        exit 1
    }

    git init --quiet "$ATK_HOME"
    cd "$ATK_HOME"
     git config core.eol lf \
    && git config core.autocrlf false \
    && git config fsck.zeroPaddedFilemode ignore \
    && git config fetch.fsck.zeroPaddedFilemode ignore \
    && git config receive.fsck.zeroPaddedFilemode ignore
    git remote add origin ${REMOTE}
    git fetch
    git checkout -b main origin/main

    LAST_UPDATED_FILE=$ATK_HOME/.last_updated
    echo "Created at: $(date)" > $LAST_UPDATED_FILE
}

setup_atk_bin_path() {
    # We should support both bash as well as zsh.
    bash_rc=$ATK_HOME/etc/bash_rc
    zsh_rc=$ATK_HOME/etc/zsh_rc
    bash_profile=$HOME/.bashrc
    zsh_profile=$HOME/.zshrc

    [ -f ${bash_profile} ] && {
        add_line "[ -f ${bash_rc} ] && source ${bash_rc} ## Added by ATK" ${bash_profile}
    }

    [ -f ${zsh_profile} ] && {
        add_line "[ -f ${zsh_rc} ] && source ${zsh_rc} ## Added by ATK" ${zsh_profile}
    }
}

setup_atk_bin
setup_atk_bin_path
