#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

# dotfiles directory
dir=~/dotfiles                    
# old dotfiles backup directory
olddir=~/dotfiles_old             
# list of files/folders to symlink in homedir
files="zprofile zshrc gitconfig gitignore_global profile viminfo vim git-completion.bash"    
# list of packages to run on start

###colors###
NC='\033[0m'
BLUE='\033[0;94m'
ORANGE='\033[0;33m'
GREEN='\033[0;92m'
PINK='\033[0;36m'
MAGENTA='\033[0;35m'
##########

# create dotfiles_old in homedir
echo "${GREEN}Creating $olddir for backup of any existing dotfiles in ~${NC}"
mkdir -p $olddir

# change to the dotfiles directory
echo "${ORANGE}Changing to the $dir directory${NC}"
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
echo "${BLUE}Moving any existing dotfiles from ~ to $olddir then creating symlink to  in home directory.${NC}"
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done

# set gitignore_global file
echo "${ORANGE}Setting gitignore file${NC}"
git config --global core.excludesfile ~/.gitignore_global

# install submodules
echo "${GREEN}Adding submodules for vim!${NC}" 
git submodule init
git submodule update

# remind the user to use the .keys file
echo "${PINK}Creating a ~/.secret_keys file${NC}"
touch ~/.secret_keys
echo "${MAGENTA}Don't forget to update your ~/.keys file!" 
echo "👩‍💻 👩‍💻 👩‍💻 Have fun!👩‍💻 👩‍💻 👩‍💻"
