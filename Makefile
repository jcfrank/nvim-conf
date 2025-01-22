.PHONY:	install-py install-brew install-np install-cargo install-node install-go install-rust

default: install-py install-brew install-np install-cargo

install-py:
	pip install -r requirements-nvim.txt

install-brew:
	brew install ripgrep cscope ctags clang-format lua-language-server

install-np:
	npm i -g yarn
	yarn global add vscode-langservers-extracted yaml-language-server prettier

install-cargo:
	cargo install protols

# Alternatively, can be installed from nvm.
install-node:
	brew install node

# Alternatively, can be installed from gvm.
install-go:
	brew install golang

install-rust:
	brew install rust
