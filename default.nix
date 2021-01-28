# This file has been generated by node2nix 1.8.0. Do not edit!
let
  oldpkgs =  (builtins.fetchTarball {
    # Descriptive name to make the store path easier to identify
    name = "nixos-18.09";
    # Commit hash for nixos-unstable as of 2018-09-12
    url = "https://github.com/nixos/nixpkgs/archive/925ff360bc33876fdb6ff967470e34ff375ce65e.tar.gz";
    # Hash obtained using `nix-prefetch-url --unpack <url>`
    sha256 = "1qbmp6x01ika4kdc7bhqawasnpmhyl857ldz25nmq9fsmqm1vl2s";
  });
in 
{pkgs ? import oldpkgs {
    inherit system;
  }, system ? builtins.currentSystem, nodejs ? pkgs."nodejs-6_x"}:

let
  nodeEnv = import ./node-env.nix {
    inherit (pkgs) stdenv python2 utillinux runCommand writeTextFile;
    inherit nodejs;
    libtool = if pkgs.stdenv.isDarwin then pkgs.darwin.cctools else null;
  };
in
import ./node-packages.nix {
  inherit (pkgs) fetchurl fetchgit;
  inherit nodeEnv;
}
