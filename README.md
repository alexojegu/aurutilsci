# aurutilsci [![Build Status](https://travis-ci.com/xeladejo/aurutilsci.svg?branch=main)](https://travis-ci.com/xeladejo/aurutilsci)

Use [Travis CI] for building and packaging [aurutils] from [AUR] and deploy it to [GitHub Releases] so it can be used
as repository in [Arch Linux].

## Setup

On GitHub:
  - Generate a personal access token with scope `public_repo`.

On Travis CI:
  - Add a `GITHUB_TOKEN` environment variable with the personal access token code as value.

[GitHub Releases]: https://github.com/xeladejo/aurutilsci/releases
[Arch Linux]: https://www.archlinux.org
[Travis CI]: https://travis-ci.com/
[AUR]: https://aur.archlinux.org
[aurutils]: https://github.com/AladW/aurutils
