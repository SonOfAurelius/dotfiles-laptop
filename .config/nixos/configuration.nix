# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = false;
      device = "nodev";
      useOSProber = false;
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.

  services.udev.extraRules = ''
    ACTION=="change", SUBSYSTEM=="leds", KERNEL=="platform::mute", ATTR{brightness}="0"
  '';

  # Configure network connections with iwd.
  networking.wireless.iwd.enable = true;

  # Bluetooth
  hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
          General = {
             Experimental = true; # Shows battery%
             FastConnectable = true;
          };
      };
  };

  # Set your time zone.
  time.timeZone = "Europe/Brussels";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };


  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.aurelius = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };

  nix.settings.experimental-features = [ "flakes" "nix-command"];

  programs.firefox.enable = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    git
    wget
    wiremix
    rofi
    hyprland
    hyprpaper
    hyprcursor
    hyprlock
    waybar
    brightnessctl
    ghostty
    chafa
    zsh
    zellij
    stow
    firefox
    bolt-launcher
    concord-tui
    bluetui
    impala
    mako
    btop
    fastfetch
    spotatui

    # screenshot capability
    grim
    slurp
    wl-clipboard

    # nvim + LSP's
    neovim
    lua-language-server
    nixd
    clang-tools
    odin
    ols
    go_1_27
    gopls
    
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.pathsToLink = [ "/share/hypr" ];

  system.stateVersion = "26.05"; # DON'T CHANGE	

}
