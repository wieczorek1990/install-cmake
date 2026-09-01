#!/bin/sh
# Installer.

name="cmake"
version="4.4.3"
soute_artifact="${name}-${version}"
artifact="${soute_artifact}.zip"

url="https://github.com/Kitware/CMake/releases/download/v${version}/${artifact}"

echo "Downloading..."
curl -O -L "${url}"
echo "Downloaded."

echo "Unpacking..."
unzip "${soute_artifact}" >/dev/null
echo "Unpacked."

echo 'Compiling...'
cd "${soute_artifact}"
mkdir -p build && cd build
../bootstrap -- -DCMAKE_INSTALL_PREFIX=~/.local -DCMAKE_USE_OPENSSL=OFF &&
    make &&
    make install
cd - >/dev/null
echo 'Done compiling.'
