{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, flake-utils, nixpkgs }: flake-utils.lib.eachDefaultSystem
    (system:
      let pkgs = import nixpkgs { inherit system; }; in
      {
        packages.default = pkgs.callPackage ./packages/default.nix { };

        devShells.default =
          let
            zDotDir = pkgs.writeTextFile {
              name = "zshrc";
              text = ''
                . "${self.packages.${system}.default}/share/zsh/zsh-tmux-man/tmux-man.plugin.zsh"
              '';
              destination = "/.zshrc";
            };
          in
          pkgs.mkShell {
            buildInputs = with pkgs; [ zsh ];

            shellHook = ''
              ZDOTDIR=${zDotDir} exec zsh -i
            '';
          };
      }
    );
}
