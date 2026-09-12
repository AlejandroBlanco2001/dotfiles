{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    go
    gopls
    gotools
    golangci-lint
    delve
  ];
}
