{pkgs, ...}: {
  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;

    environmentVariables = {
      OLLAMA_CONTEXT_LENGTH = "8192";
      OLLAMA_FLASH_ATTENTION = "1";
    };
  };

  environment.systemPackages = [pkgs.ollama-rocm];
}
