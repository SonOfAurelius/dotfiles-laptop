{
    description = "DeterminateSystems Flake";

    inputs = {
        nixpkgs.url = "https://flakehub.com/f/DeterminateSystems/nixpkgs-weekly/0.1.1060451";
    };

    outputs = { self, nixpkgs, ...}:
    let 
        lib = nixpkgs.lib;
    in {
        nixosConfigurations = {
            nixos = lib.nixosSystem {
                system = "x86_64-linux";
                modules = [ ./configuration.nix ];
            };
        };
    };
}
