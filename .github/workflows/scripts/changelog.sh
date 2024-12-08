#!/bin/sh

set -e 

CHANGELOG="CHANGELOG.md"
OUTPUT="./release_changelog.md"
SCRIPT_DIR=$(dirname "$(realpath "$0")")
VERSION=$($SCRIPT_DIR/version.sh)

if [ -z "$VERSION" ]; then
  echo "VERSION is not specified"
  exit 1
fi

if [ ! -f "$CHANGELOG" ]; then
  echo "CHANGELOG.md file not found!"
  exit 1
fi

if ! grep -q "^## \[$VERSION\]" $CHANGELOG; then
  echo "No changelog found for version $VERSION in $CHANGELOG"
  exit 1
fi

echo "## Changes" > $OUTPUT
grep -A 100 "^## \[$VERSION\]" $CHANGELOG | grep -B 100 '^## ' | sed '1d;$d' >> $OUTPUT
echo "Release notes:"
echo ----------------------------------------
cat $OUTPUT
echo ----------------------------------------

