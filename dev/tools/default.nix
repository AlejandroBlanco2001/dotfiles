{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    claude-code
    neovim
    lazygit
    tmux
    podman-compose
    jq
    awscli2
    openssl
    lazydocker
    openshell
    slurp
  ];
}
