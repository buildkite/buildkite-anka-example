# Buildkite Veertu Anka Example

[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

An example of running Xcode 8.3 unit, performance and UI tests using `xcodebuild` in an [Anka](https://veertu.com/) virtual machine via [Buildkite](https://buildkite.com/).

## Requirements

This takes a bit of setup. I'm using a Mac Pro at [Macstadium](https://www.macstadium.com/), but you could just as easily use any Mac that you have available.

### Veertu Anka

You will need to install the [Anka][] virtualization tool. I used [Anka Build (Beta) version 1.0.1 (build 72)](https://ankadoc.bitbucket.io/) for this demo.

### Base Images

Like Docker, [Anka][] uses images to run. You can either prepare your own base image with a recent macOS and XCode, or you can use the [Packer templates](https://github.com/buildkite/anka-packer-images) that we've built.

### Buildkite-Agent on your Host Machine

You will need [`buildkite-agent` installed](https://buildkite.com/docs/agent/osx) on the same machine that you installed Anka on. It receives the builds and manages the Anka containers.

If you want to run parallel jobs, you can run several agents on the same host, or fan out across several hosts.

You will want to start the agent with a specific tag, such as `queue=ankahost` or similar, so that you can target jobs specifically at it.

## License

See the [LICENSE](LICENSE.md) file for license rights and limitations (MIT).

[Anka]: https://veertu.com/
