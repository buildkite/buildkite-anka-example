#!/bin/bash
set -euo pipefail

echo "+++ Building app in $ANKA_IMAGE_NAME"
anka run "$ANKA_IMAGE_NAME" xcodebuild build-for-testing \
  -project "Buildkite Anka Demo.xcodeproj" \
  -scheme "Buildkite Anka Demo" \
  -destination "$XCODE_DESTINATION" \
  -derivedDataPath "build"

echo "--- Uploading build artifacts"
buildkite-agent artifact upload "build/Build/Products/**/*"
