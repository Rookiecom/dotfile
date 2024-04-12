# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pcq/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/pcq/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/pcq/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/pcq/.fzf/shell/key-bindings.zsh"
