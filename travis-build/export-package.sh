#! /bin/sh

RELEASE_DIRECTORY=./release


mkdir -p $RELEASE_DIRECTORY
echo "Preparing release for version: $TRAVIS_TAG"
cp "./README.md" "$RELEASE_DIRECTORY"
cp "./LICENSE" "$RELEASE_DIRECTORY"

echo "Files in release directory:"
ls $RELEASE_DIRECTORY

RELEASE_ZIP_FILE=$RELEASE_DIRECTORY/$PROJECT_NAME-v$TRAVIS_TAG.zip
zip -6 -r $RELEASE_ZIP_FILE $RELEASE_DIRECTORY

echo "Release zip package ready. Zipinfo:"
zipinfo $RELEASE_ZIP_FILE
	
