dmg_filename=VirtualBox-4.3.0-89960-OSX.dmg
base_url=http://download.virtualbox.org/virtualbox/4.3.0/

cd
curl -OL $base_url/$dmg_filename
hdiutil mount $dmg_filename
sudo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target "/Volumes/Macintosh HD"
hdiutil unmount /Volumes/VirtualBox
