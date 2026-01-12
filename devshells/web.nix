{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
	packages = [ pkgs.nodejs ];

	shellHook = ''
		echo "WELCOME TO HELL"
	'';

	ENV_VAR = "test";
}

