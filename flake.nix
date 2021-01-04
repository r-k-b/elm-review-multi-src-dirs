{
  description = "can we detect unused exports in a monorepo-style setup?";

  inputs = { utils.url = "github:numtide/flake-utils"; };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages."${system}";
        inherit (pkgs) mkShell elm2nix elmPackages stdenv graphviz nodejs;

        elmTools = with elmPackages; [ elm elm-format elm-review ];

        example = stdenv.mkDerivation {
          name = "example";
          buildInputs = elmTools ++ [ pkgs.bash ];
          src = ./.;
          buildPhase = ''
            patchShebangs example.sh
            mkdir elmhome
            export ELM_HOME=./elmhome
            ./example.sh
          '';
        };
        exampleApp = utils.lib.mkApp { drv = example; };

        svg = stdenv.mkDerivation {
          name = "structure";
          description = "a visual layout of the problematic structure";
          buildInputs = [ graphviz ];
          src = ./misc;
          buildPhase = "dot -Tsvg -o structure.dot.svg structure.dot";
          installPhase = "cp structure.dot.svg $out";
        };
      in {
        # `nix run`
        apps.example = exampleApp;
        defaultApp = exampleApp;

        # `nix build`
        packages.structure = svg;
        defaultPackage = svg;

        # `nix develop`
        devShell = mkShell {
          nativeBuildInputs = ([ elm2nix graphviz nodejs ] ++ elmTools);
        };
      });
}
