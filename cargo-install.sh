#!/usr/bin/env bash
set -exuo pipefail

if ! command -v cargo-binstall 2>&1 >/dev/null
then
    echo "cargo binstall not found, installing"
    curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
fi

cargo binstall --disable-telemetry \
    bat \
    bottom \
    cargo-edit \
    cargo-info \
    cargo-update \
    cargo-watch \
    du-dust \
    eza \
    fd-find \
    flamegraph \
    fnm \
    git-delta \
    gping \
    hexyl \
    hyperfine \
    just \
    miniserve \
    ripgrep \
    tokei \
    topgrade \
    viu \
    zoxide \
    xh \
