let
  mozillaOverlay =
    import (builtins.fetchGit {
      url = "https://github.com/mozilla/nixpkgs-mozilla.git";
    });
  nixpkgs = import <nixpkgs> { overlays = [ mozillaOverlay ]; };
  rust-nightly = with nixpkgs; ((rustChannelOf { date = "2023-05-31"; channel = "nightly"; }).rust);
in
with nixpkgs; pkgs.mkShell {
  nativeBuildInputs = [
    rust-nightly
  ];
}
