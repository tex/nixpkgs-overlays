{ stdenv, fetchurl, qmake, qtbase, qtdeclarative, qtmultimedia, ffmpeg, sox, wrapQtAppsHook }:

stdenv.mkDerivation rec {
  pname = "MystiQ";
  version = "20.03.23";

  src = fetchurl {
    url = "https://github.com/llamaret/MystiQ/archive/v20.03.23.tar.gz";
    sha256 = "0bnj2rw37a7gv7fnxzbmrc0vqm66nva00iafc8rng1v8pyp4zf6g";
  };

  nativeBuildInputs = [ wrapQtAppsHook qmake ];
  buildInputs = [ qtbase qtdeclarative qtmultimedia ];
  propagatedUserEnvPkgs = [ ffmpeg sox ];

  postPatch = ''
    substituteInPlace mystiq.pro --replace $\{INSTALL_ROOT} ""
    substituteInPlace mystiq.pro --replace '/usr/' "$out/"
  '';

  meta = with stdenv.lib; {
    license = licenses.gpl3;
    description = "A ffmpeg frontend based on Qt5";
    platforms = platforms.linux;
  };
}
