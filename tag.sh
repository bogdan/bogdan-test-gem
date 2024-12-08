VERSION=$(./version.sh)
git tag "v$VERSION" || echo "Tag already exists."
git push origin "v$VERSION"
