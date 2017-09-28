#!/bin/bash
set -euo pipefail

xcodebuild test-without-building \
-project "Buildkite Anka Demo.xcodeproj" \
-scheme "Buildkite Anka Demo" \
-sdk iphonesimulator \
-destination "platform=iOS Simulator,name=iPhone 7,OS=10.3.1" \
-derivedDataPath "build"
