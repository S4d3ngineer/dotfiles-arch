`I will be placing my current config inside this repository. Its main purpose is to serve me as backup option and I don't plan, for now, to give detailed instruction on how to achieve setup identical to mine.
However I decided to attach my Obsidian notes related to my Arch Linux experience so far. The might be pretty rough, but I might update them in the future as my Arch Linux journey continues.`

# Additional notes to help with smoother installation
One who tries to install Arch linux should read the official Arch wiki content about installation and also about dual boot if one will be installing Arch in such mode with Windows for example. Arch wiki is best source of information and other sources should be only supplementary, because author might made mistake or show some outdated methods in steps of installation guide.
However reading other guides might be helpful to  understand certain parts of installation.
This chapter contains only some additional notes to assist installation that I myself found helpful. Other chapters contain additional info about some troubleshooting and post-installation system configuration.

### Useful guides
[Official install guide on arch wiki](https://wiki.archlinux.org/title/installation_guide)
https://www.freecodecamp.org/news/how-to-install-arch-linux/
https://www.youtube.com/watch?v=JRdYSGh-g3s
[How to use yay](https://www.youtube.com/watch?v=EYiN8vDkacc)
[Some furry's guide to ricing idk](https://github.com/ibrahimbutt/direwolf-arch-rice)

### Useful links
https://wiki.archlinux.org/title/Unified_Extensible_Firmware_Interface#Windows_changes_boot_order
[Reinstall grub](https://sangams.com.np/how-to-restore-reinstall-grub-bootloader-in-arch-linux/)

### Preparation
- Make some space to shrink: [this](https://superuser.com/questions/1403035/why-is-the-size-of-available-shrink-space-is-only-13286-mb-on-250-gb-samsung-ssd) and [this](https://www.youtube.com/watch?v=hf8qbwp78gA)
- [Disable secure boot](https://www.youtube.com/watch?v=vurIhOhTF0A)
- Disable fast startup
- DEL or F2 to enter BIOS
- F11 for boot menu (for MSI)

### Setting up WiFi connection during system installation:
https://www.youtube.com/watch?v=3zqITuprlL8

### Assigning disk space for Arch
- If you are setting up dual boot, there is no need to create EFI system partition as it should be already created
- You don't have to assign SWAP if you feel like you have enough RAM (but note that you will need at least RAM equivalent of SWAP memory size if you want to use hibernate)
- EXT4 might not be the best idea if you're sharing drive with other operating systems, so it's best to use FAT32 instead (except when you don't plan to use files from linux disk space on windows, thus I think it's better to stick with EXT4 as it uses journaling system)
- Make sure that EFI partition is mounted to /efi when you list partitions!

#### What is fstab?
File used to define how partitions should be mounted

### Specifying basic packages to install 
- ==**base, linux & linux-firmware** are a must have==
- **base-devel** to be able to use AUR and **networkmanager** to automatically connect to network
- **sudo** to be able to execute commands as a root user and **vim** (or other text editor)

For more check [[Arch Linux#Configuration after install | this chapter]].

### Adding new user
Now only wheel is needed to have admin privileges. Some tutorials will say that storage and power is needed, but wiki says that power is no longer used group and storage is also no longer useful for most users :
>"Used to gain access to removable drives such as USB hard drives, flash/jump drives, MP3 players; enables the user to mount storage devices.
Now solely for direct access to tapes if no custom udev rules is involved" 

# Configuration after install
I am not explaining anything related to desktop environments as I am not using one. Desktop environment contains many graphical user interface programs such as window manager, file explorer, app launcher and many many more. I am installing only the pieces of software that I want and need, which - keep that in mind - makes the whole process more difficult but you can therefore achieve more custom and bloatware-free environment in the process. You should be able to swap some pre-installed software on desktop environment, but I suspect, that some combinations of software for your graphical environment might be hard to put together.

## Display Server
Without it you won't be able to enter graphical environment.
You can specify commands and software to launch on display server start. In Xorg you can do this by modifying ~/.xinitrc file. You should add your custom dpi setting in this file and add launch commands for your graphical environment programs like window manager (compositor might be launched from window manager itself, or specifically its config).

## Fonts
==You need== to install some fonts before enter your graphical environment and I recommend ttf font type for better scaling as they are outline/vector? fonts. You can never go wrong with ttf-ms-win10 package and nerd-fonts. Ttf-dejavu also seem to be pretty popular.

## Window Manager
There are many types of window managers. Before choosing window manager one should read about managements styles, list-based and tree-based window managers. I recommend sticking to ones that are well documented, easy to configure and allows to use your own bar or swap existing one without any problems because it is good to be able to have graphical environment components that are easy to swap and doesn't break rest of the setup.

## Terminal Emulator
You need some pretty terminal emulator which should be assigned to chosen keybinding inside your window manager config. I recommend Kitty or Alacritty. 

## Audio
Out of the box Arch contains software related to audio and media controlling/playing such as Alsa driver and PulseAudio sound server. However initial software is not free of problems. Don't try to spend too much time fixing them. Just install PipeWire which is "low-level multimedia framework" as arch wiki states. [Link to wiki](https://wiki.archlinux.org/title/PipeWire)

## Bar
Check if bar you chose is compatible with your window manager (e.g. if it can display workspaces correctly). Unless of course it is built in into your window manager.
Some bar comes with may widgets used to monitor system resources etc. out of the box or allow to install them with ease and some might cause you some problems in this area, so do some research before choosing the right bar for you. The bar of my choice is Polybar as it has many good widgets, it is easy to configure and is pretty popular, meaning you will get better support if you were to encounter any problems.

## Compositor 
Some window managers might have this by default. It enables animation, transparency and more.

## AUR helper (optional)
==TODO==

# My rice stack of choice
- Display server: xorg (install also xorg-init  [Configuring window manager to boot with xinit](https://www.youtube.com/watch?v=pouX5VvX0_Q))
- Window manager: I3 (easy config and no problem to add Polybar)
- Compositor: Picom [config](https://www.youtube.com/watch?v=qKtit_B7Keo)
- Terminal Emulator: Kitty 
- Bar: Polybar
- App Launcher: Rofi
