# Initialize completion for zsh
autoload -U compinit; compinit

# Add completion settings
zstyle ":completion:*" menu select

# add path to prompt named pure
fpath+=($HOME/.config/zsh/pure)

# Initialize prompt
autoload -U promptinit; promptinit

# load and change color of the path
zmodload zsh/nearcolor
zstyle :prompt:pure:path color "87ffd7"

# Change color of prompt
zstyle ":prompt:pure:prompt:*" color "#87ff63"

# Change prompt symbol
PURE_PROMPT_SYMBOL=">"

prompt pure

# Add bd to jump to parent plugin
# type bd a where a is parent that you want to jump to
source $ZDOTDIR/plugins/bd.zsh

# Make it possbile to use ctrl + right and ctrl + left to jump through words
typeset -g -A key
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

[[ -n "${key[Control-Left]}"  ]] && bindkey -- "${key[Control-Left]}"  backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

# Export java
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH=$JAVA_HOME/bin:$PATH

# Source aliases
source ~/.config/zsh/.aliases
