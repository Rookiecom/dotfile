# set default fzf configure
# export FZF_DEFAULT_OPTS="--height 12 --layout=reverse"
# export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist,vendor,go} --type f"

# use tmux display
# zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# different color for different group, git tab has nice effect
zstyle ':completion:*:descriptions' format '[%d]'

# set preview windows height
zstyle ':fzf-tab:complete:*:*' fzf-flags --height=25
# give a preview of commandline arguments when completing `kill`
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview \
 ' [[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# show systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# show dictionary file and the special
zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
export LESSOPEN='|~/.config/terminal/.fzf.preview.content %s'
# set option(-|--)has no preview-window,but the options is provided from the completion file 
# which means that if the file doesn't provided the options or argument-1,this configuration has no effect
zstyle ':fzf-tab:complete:*:options' fzf-preview 
# zstyle ':fzf-tab:complete:*:argument-1' fzf-preview
# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

# git
# it is an example. you can change it
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
  zstyle ':fzf-tab:complete:(git-checkout|git-switch):*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'


# add by myself
zstyle ':fzf-tab:complete:cargo:*' fzf-preview \
  ' cargo help $word | bat -plman --color=always ' 


zstyle ':fzf-tab:complete:go:*' fzf-preview \
  ' go help $word | bat -plman --color=always ' 

zstyle ':fzf-tab:complete:docker:*' fzf-preview \
  ' docker $word --help | bat -plman --color=always '
