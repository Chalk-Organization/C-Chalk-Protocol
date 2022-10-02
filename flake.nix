{
	outputs = { self, nixpkgs } @ inputs: {
		defaultPackage.x86_64-linux = import ./nix/build.nix inputs;
	};
}
