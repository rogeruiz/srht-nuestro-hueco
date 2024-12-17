let
  nixpkgs = fetchTarball {
    name = "nixpkgs-24.11";
    url = "https://github.com/nixos/nixpkgs/archive/8b27c1239e5c421a2bbc2c65d52e4a6fbf2ff296.tar.gz";
    sha256 = "1gx0hihb7kcddv5h0k7dysp2xhf1ny0aalxhjbpj2lmvj7h9g80a";
  };
  pkgs = import nixpkgs {
    config = {
      allowUnfree = true;
    };
    overlays = [ ];
  };
in

pkgs.mkShell {
  name = "nuestro-hueco";
  packages = [
    (with pkgs; [
      azure-cli
    ])
  ];
}
