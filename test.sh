#!/bin/bash
set -euo pipefail

echo "--- Downloading build artifacts"
buildkite-agent artifact download "build/**" .

job_image_name="${ANKA_IMAGE_NAME}-${BUILDKITE_JOB_ID}"

cleanup() {
  echo "--- Cleaning up images"
  anka delete --yes "$job_image_name"
}

echo "--- Cloning $ANKA_IMAGE_NAME to $job_image_name"
anka clone "$ANKA_IMAGE_NAME" "$job_image_name"

trap cleanup EXIT

echo "+++ Running tests in $ANKA_IMAGE_NAME"
anka run "$ANKA_IMAGE_NAME" xcodebuild test-without-building \
  -project "Buildkite Anka Demo.xcodeproj" \
  -scheme "Buildkite Anka Demo" \
  -sdk iphonesimulator \
  -destination "$XCODE_DESTINATION" \
  -derivedDataPath "build" \
  -only-testing "$1"
