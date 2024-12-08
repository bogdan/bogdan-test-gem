VERSION=$(./version.sh)

if [ ! -f "CHANGELOG.md" ]; then
  echo "CHANGELOG.md file not found!"
  exit 1
fi

if [ -z "$VERSION" ]; then
  echo "VERSION is not specified"
  exit 1
fi
FILE="./release_changelog.md"
echo "## Changelog" > $FILE
grep -A 100 "^## \[$VERSION\]" CHANGELOG.md | grep -B 100 '^## ' | sed '1d;$d' >> $FILE
