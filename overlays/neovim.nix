self: super: {

  neovim-unwrapped = super.neovim-unwrapped.overrideDerivation(old: {
    version = "0.5";
    src = super.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "c6ccdda26ae0b8a9bf4d0779d398cb7c9864aedf";
      sha256 = "189xg9ar1kkkz9w6b99pdkmhwkx7hiza5gd5igvfd4i5cgajlf9y";
    };
  });

}
