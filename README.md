# DWM dotfile by itRoy

# Step 1
```
git clone https://github.com/itRoy-pentest/dwm_dotfile.git
```

# Step 2
```
cp -r dwm dwm-bar picom rofi-themes-collection ~/.config
```

# Step 3
Go to the `~/.config/dwm` folder, remove `config.h`, then execute `sudo make clean install`

Go to the `~/.config/dwm-bar`, then execute `sudo make clean install`

# Step 4
Create `~/.xsession`

Add to the `~/.xsession`:
```
setxkbmap -layout "us,ru" -option "grp:win_space_toggle" &

feh --bg-fill ~/Pictures/wallpaper/car.jpg &

picom &

slstatus &

exec dwm
```
