#!/bin/bash

# WARNING : this script is run as root !
user=`whoami`
echo "running script as $user"

verlte() {
    [  "$1" = "`echo -e "$1\n$2" | sort -V | head -n1`" ]
}

if ! which nodejs > /dev/null 2>&1 || verlte `nodejs -v` 0.10.38 > /dev/null 2>&1; then
  echo "installing nodejs"
  curl -sL https://deb.nodesource.com/setup | sudo bash -
  sudo apt-get install -y nodejs
fi

# puppet module install garethr-elixir