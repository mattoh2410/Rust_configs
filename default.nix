{ pkgs ? import <nixpkgs> {} }:
with pkgs;
  mkShell {
    buildInputs = [
      cargo
      rustc
      vim
      git
      coreutils
    ];
  }
