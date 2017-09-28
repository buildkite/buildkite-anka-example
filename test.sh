#!/bin/bash
set -euo pipefail

echo "--- Downloading build artifacts"
buildkite-agent artifact download "build/**" .

echo "+++ Running tests in $ANKA_IMAGE_NAME"
anka run "$ANKA_IMAGE_NAME" xcodebuild test-without-building \
  -project "Buildkite Anka Demo.xcodeproj" \
  -scheme "Buildkite Anka Demo" \
  -sdk iphonesimulator \
  -destination "$XCODE_DESTINATION" \
  -derivedDataPath "build"
