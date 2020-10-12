# If you come from bash you might have to change your $PATH.
export PATH="$PATH:/usr/local/sbin"

# Path to your oh-my-zsh installation.
export ZSH="/Users/***/.oh-my-zsh"

# theme
ZSH_THEME="agnoster"

#plugins
plugins=(
    git
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# aliases
 alias zshconfig="mate ~/.zshrc"
 alias ohmyzsh="mate ~/.oh-my-zsh"
 alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
 alias xcode="/Applications/Xcode.app/Contents/MacOS/Xcode"

 # fastlane
alias flaw="fastlane local_appstore username:'x' password:'x'"
alias flac="fastlane local_appstore username:'***' password:'***'"
alias fle="fastlane local_enterprise"
alias fivn="fastlane run increment_version_number version_number:"
alias fibn="fastlane run increment_build_number build_number:"

# git
alias gp="git push"
alias gpl="git pull"
alias gre="git pull --rebase"
alias gs="git status"
alias gdi="git diff"
alias gl="git log --oneline --graph"
alias gcl="git clean -xdf"
alias grpo="git remote prune origin"
alias gfs="git flow feature start"
alias grs="git flow release start"
alias ghs="git flow hotfix start"
alias gc="git checkout"
alias gbd="git branch -d"
alias gbD="git branch -D"
alias gpo="git push origin :"
alias gpso="git push --set-upstream origin"

# pod
alias pru="pod repo update iTutorSpecs"
alias pin="pod install --clean-install"
alias pinn="pod install --clean-install --no-repo-update"
alias pup="pod update"
alias pde="pod deintegrate"
alias pout="pod outdated --no-repo-update"

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#plugins
source /Users/***/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
