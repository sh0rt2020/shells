#!/bin/bash

# config shell session proxy
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
echo 'Do u want to config your shell session proxy for temporary?'
echo 'Like below:'
echo 'https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890'
echo 'yes? or no(default)?'
read douwant
if [ ${douwant} ] ; then
    export ${douwant}
fi

# Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    echo 'Homebrew is been installing...'
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo 'Homebrew has been installed.'
    echo 'Will execute brew update...'
    # brew update
    which brew
    brew --version
fi

echo '=================================='

# Git
which -s git
if [[ $? != 0 ]] ; then
    echo 'git is been installing...'
    brew install git
else
    echo 'git has been installed.'
    which git
    git --version
fi

echo '=================================='

# Fastlane
which -s fastlane
if [[ $? != 0 ]] ; then
    echo 'fastlane is been installing...'
    brew install fastlane
else
    echo 'fastlane has been installed.'
    which fastlane
    fastlane --version
fi

echo '=================================='

# pyenv
which -s pyenv
if [[ $? != 0 ]] ; then
    echo 'pyenv is been installing...'
    brew install pyenv
else
    echo 'pyenv has been installed.'
    which pyenv
    pyenv --version
fi

echo '=================================='

# rbenv
which -s rbenv
if [[ $? != 0 ]] ; then
    echo 'rbenv is been installing...'
    brew install rbenv
else
    echo 'rbenv has been installed.'
    which rbenv
    rbenv --version
fi

echo '=================================='

# Cocoapods
### Change gem source
echo 'Old gem sources.'
gem sources -l
gem sources --remove https://rubygems.org/
gem sources --add https://gems.ruby-china.com/
echo 'New gem sources.'
gem sources -l
sudo gem update --system
### Install Cocoapods
echo 'Which manner do you want to install cocoapods?'
echo '1: Gem(default)? 2: Homebrew?'
read choose
echo 'You choose '${choose}''

if [ ! ${choose} ] ; then
    choose='1'
fi

if [ ${choose} == '1' ] ; then
    which -s pod
    if [[ $? != 0 ]] ; then
        echo 'Cocooapods is been installing...'
        sudo gem install cocoapods
        echo 'Cocoapods will update its repo to latest.'
        pod repo list
        pod repo update
    else
        echo 'Cocoapods has been installed.'
        which pod
        pod --version
        echo 'Homebrew will upgrade cocoapods automatically to ensure cocoapods version identical.'
        sudo gem install cocoapods
    fi
else if [ ${choose} == '2' ] ; then
    which -s pod
    if [[ $? != 0 ]] ; then
        echo 'Cocooapods is been installing...'
        brew install cocoapods
    else
        echo 'Cocoapods has been installed.'
        which pod
        pod --version
        echo 'Homebrew will upgrade cocoapods automatically to ensure cocoapods version identical.'
        brew upgrade cocoapods
    fi
fi

echo '=================================='


# iTerm2
if [[ ! -e /Applications/iTerm.app ]] ; then
    echo 'iTerm2 is been installing...'
    brew cask install iterm2
    defaults delete com.googlecode.iterm2
    ln -s ./iTerm2/com.googlecode.iterm2.plist $HOME/Library/Preferences
    defaults read -app iTerm >/dev/null
else
    echo 'iTerm2 has been installed.'
fi

echo '=================================='

# Alfred (Boost your efficiency with hotkeys, keywords, text expansion and more.)
if [[ ! -e /Applications/Alfred\ 4.app ]] ; then
    echo 'Alfred is been installing...'
    brew cask install alfred
else
    echo 'Alfred has been installed.'
fi

echo '=================================='

# Fork (UI tool for git)
if [[ ! -e /Applications/Fork.app ]] ; then
    echo 'Fork is been installing...'
    brew cask install fork
else
    echo 'Fork has been installed.'
fi

echo '=================================='

# Lookin (UI debug tool)
if [[ ! -e /Applications/Lookin.app ]] ; then
    echo 'Lookin is been installing...'
    brew cask install lookin
else
    echo 'Lookin has been installed.'
fi

echo '=================================='

# Chrome
if [[ ! -e /Applications/Google\ Chrome.app ]] ; then
    echo 'Chrome is been installing...'
    brew cask install google-chrome

    # Set Chrome as default browser
    git clone https://github.com/kerma/defaultbrowser ./tools/defaultbrowser
    (cd ./tools/defaultbrowser && make && make install)
    defaultbrowser chrome
    [[ -d ./tools/defaultbrowser ]] && rm -rf ./tools/defaultbrowser
else
    echo 'Chrome has been installed.'
fi

echo '=================================='

# VSCode
if [[ ! -e /Applications/Visual\ Studio\ Code.app ]] ; then
    echo 'VSCode is been installing...'
    brew cask install visual-studio-code
    sh ./vscode/setup.sh
else
    echo 'VSCode has installed.'
fi
