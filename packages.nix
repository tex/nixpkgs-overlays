# To be used with
# > nix-env -irf ~/.config/nixpkgs/packages.nix

{ pkgs ? import <nixpkgs> {}}:
with pkgs; [

  qemu

  ranger
  mystiq
  ##dust3d
  #brl-cad

  neovim

  drawj2d

  # Python3 completion in neovim
  python3Packages.python-language-server

  # C/C++ completion in neovim
  clang-tools
  clang

  # rust completion in neovim
  #rust
  #cargo
  #rust-analyzer
  nur.repos.mozilla.latest.rustChannels.nightly.rust
  #latest.rustChannels.nightly.rust-src

  # nix-index
  # nix-query-tree-viewer
]
