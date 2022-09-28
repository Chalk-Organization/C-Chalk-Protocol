{
	outputs = { self, nixpkgs }: {

		defaultPackage.x86_64-linux = import ./build.nix;
		packages.x86_64-linux.build = import ./build.nix;

	};
}
