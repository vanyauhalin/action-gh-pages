# Changelog

This document records all notable changes to the project, following the [Keep a Changelog] format and adhering to [Semantic Versioning].

## [Unreleased]

There are no noticeable changes in version [unreleased].

## [0.0.8] - 2025-01-07

### Fixed

- Fixed the "not a git repository" error when copying files for the check command ([35ed9d0]).

## [0.0.7] - 2025-01-07

### Fixed

- Fixed the "No such file or directory" error when copying files for the check command ([a521fc8]).

## [0.0.6] - 2025-01-07

### Fixed

- Fixed the broken logic of the property check ([6f19d18]).

## [0.0.5] - 2025-01-07

### Changed

- Used the RFC Email date format for the commit message ([9470109]).

### Fixed

- Fixed the incorrect behavior of the check command ([2509a9a]).

## [0.0.4] - 2025-01-07

### Added

- Added the ability to reset the branch before publishing ([4d28eca]).
- Added the ability to check if the branch is up-to-date ([571290b]).

### Changed

- Replaced the custom date format with the default one ([6aa47e7]).

### Fixed

- Fixed the wrong selection of commands for checking the state of the branch ([1c2b4e3]).

## [0.0.3] - 2025-01-07

### Changed

- Improved the log messages ([786d354]).

### Removed

- **Breaking:** Removed the keep property ([80a54c4]).

### Fixed

- Fixed the rendering of newlines in the update commit message ([3d6a503]).

## [0.0.2] - 2025-01-07

### Fixed

- Fixed completely broken property keep ([7c15f15]).

## [0.0.1] - 2025-01-06

This is the first, initial release. The version 0.0.1 was chosen to test the publishing process and attempt to integrate it into other projects. If everything functions well, the version will be updated to 0.1.0, possibly with some changes.

<!-- Footnotes -->

[Unreleased]: https://github.com/vanyauhalin/action-gh-pages/compare/v0.0.8...HEAD/
[0.0.8]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.8/
[0.0.7]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.7/
[0.0.6]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.6/
[0.0.5]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.5/
[0.0.4]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.4/
[0.0.3]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.3/
[0.0.2]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.2/
[0.0.1]: https://github.com/vanyauhalin/action-gh-pages/releases/tag/v0.0.1/

[35ed9d0]: https://github.com/vanyauhalin/action-gh-pages/commit/35ed9d019a44c23e1be70357198e9b8b6b597431/
[a521fc8]: https://github.com/vanyauhalin/action-gh-pages/commit/a521fc8b3184f76b990d13e96470acf2aaf8efd3/
[6f19d18]: https://github.com/vanyauhalin/action-gh-pages/commit/6f19d18031c6a55540f9814898267b5af211fa26/
[9470109]: https://github.com/vanyauhalin/action-gh-pages/commit/9470109b76f5152102e0051182dbc70c310baea8/
[2509a9a]: https://github.com/vanyauhalin/action-gh-pages/commit/2509a9a479caa333744738137e6f9dd7a71b0a45/
[6aa47e7]: https://github.com/vanyauhalin/action-gh-pages/commit/6aa47e76c4a562e39326da64d95136c972556140/
[4d28eca]: https://github.com/vanyauhalin/action-gh-pages/commit/4d28eca471fb159a3adff9133e3528e96d8b3221/
[571290b]: https://github.com/vanyauhalin/action-gh-pages/commit/571290b19dfb3a060fb07057bc5ebacd037167f1/
[1c2b4e3]: https://github.com/vanyauhalin/action-gh-pages/commit/1c2b4e3031b9998429e555c6a0223fa7bdf69678/
[80a54c4]: https://github.com/vanyauhalin/action-gh-pages/commit/80a54c4f91ff5ee1456ba234bfb092068a62e6e1/
[3d6a503]: https://github.com/vanyauhalin/action-gh-pages/commit/3d6a503c114c65d31c9eac42879bfb2797e299a5/
[786d354]: https://github.com/vanyauhalin/action-gh-pages/commit/786d354525b1661a94c5e00dec6ad720ab2ee652/
[7c15f15]: https://github.com/vanyauhalin/action-gh-pages/commit/7c15f15fb17d6a309bf687f701a9e7541bea3826/

[Keep a Changelog]: https://keepachangelog.com/en/1.1.0/
[Semantic Versioning]: https://semver.org/spec/v2.0.0.html
