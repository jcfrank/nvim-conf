.PHONY:	cp install-py install-brew install-np install-protols install-gopls install-node install-go install-rust

default: cp install-py install-brew install-np install-protols install-gopls

cp:
	mkdir -p ~/.config/nvim
	cp init.lua ~/.config/nvim/init.lua
	cp -r lua ~/.config/nvim/lua

install-py:
	pip install -r requirements-nvim.txt

install-brew:
	brew install ripgrep cscope ctags clang-format lua-language-server

install-np:
	npm i -g yarn
	yarn global add vscode-langservers-extracted yaml-language-server prettier

install-protols:
	cargo install protols

install-gopls:
	go install golang.org/x/tools/gopls@latest

# Alternatively, can be installed from nvm.
install-node:
	brew install node

# Alternatively, can be installed from gvm.
install-go:
	brew install golang

install-rust:
	brew install rust
