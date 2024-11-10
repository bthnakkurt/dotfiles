#!/usr/bin/bash

USER_NAME=$(whoami)

home_dir="/home/$USER_NAME"
config=$home_dir/.config
theme=$home_dir/.local/share/themes
icons=$home_dir/.local/share/icons
fonts=$home_dir/.local/share/fonts
appshortcut=$home_dir/.local/share/applications
app=/home/$USER_NAME/.local/share/app
ask="Dark or Light? (D or L)\ninstall themes?(press i)\ninstall needed apps?(press y)\nneeded apps?(press n)"




function installapps() {
    mkdir -p $appshortcut
    mkdir -p $app
    mkdir -p $home_dir/Downloads/
    # YOUTUBE MUSIC INSTALL
    rm -rf $appshortcut/youtube-music.desktop
    rm -rf $app/youtube-music
    wget -P /home/$USER_NAME/Downloads -nc https://github.com/th-ch/youtube-music/releases/download/v3.6.2/YouTube-Music-3.6.2.AppImage
    chmod +x $home_dir/Downloads/YouTube-Music-3.6.2.AppImage
    /home/$USER_NAME/Downloads/YouTube-Music-3.6.2.AppImage --appimage-extract
    mv $(pwd)/squashfs-root $app/youtube-music
    sed -i "s|Exec=AppRun --no-sandbox %U|Exec=$app/youtube-music/youtube-music|" "$app/youtube-music/youtube-music.desktop"
sed -i "s|Icon=youtube-music|Icon=$app/youtube-music/youtube-music.png|" "$app/youtube-music/youtube-music.desktop"
    cp $app/youtube-music/youtube-music.desktop /home/$USER_NAME/.local/share/applications/
    ## ferdium install

}

function installtheme() {
    mkdir -p $theme
    mkdir -p $icons
    cp -r $config/res/themes/Catppuccin-Latte-Standard-Rosewater-Light $theme
    cp -r $config/res/themes/Catppuccin-Mocha-Standard-Rosewater-Dark $theme
    cp -r $config/res/icons/catppuccin-latte-rosewater-cursors $icons
    cp -r $config/res/icons/catppuccin-mocha-rosewater-cursors $icons
    cp -r $config/res/font/ $fonts
    fc-cache -fv
}

function darktheme () {
    cp $config/bat/config-mocha $config/bat/config
    cp $config/kitty/kitty-mocha.conf $config/kitty/kitty.conf
    cp $config/nvim/lua/bai/plugins/catppuccin-mocha.lua1 $config/nvim/lua/bai/plugins/catppuccin.lua
    cp $config/qt5ct/qt5ct-mocha.conf $config/qt5ct/qt5ct.conf
    cp $config/qt6ct/qt6ct-mocha.conf $config/qt6ct/qt6ct.conf
    cp $config/rofi/catppuccin-mocha.rasi $config/rofi/config.rasi
    rm -rf $icons/default
    ln -s $icons/catppuccin-mocha-rosewater-cursors $icons/default
    cp $config/gtk-4.0/settings-mocha.ini $config/gtk-4.0/settings.ini
    cp $config/gtk-3.0/settings-mocha.ini $config/gtk-3.0/settings.ini
    cp $config/res/Xresources-mocha.conf $config/res/Xresources
}

function lighttheme () {
    cp $config/bat/config-latte $config/bat/config
    cp $config/kitty/kitty-latte.conf $config/kitty/kitty.conf
    cp $config/nvim/lua/bai/plugins/catppuccin-latte.lua1 $config/nvim/lua/bai/plugins/catppuccin.lua
    cp $config/qt5ct/qt5ct-latte.conf $config/qt5ct/qt5ct.conf
    cp $config/qt6ct/qt6ct-latte.conf $config/qt6ct/qt6ct.conf
    cp $config/rofi/catppuccin-latte.rasi $config/rofi/config.rasi
    rm -rf $icons/default
    ln -s $icons/catppuccin-latte-rosewater-cursors $icons/default
    cp $config/gtk-4.0/settings-latte.ini $config/gtk-4.0/settings.ini
    cp $config/gtk-3.0/settings-latte.ini $config/gtk-3.0/settings.ini
    cp $config/res/Xresources-latte.conf $config/res/Xresources
}

echo -e "$ask"
read output

if [[ "$output" == "d" ]] || [[ "$output" == "D" ]] ; then
    darktheme
elif [[ "$output" == "l" ]] || [[ "$output" == "L" ]] ; then
    lighttheme
elif [[ "$output" == "i" ]] ; then
    installtheme
elif [[ "$output" == "y" ]] ; then
    installapps
else
    echo "düzgün gir"
fi

