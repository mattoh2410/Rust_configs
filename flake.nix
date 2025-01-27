
{
  description = "Rust workspace";

  inputs = {
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.follows = "rust-overlay/flake-utils";
    nixpkgs.follows = "rust-overlay/nixpkgs";
  };

  outputs = inputs: 
    with inputs; flake-utils.lib.eachDefaultSystem (
      system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          code = pkgs.callPackage ./. {
            inherit nixpkgs system rust-overlay;
          };
        in rec {
          packages = {
            # https://www.tweag.io/blog/2022-09-22-rust-nix/
          };

          # https://github.com/oxalica/rust-overlay

          devShells.default = with pkgs; mkShell {
            buildInputs = [
              openssl
              pkg-config
              eza
              fd
              rust-bin.beta.latest.default
            ];

          };
        };
    );
}
