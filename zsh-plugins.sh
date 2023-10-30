#!/bin/bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf\n~/.fzf/install
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions\n\n
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting\n\n
git clone https://github.com/jeffreytse/zsh-vi-mode \\n  $ZSH_CUSTOM/plugins/zsh-vi-mode
