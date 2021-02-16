## CocPython
Dependencies (pip):
- python-language-server
- jedi=>0.17

## Useful commands
:CocCommands   lets you select what environment your completion should work with
    python.setInterpreter (Environment)
    python.setLinter      (flake8, mypy)


# Common Vim Commands

##*** Search

### Search letters in the same line
```
 |1|   f + letter              to seaerch forward in the same line the
 |2|   <SHIFT + f> + <letter>  to search backwards in the same line
 |3|   t + letter              to search forward and place cursor one col before
 |4|   <SHIFT + t> + <letter>  to search backwards and place cursor one col before
```
### Search text in the current buffer
```
 |1|   /<my-text>     to search text forward
 |2|   ?<my-text>     to search backwards
 |3|   <SHIFT + *>    to search the work under the cursor
```

## Jumping
 Use (,) or [,]

## Capitalize
 It needs to be in visual mode
```
 |1|   <SHIFT + u>      for upper case
 |2|   u                for lower case
```

## Increment/Decrement number
```
 |1|   CTRL + a     Incrementes a number
 |2|   CTRL + x     Decrements a number
```

## Convert
### Spaces to tabs
```
  |1| :set tabstop=2     "To match the indentation of the file
  |2| :set noexpandtab   "Use tab characters for new tabs
  |3| :%retab!           "Reindent all existing tabs
```
 SOURCE: https://stackoverflow.com/a/9105889/5969548

### Tabs to spaces
```
  |1| :set tabstop=2     "To match the indentation of the file
  |2| :set expandtab     "Use spaces characters for new tabs
  |3| :retab             "Reindent all existing tabs
```

## Comment multiple lines
```
  |1| CTRL-V              "Enter Visual-Block mode
  |2| Move up-down        "Select all desired lines init
  |3| SHIFT-i             "Enter Insert mode
  |4| Write #, //, etc    "Write correct comment character
  |5| ESC                 "Exit mode and apply to all selected lines
```

## Autocomplete
```
  i_CTRL-p               "Autocomplete <<<
  i_CTRL-n               "Autocomplete
  i_CTRL-x_CTRL-n        "Autocomplete using the words in the current file
```
 NOTE: For Vim help try `:h ins-completion`
 NOTE: `i_CTRL` referers to CTRL in insert mode

## Undo/Redo
```
    u        "Undo
  CTRL-r     "Redo
```
  NOTE: They must be in normal mode
  SOURE: https://vim.fandom.com/wiki/Undo_and_Redo

## About some commands in case I forget...
```
 <CR>  : Is like pressing Enter so it gets executed
 <C-U> : Remove all characters between the cursor position and the beginning of the line.
         https://vi.stackexchange.com/a/9752/19783
 <C-o> : Run a single normal mode command from insert mode
         https://vi.stackexchange.com/a/13165/19783
```
## Resourses
 Mapping on Vim: https://learnvimscriptthehardway.stevelosh.com/chapters/05.html
                 https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
 Copy/Paste    : https://linuxize.com/post/how-to-copy-cut-paste-in-vim/

## Notes
 - Official repo from Ubuntu may have not been compiled to have +clipboard (allows copy
   from-to vim). An alternative is vim-gtk3
 - Linux has two clipboards, thus we may need to sync them. If using KDE, use klipper
   (built-in) to sync them. However, anything you select will be copied into the clipboard
   if synchronized

## Useful

 - Check healt of neovim installation `:checkhealt` or `vim -c checkhealt`
 - Check all the key bindings `:help index`
 - Check the binding of a particular key/combination with `:verbose imap
   <tab>` (for example)
