 vimrc / vimscript Debugging
 ===========================
 :

 + feature:
   - use `:help feature-list` to see all feature list, 
   - and `:version` to show which has clear about `options` and `features` 
   - use has({feature}) function like `:echo has("unix")` in vim-script's 
     program.
 + option:
   - use `:se OPTION` like `se ft` to show current vim option setting
 + variable:
   - use `:echo VAR` like `echo g:isMac` or `echo $HOME` to show vim-script's
     variable value or environment variables' value
 + mapping:
   - use `:map` to list all currrent key mapping
 + unknowns
   - use [vim-wikia](http://vim.wikia.com/wiki/Vim_Tips_Wiki) for more tips
   - and [sof](https://stackoverflow.com/tags/vim/info) for community help

* Persistent Echoing
    + using `:echom[sg]` will save the output and let you run `:messages` to view it later.
    + `:message` / `:messa` will also be ok. 
    + like `:echom`, there are `:echoh[l]` `:echoe[rr]`
