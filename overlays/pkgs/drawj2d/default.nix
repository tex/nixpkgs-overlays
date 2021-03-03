{ stdenv
, lib
, fetchzip
, makeWrapper
, jre
}:
stdenv.mkDerivation rec {
  pname = "Drawj2d";
  version = "1.2.1";

  src = fetchzip {
    name = "${pname}-${version}";
    url = "https://downloads.sourceforge.net/project/drawj2d/1.2.1/Drawj2d-1.2.1.zip";
    sha256 = "0h3wm3h82ynhl7j42fzy3ka3przgrlq1lzx93kwry8vnxbvsqsb9";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    makeWrapper ${jre}/bin/java $out/bin/drawj2d \
      --prefix PATH : ${lib.makeBinPath [ jre ]} \
      --add-flags "-jar ${src}/drawj2d.jar"

    runHook postInstall
  '';

  meta = with lib; {
    description = "Drawj2d creates technical line drawings using a descriptive language";
    homepage = "https://sourceforge.net/projects/drawj2d/";
    maintainers = with maintainers; [ tex ];
    license = licenses.gpl2;
    platforms = [ "x86_64-linux" ];
  };
}
