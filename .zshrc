# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# ZSH_THEME="m3-round"
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="aether"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git  zsh-syntax-highlighting zsh-autosuggestions bgnotify z zsh-completions zsh-vi-mode fzf docker docker-compose conda-zsh-completion)

source $ZSH/oh-my-zsh.sh
export FZF_BASE='~/.fzf'
source ~/.fzf.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

bindkey -s \^f "tmux-sessionizer\n"
autoload -U compinit && compinit
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
#alias ls="colorls --sd -A"
alias ls="lsd --color=auto"
alias la="lsd -la --color=auto"
alias ll="lsd -l --color=auto"
alias rm="rm -I"
alias pls="sudo"
alias c='xclip -sel clip'
alias sc='find ~/scripts/utility -iname "*.sh" | fzf | bash'
alias nc="fd . ~/.config -E 'VSCodium' -E sportify -E Bitwarden  -E BraveSoftware -E discord -E '*.png' -E 'Code*' -E chromium -E 'awesome-back*' --type=file | fzf --color=dark| xargs -r nvim"
alias mv='mv -vi'
alias icat='kitty +kitten icat'
alias cp='cp -vi'
alias mutter-settings='gjs ~/Templates/gtk-themes/mutter-rounded-setting/dist/mutter_settings.js'
alias mvol='zsh /home/rifqoi/Scripts/microphone-vol.sh'
alias pl='pulsemixer -l'
alias sfz='source ~/.fzf.zsh'

alias sk='kitty +kitten ssh'
alias tmux="env TERM=screen-256color tmux"

# Tmux
alias ta='tmux attach'
alias ts='tmux-sessionizer'

# Export
path+=('/home/rifqoi/.local/bin')
path+=('/home/rifqoi/.cargo/bin')
path+=('/home/rifqoi/.config/lua-language-server/bin/')
path+=('/home/rifqoi/go/bin/')
path+=('/home/rifqoi/.rbenv/bin')
export PATH
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -f -g "" 2>/dev/null'
# export FZF_ALT_C_COMMAND='find .'
# export FZF_CTRL_T_COMMAND='ag --hidden --ignore .git --ignore-dir .local  -f -g "" 2>/dev/null'
export XDG_CONFIG_HOME=$HOME/.config
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export QT_QPA_PLATFORMTHEME='gnome'
export PRETTIERD_DEFAULT_CONFIG=~/.config/nvim/.prettierrc.json
eval "$(rbenv init -)"
eval $(thefuck --alias)




#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# COmpletions to hidden files
zstyle ':completion:*' file-patterns '%p(D):globbed-files *(D-/):directories' '*(D):all-files'

#_comp_options+=(globdots) #include hidden files

# Wal Install
#(cat ~/.cache/wal/sequences &)

# Source

export PATH="$PATH:$HOME/.spicetify"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias luamake=/home/rifqoi/.config/lua-language-server/3rd/luamake/luamake
