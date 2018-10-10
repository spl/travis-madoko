#!/usr/bin/env bash

# Bash: echo commands, exit on error
set -x -e

# Download dvisvgm if the directory is empty. (It is created by Travis-CI.)
if [ "$(ls -A $HOME/.dvisvgm)" = "" ]; then

  # Download & uncompress the tar.gz file ($DVISVGM_URL is in .travis.yml).
  curl -sL $DVISVGM_URL | tar zx
  # Move the downloaded directory.
  mv dvisvgm-*/* $HOME/.dvisvgm/
  rm -rf dvisvgm-*
  cd $HOME/.dvisvgm

  # This is needed to use the right versions of gcc and g++.
  # See https://gist.github.com/cotsog/19cd36b295e03bdbabdb
  export CC=gcc-4.9 CXX=g++-4.9

  # Build (using bundled libraries) and install dvisvgm.
  ./configure --enable-bundled-libs && make && sudo make install

fi
