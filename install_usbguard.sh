#!/bin/zsh

printf "Installing oh my zsh"
sudo pacman -S --noconfirm usbguard -y

printf "Generating fresh usb policy to avoid lockout"
sudo usbguard generate-policy | sudo tee /etc/usbguard/rules.conf > /dev/null

printf "Configure policy kit"
sudo cat << 'EOF' | sudo tee /etc/polkit-1/rules.d/70-allow-usbguard.rules > /dev/null
// Allow users in wheel group to communicate with USBGuard
polkit.addRule(function(action, subject) {
    if ((action.id == "org.usbguard.Policy1.listRules" ||
         action.id == "org.usbguard.Policy1.appendRule" ||
         action.id == "org.usbguard.Policy1.removeRule" ||
         action.id == "org.usbguard.Devices1.applyDevicePolicy" ||
         action.id == "org.usbguard.Devices1.listDevices" ||
         action.id == "org.usbguard1.getParameter" ||
         action.id == "org.usbguard1.setParameter") &&
        subject.active == true && subject.local == true &&
        (subject.isInGroup("wheel") || subject.user == "gdm")) {
            return polkit.Result.YES;
    }
});
EOF
sudo systemctl restart polkit.service

printf "Activate gnome protections"
gsettings set org.gnome.desktop.privacy usb-protection true
gsettings set org.gnome.desktop.privacy usb-protection-level always

printf "Install gnome integration"
sudo pacman -S --noconfirm python-{gobject,pyparsing}
pip install pygobject pyparsing
git clone https://github.com/6E006B/usbguard-gnome.git
python -m compileall usbguard-gnome
sudo cp -r usbguard-gnome /opt
sudo cp /opt/usbguard-gnome/usbguard* /usr/share/applications/
sudo cp /opt/usbguard-gnome/src/org.gnome.usbguard.gschema.xml /usr/share/glib-2.0/schemas
sudo glib-compile-schemas /usr/share/glib-2.0/schemas
sudo systemctl enable --now usbguard
sudo systemctl enable --now usbguard-dbus

cat << 'EOF' | tee ${HOME}/.config/autostart/usbguard-applet.desktop > /dev/null
#!/usr/bin/env xdg-open

[Desktop Entry]
Categories=System;
Comment=
Exec=python /opt/usbguard-gnome/src/usbguard_gnome_applet.py
Icon=usbguard-icon
Keywords=USB;USBGuard;
Name=USBGuard Applet
NoDisplay=false
Path=
StartupNotify=true
StartupWMClass=
Terminal=false
TryExec=
Type=Application
Version=1.0
EOF
