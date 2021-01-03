{
  description = "can we detect unused exports in a monorepo-style setup?";

  inputs = { utils.url = "github:numtide/flake-utils"; };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        inherit (pkgs) mkShell elmPackages;
      in {
        # `nix develop`
        devShell = mkShell {
          nativeBuildInputs = (with pkgs; [ nodejs ])
            ++ (with elmPackages; [ elm elm-format elm-review ]);
        };
      });
}
