dotfiles
========

My "dotfiles".


- terminals: [rxvt-unicode-256color](http://software.schmorp.de/pkg/rxvt-unicode.html) and [xterm](http://invisible-island.net/xterm/) where urxvt isn't available
- shell: [zsh](http://en.wikipedia.org/wiki/Z_shell), with the help of [promptline.vim](https://github.com/edkolev/promptline.vim)
- shell multiplexer: [tmux](http://tmux.sourceforge.net/), with [tmuxline.vim](https://github.com/edkolev/tmuxline.vim)
- editor: [vim](http://www.vim.org/)
- tiling window manager: [i3](http://i3wm.org/)
- fonts: DejaVu Sans, DejaVu Sans Mono - with [Powerline patch](https://github.com/Lokaltog/powerline-fonts) for fancy glyphs)
- color theme: Monokai (see [Xresources](Xresources))

Screenshot:
![screenshot](dotfiles.png)

## How to use

Optionally, take a Debian installer and give the `preseed.cfg` to it as a parameter. This installs all the requirements.
Alternatively, just look for the software install line in the `preseed.cfg` and install manually in your own environment.

Run the script:
- `./magic`, which puts all the files in place

## Licence
The Unlicence - this is free and unencumbered software released into the public domain.

The wallpaper, "not-just-a-soldier.jpg", a photo I'm rather proud of, is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
