{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3
    uv
    ruff
    ty
    python3Packages.debugpy
  ];
}
