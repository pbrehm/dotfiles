# dotfiles

- see dotfiles/.tmux.conf for instructions for tmux setup
```
pwd = ~/
mv .tmux.conf ~/dotfiles/.
ln -s ~/dotfiles/.tmux.conf .tmux.conf
.tmux.conf -> /home/pbrehm/dotfiles/.tmux.conf
```

```
pwd = ~/.config/
mv nvim ~/dotfiles/.
ln -s ~/dotfiles/nvim nvim
nvim -> /home/pbrehm/dotfiles/nvim
```

- using oh my zsh with powerlevel10k theme
```
pwd = ~/
mv .zshrc ~/.dotfiles/.
ln -s ~/dotfiles/.zshrc .zshrc
.zshrc -> /home/pbrehm/dotfiles/.zshrc
```

```
pwd = ~/
ln -s ~/dotfiles/.p10k.zsh .p10k.zsh
.p10k.zsh -> /home/pbrehm/dotfiles/.p10k.zsh
```

