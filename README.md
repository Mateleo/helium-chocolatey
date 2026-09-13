# Helium Chocolatey Package

This is the unofficial Chocolatey package for [Helium Browser](https://github.com/imputnet/helium), community
maintained.

https://community.chocolatey.org/packages/helium

## Automation

Two workflows keep the package in sync with upstream, no manual step required:

1. **Update Helium Version** (`.github/workflows/update-version.yml`) runs every 2 hours. It reads the latest
   release of [imputnet/helium-windows](https://github.com/imputnet/helium-windows), takes the sha256 digest
   GitHub publishes for `helium_<version>_x64-installer.exe`, and commits the new version + checksum to
   `master` when it differs from the packaged one.
2. **Publish to Chocolatey** (`.github/workflows/publish.yml`) runs on every `master` push that touches
   `helium.nuspec` or `tools/**` (and can be started manually). It re-downloads the installer and verifies
   the checksum against the package, runs `choco pack`, installs the freshly packed package on the runner as
   a smoke test, and only then pushes to community.chocolatey.org.

Requires the repository secret `CHOCO_API_KEY` (a https://push.chocolatey.org/ API key) to publish. Without
it the workflow still packs and smoke tests, and skips the push.
