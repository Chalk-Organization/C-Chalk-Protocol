let 
	pkgs = import <nixpkgs> { system = "x86_64-linux"; };
	coreutils = pkgs.coreutils;
	clang = pkgs.clang;
	mold = pkgs.mold;
in
pkgs.stdenv.mkDerivation rec {
    name = "build";
    pname = "nix-c-test";
    version = "0.1.0";

    buildInputs = [ coreutils clang mold ];

    src = ./src;
    include = ./src/include;
    extension = "c";

    configurePhase = ''
        declare -xp
        mkdir -p "$out/bin/"
    '';
    buildPhase = ''
        clang -c $(find $src -name "*.$extension") -I "$(find $include -type d)"
        mv $(find . -name "*.o") $out
        clang -B mold $out/*.o -o $out/bin/$pname
    '';
	installPhase = ''
	'';
}