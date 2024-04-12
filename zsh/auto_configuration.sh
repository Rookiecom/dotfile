sudo apt install zsh
sudo chsh -s /bin/zsh

sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" # oh my zsh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install # fzf install, need key to configure

git clone https://github.com/Aloxaf/fzf-tab $ZSH_CUSTOM/plugins/fzf-tab
# fzf-tab

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# p10k

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-syntax-highlighting

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-autosuggestions

git clone https://github.com/Rookiecom/dotfile.git

cp dotfile/zsh/.zshrc ~/
# 最重要的zsh 配置文件

cp -r dotfile/zsh/.zfunc ~/
# 一些命令的补全规则

cp dotfile/zsh/{.fzf-tab.zsh,.fzf.preview.content} ~/
# fzf-tab configuration

cp dotfile/zsh/lesspipe.sh /usr/local/bin/
# fzf tab preview 备用方案
