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

* Pull the changes
```
$ git pull --recurse-submodules
```

* Create symbolic links for dot files
```
$ ln -s ~/.vim/vimrc ~/.vimrc
$ ln -s ~/.vim/tmux.conf ~/.tmux.conf
$ ln -s ~/.vim/bash_profile ~/.bash_profile
$ ln -s ~/.vim/hgrc ~/.hgrc
$ ln -s ~/.vim/zshrc ~/.zshrc
```

* Install oh-my-zsh (https://ohmyz.sh/)
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

* Install powerline font when using airline

There can be missing charactors on Mac when using the vim-airline (https://github.com/vim-airline/vim-airline)

Make sure the powerline fonts are installed and select the powerline font in the terminal.

See installation instruction in https://github.com/powerline/fonts

```
cd /.vim/bundle/powerline-fonts
./install.sh
```
