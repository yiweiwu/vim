# vim
My vim config and stuff

## Install on new machine

* Make a .vim directory
```
$ cd ~/
$ mkdir ~/.vim
```

* Checkout the repo
```
$ git clone git@github.com:yiweiwu/vim.git ~/.vim/
```

* Download all the submodules
```
$ git submodule update --init
```

* Create symbolic links for dot files
```
$ ln -s ~/.vim/vimrc ~/.vimrc
$ ln -s ~/.vim/tmux.conf ~/.tmux.conf
$ ln -s ~/.vim/bash_profile ~/.bash_profile
