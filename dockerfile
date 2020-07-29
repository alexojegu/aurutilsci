FROM archlinux

ENV TRAVIS_REPO_SLUG $TRAVIS_REPO_SLUG
ENV TRAVIS_BUILD_ID $TRAVIS_BUILD_ID
ENV TRAVIS_TAG $TRAVIS_TAG

RUN pacman -Syu --needed --noconfirm base-devel git
RUN useradd -m -G wheel -s /bin/bash pkguser
RUN echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel

USER pkguser

WORKDIR /home/pkguser
