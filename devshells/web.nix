{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
	packages = [
	# Node.js
	pkgs.nodejs_22 
	pkgs.pnpm

	#typescript dependencies
	pkgs.typescript
	pkgs.nodePackages.typescript-language-server
	pkgs.nodePackages.eslint

	# MySQL backend
	pkgs.mysql84
	pkgs.mycli
	];

	shellHook = ''
            echo "----------------------------------------"
            echo " Development Dependencies for Web Development"
            echo " Using pnpm as package manager"
            echo "----------------------------------------"
            echo " Installed Versions:"
            echo "  Node.js: $(node --version)"
            echo "  pnpm: $(pnpm --version)"
            echo "  TypeScript: $(tsc --version)"
            echo "  ESLint: $(eslint --version)"
            echo "----------------------------------------"
	'';

}

