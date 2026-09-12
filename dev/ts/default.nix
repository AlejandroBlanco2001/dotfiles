{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nodejs
    typescript
    typescript-language-server
    prettier
    eslint
  ];
}
