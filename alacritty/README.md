how to setup TERM=alacritty
https://unix.stackexchange.com/questions/597445/why-would-i-set-term-to-xterm-256color-when-using-alacritty

Great! I'm on the same side as you! Instead of cloning the entire alacritty/ folder, run this anywhere in your computer:

mkdir alacritty
and then download the alacritty/extra/ folder and copy it into the alacritty/ you just create, then (the following steps the same as bulid step above) run:

sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
then go to your rc file (In my case .zshrc) and add:

export TERM=alacritty



For using Alacritty on windows with portable executable there are some things that need to be done.

set path of shortcut like this to use config file
C:\Users\username\Documents\Alacritty\Alacritty-v0.13.1-portable.exe --config-file alacritty.toml

also need to steal OpenConsole.exe and conpty.dll and place in execution directory if on windows 10.
https://github.com/alacritty/alacritty/pull/6994/files


must include following code to make CTRL + SPACE work in terminal

...
[[keyboard.bindings]]
key = "Space"
mods = "Control"
chars = "\u0000"
...
