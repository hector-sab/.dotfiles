# Workflow elements
## Track and untracked file
Check `git add -N` for intent to add.

On fugitive you can do:
- `:Git`
- Position the cursor on the file/folder that should be tracked
- Press `I`

Can this be done on a single file with a command?

## Stage a file
Can be done with either
- Open buffer with changes
- `:GWrite`

## Unstage a file
- `:Git`
- Position the cursor in the file you want to unstage
- Pess `-`

## Unstage line
Using GitSigns:
- https://github.com/lewis6991/gitsigns.nvim/issues/775
Using Fugitive:
- `:Git`
- Position the cursor in the file that contains lines you want to unstage
- Press `=` to expand the inline diff
- Select the lines to unstage
- Press `-`

Can this be done with `:Gdiff`?

##  Stage a file on a directory of multiple untracked files
- `:Git` for viewing the current status
- Step over the directory with the untracked files and press Enter
- Once netrw is open, navigate to the file you want to stage and open the file
- `:Gwrite` for staging the whole file

## Stage specific lines on a file
For this, I have added a custom user command for git signs. No keymap right
now as I prefer it on the commands.
## View all changes that need to be staged
## View all changes that have been staged and compare them with master

## Quick view of diff
- `:Git`
- Position the cursor on the list of modified files
- Press `>` to expand the changes in the current fugitive buffer
- Press `>` to hide the changes int he current fugitive buffer
- You can also use `=` to toggle between expanded and hidden

## View changes side to side
- `:Git`
- Position the cursor on the file to be checked
- Press `dd` to show side to side diff
    - Note that if we want to check a just added file that was not tracked previously, `dd` will fail and show a vertical "diff"
- Use `diffput`/`diffget` or `dp`/`do` for stagging/unstaging

## git commit -p from fugitivehttps://github.com/lewis6991/gitsigns.nvim/issues/775?

## Commit
- `:Git commit`
- Write message
- `:x`

# Other's workflows
- https://www.reddit.com/r/vim/comments/io5k0d/git_stage_visual_selection/

- Stash intent to add: https://stackoverflow.com/questions/34763805/stashing-a-file-added-with-intent-to-add
- Undo local commit: https://stackoverflow.com/questions/2845731/how-to-uncommit-my-last-commit-in-git
- Fix not-previous commit: https://stackoverflow.com/questions/2719579/how-to-add-a-changed-file-to-an-older-not-last-commit-in-git
