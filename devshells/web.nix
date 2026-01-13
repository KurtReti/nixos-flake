{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
	packages = [
	pkgs.nodejs
	pkgs.mysql84
	pkgs.mycli
	];

	shellHook = ''
		(echo "Node Version: "; npm -v) | paste -s -d '  ' 
	'';

	ENV_VAR = "test";
}

