# devenv

Ansible playbook for configuring tmux, vim, and related utilities on Linux.

To install:

    sudo ./install_ansible.sh
    ansible-playbook main.yml -c local --ask-sudo-pass

# features

* Common utilities (e.g. ctags)
* [Customized Vim](https://github.com/ealang/vimconf)
* Tmux with mouse support and Ctrl-HJKL shortcuts to move between vim and tmux splits

