#!/bin/bash
set -euo pipefail

job_image_name="${ANKA_IMAGE_NAME}-${BUILDKITE_JOB_ID}"

cleanup() {
  echo "--- Cleaning up images"
  anka delete --yes "$job_image_name"
}

echo "--- Cloning $ANKA_IMAGE_NAME to $job_image_name"
anka clone "$ANKA_IMAGE_NAME" "$job_image_name"

trap cleanup EXIT

echo "+++ Building app in $job_image_name"
anka run "$job_image_name" xcodebuild build-for-testing \
  -project "Buildkite Anka Demo.xcodeproj" \
  -scheme "Buildkite Anka Demo" \
  -destination "$XCODE_DESTINATION" \
  -derivedDataPath "build"

echo "--- Uploading build artifacts"
buildkite-agent artifact upload "build/Build/Products/**/*"
