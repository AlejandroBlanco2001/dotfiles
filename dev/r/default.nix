{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    R
    rPackages.languageserver
    rPackages.lintr
    rPackages.styler
  ];
}
