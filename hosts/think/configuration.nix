{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "think";

  networking.networkmanager.enable = true;
  networking.nameservers = ["1.1.1.1" "1.0.0.1"];
  services.resolved = {
    enable = true;
    dnssec = "true";
    domains = ["~."];
    fallbackDns = ["1.1.1.1#cloudflare-dns.com" "1.0.0.1#cloudflare-dns.com"];
    settings = {
      Resolve = {
        DNSOverTLS = "yes";
      };
    };
  };

  time.timeZone = "Europe/Kyiv";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  powerManagement.enable = true;
  services.tlp.enable = true;
  services.logind.settings.Login = {
    HandleLidSwitch = "suspend";
    HandleLidSwitchExternalPower = "suspend";
    HandleLidSwitchDocked = "ignore";
  };

  users.users.bilaii = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "bilaii";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [];
  };
  nix.settings.trusted-users = [
    "root"
    "bilaii"
  ];

  programs.mango.enable = true;
  programs.zsh.enable = true;
  programs.dconf.enable = true;

  services.displayManager.ly = {
    enable = true;
    package = inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.ly;
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    brightnessctl
    # Neovim
    gcc
    nixd
    alejandra
  ];
  fonts.packages = with pkgs; [
    cozette
  ];
  system.stateVersion = "25.11";
}
