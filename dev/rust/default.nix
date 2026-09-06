{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    cargo
    rustc
    rustfmt
    rust-analyzer
    clippy
  ];
}
