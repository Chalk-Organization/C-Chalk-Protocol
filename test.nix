
let 
	pkgs = import <nixpkgs> { system = "x86_64-linux"; };
	coreutils = pkgs.coreutils;
	clang = pkgs.clang;
	mold = pkgs.mold;
in
pkgs.stdenv.mkDerivation rec {
    name = "test";
    pname = "chalk-protocol-test";
    version = "0.1.0";

    buildInputs = [ coreutils clang mold ];

    include = ./src/include;
    extension = "c";

	src = ./test;
	test_name = "tcp_test";

    configurePhase = ''
        declare -xp
        mkdir -p "$out/bin/"
    '';
    buildPhase = ''
        clang -c $src/$test_name.c -I "$(find $include -type d)"
        mv $(find . -name "*.o") $out
        clang -B mold $out/*.o -o $out/bin/$test_name
    '';
	installPhase = ''
	'';
}