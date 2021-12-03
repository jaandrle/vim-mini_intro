```
                  %%VERSION%%
                                    
                                    Author: Bram Moolenaar et al.
                               Modified by team+vim@tracker.debian.org
                             Vim is open source and freely distributable

                                   Help poor children in Uganda!
                            Type  :help iccf<Enter>       for information
```

## For on-line help
- `:help<Enter>`: see help (also `<F1>`, `:help __something__<Enter>`, …)
- `:help version8<Enter>`: for version info


## How exit VIM
- `:q<Enter>`: Close program/window (or `:qa<Enter>`, `ZZ` a `ZQ` … see `:help write-quit`)
- `:bd<Enter>`: Close file (so called „buffer”)


## Quick navigation on this file
- Open file:
    - `o`: *last files* (viz `:help oldfiles<Enter>`)
    - `e`: *empty*
    - `p`: *empty and paste text from clipboard*
- `m`: Bookmarks list (see `:help mark-motions<Enter>`)
- `c`: Edit this file
- `P`: Expand Notes below

<!--region Notes -->
## Notes
<!--endregion-->

## Random part from config file `.vimrc`
``` %%VIMRC%%
```

<!--region This page maps -->
nnoremap <buffer><silent> e :bd<cr>
nnoremap <buffer><silent> p :bd<bar>normal "+p<cr>
nnoremap <buffer><silent> o :browse oldfiles<cr>
nnoremap <buffer><silent> m :marks<cr>
nnoremap <buffer> P /region<cr>za
nnoremap <buffer><silent> c :e ~/.vim/intro-template.md<cr>
<!--endregion-->
