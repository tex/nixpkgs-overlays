{ clangStdenv,
  cmake,
  fetchsvn,
  libGL,
  libXi,
  libXft,
  ncurses
}:

# Reference for gathering info for compiling is at https://brlcad.org/wiki/Compiling.
clangStdenv.mkDerivation rec {
  pname = "brl-cad";
  version = "7.30.10";

  src = let
    repo = "brlcad";
    tag = builtins.replaceStrings ["."] ["-"] version;
    revision = "77067";
    in fetchsvn {
      url = "svn://svn.code.sf.net/p/${repo}/code/${repo}/tags/rel-${tag}";
      rev = revision;
      sha256 = "1wmx1mr2a2zk20qx1inngsi0d4cfvfaqdzb9k84ijzrkil2zbs7d";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    libGL
    libXft
    libXi
    ncurses
  ];

  cmakeFlags = [
    # Suppress the developer warnings.
    "-Wno-dev"

    # It is recommended to disable strict mode since the build will throw errors at trivial errors.
    "-DBRLCAD_ENABLE_STRICT=OFF"
    "-DBRLCAD_BUNDLED_LIBS=ON"
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  enableParallelBuilding = true;

  meta = with clangStdenv.lib; {
    description = "A free and open-source 3D solid modelling system";
    homepage = "http://www.brlcad.org/";
    license = licenses.free;
    # maintainers = with maintainers; [ foo-dogsquared ];
  };
}
