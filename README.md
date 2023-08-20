# HSB dotfiles

## Requirements
- ansible

## MacOs
Apart from all above, on apple we need to ensure the following is installed:
- macports

## Ansible
Used to setup my systems. Use `ansible.sh`.

# Loop back
- Use ansible-vault for ssh keys. [Resource](https://www.shellhacks.com/ansible-sudo-a-password-is-required/).
- What's possible in the requirements.yaml? [Resource](https://docs.ansible.com/ansible/latest/galaxy/user_guide.html#installing-roles-and-collections-from-the-same-requirements-yml-file).
- How to install a specific version in macport using ansible? [Documentation](https://docs.ansible.com/ansible/latest/collections/community/general/macports_module.html).
- 'mkdir -p a/b/c' followed by 'cd !$' to cd into the newly created path.
- macports installation of ansible appends a `-3.11`, which is annoying. The note of the port has the answer.... `port select --set ansible py311-ansible`.
- Blog aboug using ansible/stow for managing dotfiles. [Blog](https://www.iduoad.com/posts/treat-your-dotfiles-better/).
- Blog about ansible and stow, change aware. [Blog](https://phelipetls.github.io/posts/introduction-to-ansible/).
