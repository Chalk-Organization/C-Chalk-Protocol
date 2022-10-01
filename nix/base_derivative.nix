let 
	pkgs = import <nixpkgs> { system = "x86_64-linux"; };
	coreutils = pkgs.coreutils;
	clang = pkgs.clang;
	mold = pkgs.mold;
in
base = pkgs.stdenv.mkDerivation rec {
    name = "base-deriv";
    pname = "chalk-protocol-test";
    version = "0.1.0";

    buildInputs = [ coreutils clang mold ];

	src = ./test;
    src_extension = "c";

    include = ./src/include;
	include_extestions = "h";
    
	config = '''';

	configurePhase = ''
        declare -xp
        mkdir -p "$out/lib/"
        mkdir -p "$out/bin/"
        mkdir -p "$out/obj/"
    '' + config;
    buildPhase = ''
    '';
	installPhase = ''
	'';
}
