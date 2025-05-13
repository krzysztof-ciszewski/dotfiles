#!/bin/sh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install atuin \
	awscli \
	awscli-local \
	composer \
	coreutils \
	docker \
	docker-compose \
	fasd_fork \
	git-delta \
	htop \
	jq \
	koekeishiya/formulae/skhd \
	mysql \
	mysql-client \
	neovim \
	php-cs-fixer \
	php@8.2 \
	psysh \
	stow \
	tldr \
	tree \
	wget

brew install --cask alacritty \
    balenaetcher \
	discord \
	jetbrains-toolbox \
	localsend \
	stats \
	betterdisplay \
	karabiner-elements \
	prefs-editor \
	spotify


cd ~/dotfiles && stow .
