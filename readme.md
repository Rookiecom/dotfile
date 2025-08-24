# ZSH 配置

基础配置

现在仅仅限于ubuntu/debian

```shell
sh -c "$(wget https://raw.githubusercontent.com/Rookiecom/dotfile/main/zsh/auto_configuration.sh -O -)"
```

进阶配置

有些美化配置必须要安装bat lsd这种，所以依次执行下面的命令

```shell
curl https://sh.rustup.rs -sSf | sh

cargo install --locked bat lsd xsv

# chafa exiftool in2csv ignore

# 配置man的美化， 可以整体执行，直到 eof
cat <<'EOF' >> ~/.config/terminal/.env

# man beautiful
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
EOF
```