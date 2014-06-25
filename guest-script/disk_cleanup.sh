username=$1

rm /home/$username/VBoxGuestAdditions.iso
apt-get clean
dd if=/dev/zero of=fillfile bs=1M || echo
rm fillfile
