#!/usr/bin/env bash
if [[ ! -d $HOME/.oh-my-zsh ]]
then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# plugins
# Autosuggestions
if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]
then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    rm -rf  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.git
    rm -rf  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.github
    rm -rf  $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.circleci
fi

# Syntax Highlighting
if [[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]
then
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    rm -rf $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/.git
fi

# Pure prompt
if [[ ! -d $HOME/.zsh/pure ]]
then
    mkdir -p "$HOME/.zsh"
    git clone --depth=1 https://github.com/sindresorhus/pure.git $HOME/.zsh/pure
    rm -rf $HOME/.zsh/pure/.git
fi

exit

