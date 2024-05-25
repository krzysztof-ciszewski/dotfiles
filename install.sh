#!/bin/sh

sudo pacman -Sy --needed \
	firefox \
	neovim \
	zsh \
	atuin \
	fasd \
	git \
	git-delta \
	stow \
	bat \
	gnupg \
	jq \
	php \
	composer \
	wget \
	curl \
	alacritty \
	docker \
	discord \
	obs-studio \
	steam \
	lib32-mesa \
	lib32-vulkan-radeon \
	libva-mesa-driver \
	mesa \
	mesa-utils \
	mesa-vdpau \
	vulkan-radeon \
	xf86-video-amdgpu \
	bluez \
	bluez-utils \
	pipewire \
	pipewire-alsa \
	pipewire-jack \
	pipewire-pulse \
	wireplumber \
	brightnessctl \
	wl-clipboard \
	exa \
	mako \
	foot \
	swappy \
	ttf-jetbrains-mono-nerd \
	network-manager-applet \
	mpv \
	waybar

yay -Sy --needed \
	microsoft-edge-stable-bin \
	php-pear \
	symfony-cli \
	jetbrains-toolbox \
	bingwall-git \
	spotify \
	swhdk \
	rofi-lbonn-wayland-git

if [ "${SHELL#*"zsh"}" == "$SHELL" ]; then
	chsh -s $(which zsh)
fi

cd ~/dotfiles && stow .
