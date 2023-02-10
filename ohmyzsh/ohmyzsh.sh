#!/bin/sh

# 安装 p10k theme
p10k_path=./themes/powerlevel10k/
if [ ! -d $p10k_path ];
then
    echo "*********** 开始下载 p10k *************"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $p10k_path
else
    echo "*********** 开始更新 p10k *************"
    cd $p10k_path
    git pull
    cd ../..
fi

# 安装常用 oh-my-zsh plugins
zsh_completions_path=./plugins/zsh-completions/
if [ ! -d $zsh_completions_path ]; 
then
    echo "*********** 开始下载 zsh-completions *************"
    git clone https://github.com/zsh-users/zsh-completions.git $zsh_completions_path
else
    echo "*********** 开始更新 zsh-completions *************"
    cd $zsh_completions_path
    git pull
    cd ../..
fi

zsh_syntax_highlighting_path=./plugins/zsh-syntax-highlighting/
if [ ! -d $zsh_syntax_highlighting_path ] ;
then
    echo "*********** 开始下载 zsh-syntax-highlighting *************"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $zsh_syntax_highlighting_path
else
    echo "*********** 开始更新 zsh-syntax-highlighting *************"
    cd $zsh_syntax_highlighting_path
    git pull
    cd ../..
fi

zsh_autosuggestions_path=./plugins/zsh-autosuggestions/
if [ ! -d $zsh_autosuggestions_path ] ;
then
    echo "*********** 开始下载 zsh-autosuggestions *************"
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $zsh_autosuggestions_path
else
    echo "*********** 开始更新 zsh-autosuggestions *************"
    cd $zsh_autosuggestions_path
    git pull
    cd ../..    
fi

zsh_history_substring_search_path=./plugins/zsh-history-substring-search/
if [ ! -d $zsh_history_substring_search_path ] ;
then
    echo "*********** 开始下载 zsh-history-substring-search *************"
    git clone https://github.com/zsh-users/zsh-history-substring-search.git $zsh_history_substring_search_path
else
    echo "*********** 开始更新 zsh-history-substring-search *************"
    cd $zsh_history_substring_search_path
    git pull
    cd ../..    
fi