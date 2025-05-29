# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=100000
bindkey -v
source <(fzf --zsh)
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/user_one/.zshrc'

# fzf use fd

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'



autoload -Uz compinit
compinit
# End of lines added by compinstall
alias ls="lsd --group-dirs first"
alias ll="lsd -lah --group-dirs first"
alias la="lsd -ah --group-dirs first"
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias myv='NVIM_APPNAME="nvim-kickstart" nvim'
alias uv='NVIM_APPNAME="ultimate-neovim" nvim'

 			function	svi() {		uv "$(fzf)"  ;		}

			function    warp() {	cd "$(find -type d | fzf)" ;						}
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
#PROMPT=' %(?.%F{34}✓.%F{red}⏺)%f %F{165}%n%f %F{214}>%f %F{47}%2d%f %F{red}${vcs_info_msg_0_}%f%F{220}$%f '

function zle-keymap-select {
    case $KEYMAP in 
        vicmd) RPROMPT='%F{red}[N]%f';;
        main|viins) RPROMPT='%F{green}[I]%f';;
    esac
    zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-init {
    zle-keymap-select
}
zle -N zle-line-init

#RPROMPT="test"

PROMPT=$' %(?.%F{34}✓.%F{red}⏺)%f %F{209}%n%f %F{222}>%f %F{36}%~%f %F{red}${vcs_info_msg_0_}%f%F{222}$%f\n%F{222} >%f '

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

export PHP_CS_FIXER_IGNORE_ENV=1
