#!/bin/env bash

# Install dvisvgm in a cached directory if it doesn't already exist.
if [ ! -d $HOME/.dvisvgm ]; then
  # $DVISVGM_URL is defined in .travis.yml
  curl -sL $DVISVGM_URL | tar zx
  mv dvisvgm-* $HOME/.dvisvgm
  cd $HOME/.dvisvgm
  ./configure
  make
  sudo make install
fi
