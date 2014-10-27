First you will need to update the submodules.

```
git submodule update
```

Next, to install the configurations, run the following from your home directory.

```
ln -s config/vim/vimrc .vimrc
ln -s config/vim/ .vim

# Create files for vim temporary files
mkdir -p $HOME/.vimfiles/backup
mkdir -p $HOME/.vimfiles/undo
mkdir -p $HOME/.vimfiles/temp
```

Add the following to your `~/.bashrc`.

```
source $HOME/config/bashrc.sh
```
