{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    typescript
    nodePackages.typescript-language-server
    nodePackages.prettier
    eslint
  ];
}
