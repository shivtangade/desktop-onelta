#!/bin/bash
SRCDIR=$(pwd)
QT5KEYDIR="/Users/Shiv/qtkeychain/install"

git checkout onelta-base

git submodule init
git submodule update

#cp client_theming/osx/dsa_pub.pem client/admin/osx/sparkle/

rm -rf build;
rm -rf install;
mkdir build
mkdir install;
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_PREFIX_PATH=/usr/local/opt/qt5 \
	-DNO_SHIBBOLETH=1 \
	-DQTKEYCHAIN_LIBRARY=$QT5KEYDIR/lib/libqt5keychain.dylib \
	-DQTKEYCHAIN_INCLUDE_DIR=$QT5KEYDIR/include/qt5keychain \
	-DOPENSSL_ROOT_DIR=/usr/local/mac-dev-env/openssl-1.1.1/ \
	-DOPENSSL_INCLUDE_DIR=/usr/local/mac-dev-env/openssl-1.1.1/include \
	-DOPENSSL_LIBRARIES=/usr/local/mac-dev-env/openssl-1.1.1/lib \
	-DCMAKE_OSX_DEPLOYMENT_TARGET=10.9 \
	-DSPARKLE_INCLUDE_DIR=/Users/Shiv/Library/Frameworks/Sparkle.framework/ \
	-DSPARKLE_LIBRARY=/Users/Shiv/Library/Frameworks/Sparkle.framework
make
make install

# The magic string here is SHA1 hash of your Developer ID Application certificate
sudo ~/1lta/desktop-onelta/admin/osx/sign_app.sh ~/1lta/desktop-onelta/install/onelta.app 8710AEF8BC018D810F7DA9C90D60F4D241094262
# The magic string here is SHA1 hash of your Developer ID Installer certificate
sudo ~/1lta/desktop-onelta/build/admin/osx/create_mac.sh ../install/ .  D868CE3CDFA8EC4AAD4DDB97151B73345D7F387C

#admin/osx/create_mac.sh ../install ./

openssl dgst -sha1 -binary < ~/1lta/desktop-onelta/install/*.tbz | openssl dgst -dss1 -sign ~/1lta/desktop-onelta/admin/osx/PubKey-oneLTA-Desktop.pem | openssl enc -base64 > ~/sig.txt
sudo mv ~/sig.txt ~/1lta/desktop-onelta/install/signature.txt
