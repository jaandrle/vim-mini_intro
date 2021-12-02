# mini_intro.vim

Minimalistics intro page for Vim. Just show template markdown file.
You can use build-in vars `%%VERSION%%` and `%%VIMRC%%` to place
current Vim version and or random ten lines from your `.vimrc` file.

There is also support for custom bidnings inside Intro page, just add
`^nnoremap <buffer><silent> ` to your template.

## Installation

Install using your favorite package manager, or use Vim's built-in package
support:

    mkdir -p ~/.vim/bundle/vim-mini_intro
    cd ~/.vim/bundle/vim-mini_intro
    git clone https://github.com/jaandrle/vim-mini_intro.git

In `.vimrc`:

    set runtimepath^=~/.vim/bundle/*

## TODO
- [ ] better README
- [ ] tbd
