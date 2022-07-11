# atk-setup
Sets up ATK commands. Has provisions for auto update, manual update, and uninstall. Supports Mac ZSH as well as bashrc. Works on all platforms.

# Usage

Run the following command to install atk:
` (cd /tmp;rm -rf atk-setup; git clone git@github.com:aganitha/atk-setup.git; bash atk-setup/bin/atk-install.sh; rm -rf atk-setup)`

## Prerequisites

You must have the following:

1. Access to Aganitha's github, using your private key.
2. Git installed

You can run either bash (standard on Linux) or zsh (standard on Mac OS).

# How it works

The installation follows ohmyzsh model closely. The initial code is pulled from github. It does the following:

1. Installs the code from github in .atk (as opposed to atk -- so that the system is not cluttered)
2. It adds file to be sourced on login.

Everytime you login, the sourced file does

1. Sets the path
2. Once every week, updates the folder with the files from the repo

# Additional commands in ATK system

1. `atk-update.sh` updates the atk setup
2. `atk-uninstall.sh` uninstalls the atk system
3. `atk-list-commands.sh` lists all the available commands with their purpose

# Conclusion

This system needs to be installed only once. We can roll out any changes, enhancements without reinstalling the system. It is also resilent without any dependencies other than github.  No hardcoded names wither, other than github repo name.







