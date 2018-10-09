#!/usr/bin/env bash

set -e

# Download dvisvgm if the directory does not exist or is empty.
if [ ! -d $HOME/.dvisvgm ] || [ "$(ls -A $HOME/.dvisvgm)" = "" ]; then
  # Remove the directory if it exists.
  rm -f $HOME/.dvisvgm
  # Download & uncompress the tar.gz file ($DVISVGM_URL is in .travis.yml).
  curl -sL $DVISVGM_URL | tar zx
  # Move the downloaded directory.
  mv dvisvgm-* $HOME/.dvisvgm
fi

# Build and install dvisvgm.
cd $HOME/.dvisvgm
./configure && make && sudo make install
