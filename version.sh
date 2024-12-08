VERSION_FILE="lib/bogdan/test/gem/version.rb"
if [ ! -f "$VERSION_FILE" ]; then
  echo "Version file not found!"
  exit 1
fi
grep -Eo 'VERSION\s*=\s*["'\''][0-9]+\.[0-9]+\.[0-9]+["'\'']' "$VERSION_FILE" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+'
