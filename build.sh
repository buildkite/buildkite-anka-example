#!/bin/bash
set -euo pipefail

xcodebuild clean build-for-testing \
-project "Buildkite Anka Demo.xcodeproj" \
-scheme "Buildkite Anka Demo" \
-destination "platform=iOS Simulator,name=iPhone 7,OS=10.3.1" \
-derivedDataPath "build"

 buildkite-agent artifact upload build/
