{
    permittedInsecurePackages = [
#       "webkitgtk-2.4.11"
        "p7zip-16.02"
    ];

   allowBroken = true;
   allowUnfree = true;
#  allowUnsupportedSystem = true;

  packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball
            "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };
}

