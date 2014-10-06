dotfiles
========

My "dotfiles".


- terminal: [rxvt-unicode-256color](http://software.schmorp.de/pkg/rxvt-unicode.html)
- shell: [zsh](http://en.wikipedia.org/wiki/Z_shell), with the help of [promptline.vim](https://github.com/edkolev/promptline.vim)
- shell multiplexer: [tmux](http://tmux.sourceforge.net/), with [tmuxline.vim](https://github.com/edkolev/tmuxline.vim) 
- editors: [Sublime Text 3](http://sublimetext.com/3), [vim](http://www.vim.org/)
- tiling window manager: [i3](http://i3wm.org/)
- fonts: DejaVu Sans, DejaVu Sans Mono - with [Powerline patch](https://github.com/Lokaltog/powerline-fonts) for fancy glyphs)
- color theme: Monokai (see [Xdefaults](Xdefaults))
- and a bundle of other often-used software specified in [requirements](requirements)

Screenshot:
![screenshot](dotfiles.png)

## How to use
Run the script:
- `./script install`, which installs a list of commonly used applications and tools specified in `requirements`
- `./script update`, which puts all the files in place
- `./script ext_software`, which installs some software external to default repositories (Optional)

## Licence
The Unlicence - this is free and unencumbered software released into the public domain.