# HSB dotfiles

## Requirements
- ansible

## MacOs
Apart from all above, on apple we need to ensure the following is installed:
- macports

## Ansible
Used to setup my systems. Use `ansible.sh`.

# TODO:
## nvim
- Make sure that colorcolumn does not draw a line in the help or in netrw.
- Make sure that colorcolumn does not show in 'special-buffers'
    - `help`
- Check :h buftype for more info
- You can check the buffer type by running `:set buftype`
- You can check the filetype by running `:set filetype`
- Configs can be set by file type, (check `:h ftplugin`). What about buffer type?
- For more on ftplugins, check `:h ftplugin-name` and `:h write-filetype-plugin` `:h ftplugin`
- How to allow disabling the ftplugin, or being loaded more than once? check `DISABLING` on `:h ftplugin`

# Loop back
- Use ansible-vault for ssh keys. [Resource](https://www.shellhacks.com/ansible-sudo-a-password-is-required/).
- What's possible in the requirements.yaml? [Resource](https://docs.ansible.com/ansible/latest/galaxy/user_guide.html#installing-roles-and-collections-from-the-same-requirements-yml-file).
- How to install a specific version in macport using ansible? [Documentation](https://docs.ansible.com/ansible/latest/collections/community/general/macports_module.html).
- 'mkdir -p a/b/c' followed by 'cd !$' to cd into the newly created path.
- macports installation of ansible appends a `-3.11`, which is annoying. The note of the port has the answer.... `port select --set ansible py311-ansible`.
- Blog aboug using ansible/stow for managing dotfiles. [Blog](https://www.iduoad.com/posts/treat-your-dotfiles-better/).
- Blog about ansible and stow, change aware. [Blog](https://phelipetls.github.io/posts/introduction-to-ansible/).
- tmux has a menu when doing `<prefix> <`. Don't forget it!
- Online man editor. [Tool](https://roperzh.github.io/grapse/).
- Where to put man pages. [SO question](https://unix.stackexchange.com/questions/90759/where-should-i-install-manual-pages-in-user-directory).
