{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3
    uv
    python3Packages.debugpy
  ];
}
