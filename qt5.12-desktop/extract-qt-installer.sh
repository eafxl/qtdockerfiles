#!/bin/bash

QT_PATH=/opt/Qt
QT_VERSION=5.12.3
QT_DOWNLOAD_BASE_URL=https://download.qt.io

curl -Lo ./installer.run "${QT_DOWNLOAD_BASE_URL}/official_releases/qt/$(echo "${QT_VERSION}" | cut -d. -f 1-2)/${QT_VERSION}/qt-opensource-linux-x64-${QT_VERSION}.run"

chmod +x ./installer.run

export QT_VER=$(echo "${QT_VERSION}" | tr -d .)

./installer.run -platform minimal --verbose --script /tmp/qt/qt-installer-noninteractive.qs 

find "$QT_PATH" -mindepth 1 -maxdepth 1 ! -name "${QT_VERSION}" -exec echo 'Cleaning Qt SDK: {}' \; -exec rm -r '{}' \;

./tmp/qt/install-linuxdeployqt.sh
rm -rf /tmp/qt
