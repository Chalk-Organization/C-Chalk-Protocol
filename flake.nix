{
	outputs = { self, nixpkgs }: {

		defaultPackage.x86_64-linux = import ./build.nix;
		packages.x86_64-linux.test = import ./test.nix;
	};
}
