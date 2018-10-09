#!/usr/bin/env bash

set -e

# Download dvisvgm if the directory does not exist or is empty.
if [ ! -d $HOME/.dvisvgm ] || [ "$(ls -A $HOME/.dvisvgm)" = "" ]; then
  # Remove the directory if it exists.
  rmdir $HOME/.dvisvgm || true
  # Download & uncompress the tar.gz file ($DVISVGM_URL is in .travis.yml).
  curl -sL $DVISVGM_URL | tar zx
  # Move the downloaded directory.
  mv dvisvgm-* $HOME/.dvisvgm
fi

# Build (using bundled libraries) and install dvisvgm.
cd $HOME/.dvisvgm
./configure --enable-bundled-libs && make && sudo make install
