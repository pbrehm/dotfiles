# dotfiles
wl-clipboard required for wsl wayland clipboard support
```
sudo apt install wl-clipboard
```

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

windows startup location
%appdata%\Microsoft\Windows\Start Menu\Programs\Startup

Alacritty bolder font on mac os on retina screen fix.
https://github.com/alacritty/alacritty/commit/2a676dfad837d1784ed0911d314bc263804ef4ef
$ defaults write org.alacritty -int 0

lazyvim has my custom lazyvim setup.

nvim has custom nvim setup based on https://github.com/LunarVim/Launch.nvim

# Undercurl for WSL

 to get this to work outside of tmux follow these steps
 ref - https://github.com/neovim/neovim/issues/26744#issuecomment-1918867789
 :h terminfo https://neovim.io/doc/user/term.html

```
 curl -LO https://invisible-island.net/datafiles/current/terminfo.src.gz
 gunzip terminfo.src.gz
```
then edit the xterm-256color to be like this. (only middle line is added)

```
xterm-256color|xterm with 256 colors,
	Smulx=\E[4:%p1%dm,
	use=xterm+osc104, use=xterm+256color, use=xterm-new,
```

then install it

```
tic -x terminfo.src
```
