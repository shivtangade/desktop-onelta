#!/bin/bash
SRCDIR=$(pwd)
QT5KEYDIR="/Users/Shiv/qtkeychain/install"
cd  build
#cp client_theming/osx/dsa_pub.pem client/admin/osx/sparkle/

# The magic string here is SHA1 hash of your Developer ID Application certificate
#sudo ~/1lta/desktop-onelta/admin/osx/sign_app.sh ~/1lta/desktop-onelta/install/onelta.app 74FB2413760D6407588B69F499F13514A86AE
sudo ~/1lta/desktop-onelta/admin/osx/sign_app.sh ~/1lta/desktop-onelta/install/onelta.app 8710AEF8BC018D810F7DA9C90D60F4D241094262
# The magic string here is SHA1 hash of your Developer ID Installer certificate
#sudo ~/1lta/desktop-onelta/build/admin/osx/create_mac.sh ../install/ .  1B8B3FD4A0ADCC5BF4385FA1A50F4547DE73C95E
sudo ~/1lta/desktop-onelta/build/admin/osx/create_mac.sh ../install/ .  D868CE3CDFA8EC4AAD4DDB97151B73345D7F387C

#admin/osx/create_mac.sh ../install ./

#openssl dgst -sha1 -binary < ~/1lta/desktop-onelta/install/*.tbz | openssl dgst -dss1 -sign ~/1lta/PubKey-oneLTA-Desktop.pem | openssl enc -base64 > ~/sig.txt
openssl dgst  -binary < ~/1lta/desktop-onelta/install/*.tbz | openssl dgst  -sign ~/1lta/PubKey-oneLTA-Desktop.pem | openssl enc -base64 > ~/sig.txt
sudo mv ~/sig.txt ~/1lta/desktop-onelta/install/signature.txt
