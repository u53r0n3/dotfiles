# Lines configured by zsh-newuser-install
#[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

LANG="en_US.UTF-8"
PATH="$HOME/.local/bin${PATH:+:${PATH}}"
export EDITOR="vim"
export TERMINAL="alacritty"
[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh
f() {
    fff "$@"
    cd "$(cat "${XDG_CACHE_HOME:=${HOME}/.cache}/fff/.fff_d")"
}

xdg-mime default pcmanfm.desktop inode/directory

export PF_INFO="ascii title os host kernel uptime pkgs memory palette"

export NNN_TRASH=1
#export MICRO_TRUECOLOR=1
export EXA_ICON_SPACING=2
export SUDO_ASKPASS="/home/user_one/.local/bin/dpass"
#source /usr/share/zsh/scripts/zplug/init.zsh
#source /home/user_one/.local/bin/extract
#zplug "dracula/zsh", as:theme
source /usr/share/fzf/fzf-extras.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
alias ls="exa  --color=always --group-directories-first"
alias la="exa -a --color=always --group-directories-first"

alias ll="exa -al --color=always --group-directories-first --icons"
alias sn="shutdown now"
alias mi="micro"
#alias kitty="kitty && wal -i '/home/user_one/wallpapers/wall22.jpg'"
alias bh="cd ~/"
alias sps="sudo pacman -S"
alias pss="pacman -Ss"
alias pas="paru -S"
alias pass="paru -Ss"
alias vi="vim"
alias p="sxiv -t *"
alias rx="xrdb ~/.Xresources"
alias ra="ranger"
alias psp="procs"
alias h="source ~/.zshrc"
alias ala.conf="vim ~/.config/alacritty/alacritty.yml"
alias sxh.conf="vim ~/.config/sxhkd/sxhkdrc"
 			function	svi() {		vim "$(fzf)"  ;		}

			function    warp() {	cd "$(find -type d | fzf)" ;						}

if [ "$TERM" = "linux" ]; then
        printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
        printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
        printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
        printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
        printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
        printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
        printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
        printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
        printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
        printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
        printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
        printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
        printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
        printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
        printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
        printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
        printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
        printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
        clear
fi

pfetch
#autoload -Uz vcs_info # enable vcs_info
#precmd () { vcs_info } # always load before displaying the prompt
#zstyle ':vcs_info:*' formats ' %s(%F{red}%b%f)' # git(main)

#PS1='%n@%m %F{red}%/%f$vcs_info_msg_0_ $ ' # david@macbook /tmp/repo (main) $

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi


#PS1=' %B%F{red}%n%f@%F{005}%m%f.%F{136}%1~ %f%b$ ' 
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_FIND_NO_DUPS
setopt hist_ignore_all_dups
setopt autocd extendedglob nomatch
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

#zstyle ':completion:*' verbose yes
#zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
#zstyle ':completion:*' completions 1
#zstyle ':completion:*' expand suffix
#zstyle ':completion:*' glob 1
#zstyle ':completion:*' list-suffixes true
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[`.'\'']=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' max-errors 2
#zstyle ':completion:*' substitute 1
#zstyle :compinstall filename '/home/user_one/.zshrc'

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.


#autoload -Uz compinit
#compinit


# End of lines added by compinstall
source /home/user_one/git/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
