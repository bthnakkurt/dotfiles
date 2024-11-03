#!/usr/bin/bash

config=~/.config/
theme=~/.local/share/themes/
icons=~/.local/share/icons/
fonts=~/.local/share/fonts/
ask="Dark or Light? (D or L)\n install themes?(press i)"

function installtheme() {
    mkdir -p $theme
    mkdir -p $icons
    cp -r $config/res/themes/Catppuccin-Latte-Standard-Rosewater-Light $theme
    cp -r $config/res/themes/Catppuccin-Mocha-Standard-Rosewater-Dark $theme
    cp -r $config/res/icons/catppuccin-latte-rosewater-cursors $icons
    cp -r $config/res/icons/catppuccin-mocha-rosewater-cursors $icons
    cp -r $config/res/fonts/ $fonts
    fc-cache -fv
}

function darktheme () {
    cp $config/bat/config-mocha $config/bat/config
    cp $config/kitty/kitty-mocha.conf $config/kitty/kitty.conf
    cp $config/nvim/lua/bai/plugins/catppuccin-mocha.lua1 $config/nvim/lua/bai/plugins/catppuccin.lua
    cp $config/qt5ct/qt5ct-mocha.conf $config/qt5ct/qt5ct.conf
    cp $config/qt6ct/qt6ct-mocha.conf $config/qt6ct/qt6ct.conf
    cp $config/rofi/catppuccin-mocha.rasi $config/rofi/config.rasi
    cp $config/res/background/b.png $config/awesome/themes/default/background.png
    rm -rf $icons/default
    ln -s $icons/catppuccin-mocha-rosewater-cursors $icons/default
    cp $config/gtk-4.0/settings-mocha.ini $config/gtk-4.0/settings.ini
    cp $config/gtk-3.0/settings-mocha.ini $config/gtk-3.0/settings.ini
    cp $config/gtk-2.0/gtk-mocha ~/.gtkrc-2.0
    cp $config/res/Xresources-mocha.conf $config/res/Xresources
}

function lighttheme () {
    cp $config/bat/config-latte $config/bat/config
    cp $config/kitty/kitty-latte.conf $config/kitty/kitty.conf
    cp $config/nvim/lua/bai/plugins/catppuccin-latte.lua1 $config/nvim/lua/bai/plugins/catppuccin.lua
    cp $config/qt5ct/qt5ct-latte.conf $config/qt5ct/qt5ct.conf
    cp $config/qt6ct/qt6ct-latte.conf $config/qt6ct/qt6ct.conf
    cp $config/rofi/catppuccin-latte.rasi $config/rofi/config.rasi
    cp $config/res/background/goodvoid.png $config/awesome/themes/default/background.png
    rm -rf $icons/default
    ln -s $icons/catppuccin-latte-rosewater-cursors $icons/default
    cp $config/gtk-4.0/settings-latte.ini $config/gtk-4.0/settings.ini
    cp $config/gtk-3.0/settings-latte.ini $config/gtk-3.0/settings.ini
    cp $config/gtk-2.0/gtk-latte ~/.gtkrc-2.0
    cp $config/res/Xresources-latte.conf $config/res/Xresources

    
}

echo "$ask"
read output


if [[ "$output" == "d" ]] || [[ "$output" == "D" ]] ; then
    darktheme
elif [[ "$output" == "l" ]] || [[ "$output" == "L" ]] ; then
    lighttheme
elif [[ "$output" == "i" ]] ; then
    installtheme
else
    echo "düzgün gir"
fi

