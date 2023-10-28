how to setup TERM=alacritty
https://unix.stackexchange.com/questions/597445/why-would-i-set-term-to-xterm-256color-when-using-alacritty

Great! I'm on the same side as you! Instead of cloning the entire alacritty/ folder, run this anywhere in your computer:

mkdir alacritty
and then download the alacritty/extra/ folder and copy it into the alacritty/ you just create, then (the following steps the same as bulid step above) run:

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
then go to your rc file (In my case .zshrc) and add:

export TERM=alacritty
