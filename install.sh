echo "VoodooHDAInstaller"

rm -rf __MACOSX
rm -rf VoodooHDA*

echo "Downloading VoodooHDA.kext..."
curl -sSL https://github.com/CloverHackyColor/VoodooHDA/releases/latest/download/VoodooHDA.kext-302.zip -o VoodooHDA.kext.zip
unzip VoodooHDA.kext.zip
echo "Downloading VoodooHDA.prefPane"
curl -sSL https://github.com/CloverHackyColor/VoodooHDA/releases/latest/download/VoodooHDA.prefPane.zip -o VoodooHDA.prefPane.zip
unzip VoodooHDA.prefPane.zip
echo "Installing VoodooHDA..."

sudo spctl --master-disable
sudo xattr -c VoodooHDA.kext

sudo rm -rf /Library/Extensions/VoodooHDA.kext
sudo rm -rf /Library/PreferencePanes/VoodooHDA.prefPane

sudo cp -R VoodooHDA.kext /Library/Extensions
sudo cp -R VoodooHDA.prefPane /Library/PreferencePanes

echo "Make sure to allow the permission on Settings > Privacy & Security."
echo "Make sure to remove AppleALC before doing a reboot."
echo "Please reboot to apply the VoodooHDA."