{ config, pkgs, ... }:
{
  services.printing.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.xserver.displayManager.lightdm = {
    enable = true;
    greeter = {
      mini = {
        enable = true;
        # LightDM-mini-greeterの設定
        config = ''
          [greeter]
          background = /path/to/background/image
          user-background = false
          hide-user-list = true
          default-user = yourusername
          screen-keyboard = false
          session = xmonad
        '';
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}

