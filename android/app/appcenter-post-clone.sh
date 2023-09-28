#!/usr/bin/env bash
#Place this script in project /android/app/

cd ..

# fail if any command fails
set -e
# debug log
set -x

cd ..
git clone -b refs/heads/develop https://github.com/renanvolpe/fakeStoreJoao.git
export PATH=`pwd`/flutter/bin:$PATH

flutter channel stable
flutter doctor

echo "Installed flutter to `pwd`/flutter"

flutter pub get

exit 0