{
  description = "A flake for imhere";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/684c17c429c42515bafb3ad775d2a710947f3d67";

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      # Notice the reference to nixpkgs here.
      with import nixpkgs { system = "x86_64-linux"; };
      stdenv.mkDerivation {
        name = "imhere";
        src = self;
        buildPhase = "gcc -o imhere ./imhere.c";
        installPhase = "mkdir -p $out/bin; install -t $out/bin imhere";
      };

  };
}
