README
---

TODO
---
- fix bspwm
	- sxhkd hotkeys
- fix delete key in terminal
- customise bar & HUD
- dotfiles
	- git
	- zsh
	- vim
	- nvim
Backburner
---
- font
	- adjusteable size
	- change to something less blocky
- extend monitors to tower desktop with xpra
- RICE
Done
---
- comb over .tmux.conf.bak from install
- comb over .zshrc.bak from install
- clipboard utliities, alias to pbcopy/pbpaste
- chromium extensions
	- cvim
	- ublock
	- res
- fix broadcom driver
	- had to install headers first - this current system is on linux-4.14 & linux 4.17
		- sudo pacman -S linux414-headers linux417-headers
	- had to install 'dkms' version of broadcom driver that will recompile to proper kernel version
		- sudo pacman -S broadcom-wl-dkms
- disable rofi on super
	- culprit was xcape config under ~/.config/bspwm/autostart
- fix scrolling directions to "Natural"
	- `Option "NaturalScrolling" "true"` in /etc/X11/xorg.conf.d/30-touchpad.conf
- match meta keys to macos layout
	- .Xmodmap
