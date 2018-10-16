#!/usr/bin/env bash

# Bash: echo commands, exit on error
set -x -e

cd $HOME/.dvisvgm

# Download dvisvgm if the directory is empty. (It is created by Travis-CI.)
if [ "$(ls -A)" = "" ]; then

  # Download & uncompress the tar.gz file ($DVISVGM_URL is in .travis.yml).
  curl -sL $DVISVGM_URL | tar zx
  # Move the downloaded directory.
  mv dvisvgm-*/* .
  rm -rf dvisvgm-*

  # Configure using bundled libraries and build.
  ./configure --enable-bundled-libs && make

fi

# Install.
sudo make install

# Check version.
[ "$(dvisvgm --version)" = "dvisvgm $DVISVGM_VERSION" ]
