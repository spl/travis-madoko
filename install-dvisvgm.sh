#!/usr/bin/env bash

# Create the dvisvgm cached directory if it doesn't already exist.
mkdir -p $HOME/.dvisvgm

# Download dvisvgm if the directory is empty.
if [ "$(ls -A $HOME/.dvisvgm)" = "" ]; then
  # $DVISVGM_URL is defined in .travis.yml.
  curl -sL $DVISVGM_URL | tar zx
  mv dvisvgm-* $HOME/.dvisvgm
fi

# Build and install dvisvgm.
cd $HOME/.dvisvgm
./configure && make && sudo make install
