
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
        mkdir -p "$out/obj/"
    '';
    buildPhase = ''
        cp -r $include/* $out/
        clang -c $src/$test_name.c -I "$(find $src/include -type d)" 1> $out/log 2>&1
        mv $(find . -name "*.o") $out/obj
        clang -B mold $out/*.o -o $out/bin/$test_name
    '';
	installPhase = ''
	'';
}
