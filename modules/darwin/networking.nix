{ config, lib, ... }:

{
  networking.applicationFirewall = {
    allowSignedApp = true;
    allowSigned = true;
  };
}
