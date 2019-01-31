## To Setup 

1. `cd ~`
1. `git clone git@github.com:latazzajones/dotfiles.git`
1. `sh dotfiles/setup.sh`
1. Add any keys or env variables specific to the machine to the `~/.keys` folder


## Adding Packages to Vim. 

1. `cd ~/dotfiles/vim/pack/my-packages/start/` or `cd ~/dotfiles/vim/pack/my-packages/opt/`
1. `git submodule add #{path to repo}`

## Adding files to symlink to dotfiles

1. Add the file without a dot to the `~/dotfiles` folder
1. If the file needs to be loaded when bash opens, source it in `bashrc`
1. Add the file name to the list of files in `setup.sh`
