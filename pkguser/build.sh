#!/bin/bash

set -ex

export PKGDEST=$(pwd)"/${TRAVIS_TAG}"

if ! grep -qs "PACKAGER" ".makepkg.conf"; then
    export PACKAGER="${TRAVIS_REPO_SLUG/\// } <${TRAVIS_BUILD_ID}@travis.build.id>"
fi

declare -r pkgkey="DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A"
declare -r pkgname="aurutils"

if ! test -z "${pkgkey}"; then
    gpg --keyserver "hkps://keys.openpgp.org" --recv-keys "${pkgkey}"
fi

mkdir "${TRAVIS_TAG}"

git clone "https://aur.archlinux.org/${pkgname}.git"

cd "${pkgname}"
makepkg -Lcrs --noconfirm
cd ".."

cd "${TRAVIS_TAG}"
repo-add "${TRAVIS_REPO_SLUG#*/}.db.tar.gz" *".pkg.tar.zst"
cd ".."

{ set +ex; } 2>/dev/null
