let 
	pkgs = import <nixpkgs> { system = "x86_64-linux"; };
	coreutils = pkgs.coreutils;
	clang = pkgs.clang;
	mold = pkgs.mold;
in
pkgs.stdenv.mkDerivation rec {
    name = "build";
    pname = "chalk-protocol";
    version = "0.1.0";

    buildInputs = [ coreutils clang mold ];

    src = ./src;
    include = ./src/include;
    extension = "c";

    build_flags = "-Wall -Wextra -Wpedantic";

    configurePhase = ''
        declare -xp
        mkdir -p "$out/lib/"
    '';
    buildPhase = ''
        clang -c $(find $src -name "*.$extension") -I "$(find $include -type d)" $build_flags 1> $out/log 2>&1
        mv $(find . -name "*.o") $out
        clang -B mold $out/*.o -shared -o $out/lib/$pname.so
    '';
	installPhase = ''
	'';
}
