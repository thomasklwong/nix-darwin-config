{ ... }:
{
  home.file.".serena/serena_config.yml" = {
    source = ./config/serena_config.yml;
    force = true;
  };
}
