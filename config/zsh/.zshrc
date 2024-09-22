source "$HOME/.functions.zsh"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Aliases
alias a='php artisan'
alias am='php artisan migrate'
alias amf='php artisan migrate:fresh'
alias amfs='php artisan migrate:fresh --seed'

alias pest='./vendor/bin/pest'
alias pint='./vendor/bin/pint'
alias phpstan='./vendor/bin/phpstan'
alias ccache='composer dump && sail artisan optimize:clear'

alias ls='lsd'
alias ll='lsd -lh'
