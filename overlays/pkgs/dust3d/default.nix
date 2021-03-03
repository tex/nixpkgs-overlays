{ stdenv
, fetchurl
, copyDesktopItems
, makeDesktopItem
, makeWrapper
, appimage-run
}:

let
  desktopItem = makeDesktopItem {
    name = "dust3d";
    exec = "dust3d";
    genericName = "Dust3D is a cross-platform open-source 3D modeling software";
    desktopName = "Dust3D";
    categories = "Graphics;";
    type = "Application";
};

in
stdenv.mkDerivation rec {
  pname = "dust3d";

  version = "1.0.0-rc.6";

  src = fetchurl {
    url = "https://github.com/huxingyi/dust3d/releases/download/1.0.0-rc.6/dust3d-${version}.AppImage";
    sha256 = "035mdm8dg6hknnadh5vc58hkwmzgvq5pp6ysib2n9a65sbgsg7xd";
  };

  phases = "installPhase";

  nativeBuildInputs = [ copyDesktopItems makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt
    cp ${src} $out/opt/dust3d.AppImage

    makeWrapper ${appimage-run}/bin/appimage-run $out/bin/dust3d \
      --add-flags "$out/opt/dust3d.AppImage"

    runHook postInstall
  '';

  desktopItems = [ desktopItem ];

  meta = with stdenv.lib; {
    description = "Dust3D is a cross-platform open-source 3D modeling software";
    homepage = "https://github.com/huxingyi/dust3d";
    maintainers = with maintainers; [ tex ];
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
