sudo -v
sudo apt update 
sudo apt install -y zsh
sudo apt install -y git curl

# oh my zsh
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# get dotfile
git clone --depth=1 https://github.com/Rookiecom/dotfile.git

# fzf install 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --update-rc
cp ~/.fzf.zsh ~/.config/terminal/.fzf.zsh
rm ~/.fzf.zsh ~/.fzf.bash

# fzf-tab
git clone --depth=1 https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab

# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# copy zshrc
cp dotfile/zsh/.zshrc ~/

# create config folder
mkdir -p ~/.config/terminal

# copy config files
cp dotfile/zsh/.env ~/.config/terminal/.env
cp dotfile/zsh/.p10k.zsh ~/.config/terminal/.p10k.zsh
cp dotfile/zsh/.fzf-tab.zsh ~/.config/terminal/.fzf-tab.zsh
cp dotfile/zsh/.fzf.preview.content ~/.config/terminal/.fzf.preview.content

# fzf tab preview tool
sudo cp dotfile/zsh/lesspipe.sh /usr/local/bin/

rm -rf dotfile

# set zsh as default shell
# 这里可能出错
chsh -s $(which zsh)

exec zsh