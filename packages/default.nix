{ lib, stdenv }:

stdenv.mkDerivation {
  pname = "zsh-tmux-man";
  version = "unstable-2022-05-05";
  src = ../.;

  installPhase = ''
    install -D tmux-man.plugin.zsh $out/share/zsh/$pname/tmux-man.plugin.zsh
  '';

  meta = with lib; {
    homepage = "https://github.com/sei40kr/zsh-tmux-man";
    description = "Read man in a tmux pane without losing what you've input.";
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
