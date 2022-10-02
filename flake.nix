{
	outputs = { self, nixpkgs }: {
		defaultPackage.x86_64-linux = import ./nix/build.nix;
		packages.x86_64-linux.test = import ./nix/test.nix;
	};
}
