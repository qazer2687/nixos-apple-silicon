{ lib
, fetchFromGitHub
, alsa-ucm-conf }:

(alsa-ucm-conf.overrideAttrs (oldAttrs: rec {
  version = "6";

  src_asahi = fetchFromGitHub {
    # tracking: https://src.fedoraproject.org/rpms/alsa-ucm-asahi
    owner = "AsahiLinux";
    repo = "alsa-ucm-conf-asahi";
    rev = "v${version}";
    hash = "sha256-0kcrgb780a0y4pb4nhv8g3izia26dg95arzzjhc6zn10cyvifj4g";
  };
  
  postInstall = oldAttrs.postInstall or "" + ''
    cp -r ${src_asahi}/ucm2 $out/share/alsa
  '';
}))
