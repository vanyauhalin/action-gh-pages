# Changelog

This document records all notable changes to the project, following the [Keep a Changelog] format and adhering to [Semantic Versioning].

## [Unreleased]

## [0.0.4] - 2025-01-07

### Added

- Added the ability to reset the branch before publishing ([4d28eca]).
- Added the ability to check if the branch is up-to-date ([571290b]).

### Fixed

- Fixed the wrong selection of commands for checking the state of the branch ([1c2b4e3]).

## [0.0.3] - 2025-01-07

### Changes

- Improved the log messages ([786d354]).

### Removed

- **Breaking:** Removed the `keep` property ([80a54c4]).

### Fixed

- Fixed the rendering of newlines in the update commit message ([3d6a503]).

## [0.0.2] - 2025-01-07

### Fixed

- Fixed completely broken property `keep` ([7c15f15]).

## [0.0.1] - 2025-01-06

This is the first, initial release. The version 0.0.1 was chosen to test the publishing process and attempt to integrate it into other projects. If everything functions well, the version will be updated to 0.1.0, possibly with some changes.

<!-- Footnotes -->

[Unreleased]: https://github.com/vanyauhalin/action-gh-pages/compare/v0.0.4...HEAD/
[0.0.4]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.4/
[0.0.3]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.3/
[0.0.2]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.2/
[0.0.1]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.1/

[4d28eca]: https://github.com/vanyauhalin/action-gh-pages/commit/4d28eca471fb159a3adff9133e3528e96d8b3221/
[571290b]: https://github.com/vanyauhalin/action-gh-pages/commit/571290b19dfb3a060fb07057bc5ebacd037167f1/
[1c2b4e3]: https://github.com/vanyauhalin/action-gh-pages/commit/1c2b4e3031b9998429e555c6a0223fa7bdf69678/
[80a54c4]: https://github.com/vanyauhalin/action-gh-pages/commit/80a54c4f91ff5ee1456ba234bfb092068a62e6e1/
[3d6a503]: https://github.com/vanyauhalin/action-gh-pages/commit/3d6a503c114c65d31c9eac42879bfb2797e299a5/
[786d354]: https://github.com/vanyauhalin/action-gh-pages/commit/786d354525b1661a94c5e00dec6ad720ab2ee652/
[7c15f15]: https://github.com/vanyauhalin/action-gh-pages/commit/7c15f15fb17d6a309bf687f701a9e7541bea3826/

[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[Semantic Versioning]: https://semver.org/spec/v2.0.0.html
