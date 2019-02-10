#!/bin/bash
SRCDIR=$(pwd)
rm -rf build;
rm -rf install;
mkdir build
mkdir install;
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install \
	-DCMAKE_BUILD_TYPE=Debug \
	-DCMAKE_PREFIX_PATH=/usr/local/opt/qt5 \
	-DNO_SHIBBOLETH=1 \
	-DQTKEYCHAIN_LIBRARY=/Users/Shiv/mdesk/qtkeychain/install/lib/libqt5keychain.dylib \
	-DQTKEYCHAIN_INCLUDE_DIR=/Users/Shiv/mdesk/qtkeychain/install/include/qt5keychain/ \
	-DOPENSSL_ROOT_DIR=/usr/local/mac-dev-env/openssl-1.1.1/ \
	-DOPENSSL_INCLUDE_DIR=/usr/local/mac-dev-env/openssl-1.1.1/include \
	-DOPENSSL_LIBRARIES=/usr/local/mac-dev-env/openssl-1.1.1/lib
make
make install
admin/osx/create_mac.sh ../install ./

