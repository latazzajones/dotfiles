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
files="bash_profile bashrc gitconfig gitignore_global profile viminfo vim"    
# list of packages to run on start
##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# install submodules
# will this work? it works but it's adding a new vim file :-( 
echo "Adding submodules"
git submodule init
git submodule update

# remind the user to use the .keys file
echo "Creating a ~/.keys file"
touch ~/.keys
echo "Don't forget to update your ~/.keys file! Have fun!"
