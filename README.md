# dotfiles

- see dotfiles/.tmux.conf for instructions for tmux setup
```
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
.tmux.conf -> /home/pbrehm/dotfiles/.tmux.conf
```

```
ln -s ~/dotfiles/nvim ~/.config/nvim
nvim -> /home/pbrehm/dotfiles/nvim
```

- using oh my zsh with powerlevel10k theme
```
ln -s ~/dotfiles/.zshrc ~/.zshrc
.zshrc -> /home/pbrehm/dotfiles/.zshrc
```

```
ln -s ~/dotfiles/.p10k.zsh ~/.p10k.zsh
.p10k.zsh -> /home/pbrehm/dotfiles/.p10k.zsh
```

```
ln -s ~/dotfiles/alacrity/.alacrity ~/.alacritty
.alacritty -> /home/pbrehm/dotfiles/alacritty/.alacritty
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


In windows terminal, I like "Tango dark"

get nerd fonts here
https://github.com/ryanoasis/nerd-fonts

vscode neovim config based on 
https://www.youtube.com/watch?v=g4dXZ0RQWdw

settings.vim: https://github.com/LunarVim/LunarVim/blob/4625145d0278d4a039e55c433af9916d93e7846a/vscode/settings.vim
vscode keybindings and setting: https://github.com/LunarVim/LunarVim/tree/4625145d0278d4a039e55c433af9916d93e7846a/utils/vscode_config
