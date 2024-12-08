#!/bin/sh

set -e

VERSION_FILE="./lib/bogdan/test/gem/version.rb"
if [ ! -f "$VERSION_FILE" ]; then
  echo "Version file not found!"
  exit 1
fi

VERSION=$(ruby -r $VERSION_FILE -e "puts Bogdan::Test::Gem::VERSION")

if [ -z "$VERSION" ]; then
  echo "Could not extract version from $VERSION_FILE"
  exit 1
fi

echo "$VERSION"
