{ config, pkgs, ... }:

{
  system = {
    defaults = {
      ActivityMonitor = {
        IconType = 6;
        SortColumn = "% CPU";
        SortDirection = 0;
      };

      CustomSystemPreferences = {};

      CustomUserPreferences = {
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = false;
          ShowRemovableMediaOnDesktop = false;
        };

        "com.apple.menuextra.clock" = {
          FlashDateSeparators = true;
        };
      };

      LaunchServices.LSQuarantine = false;

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyleSwitchesAutomatically = true;
        AppleScrollerPagingBehavior = true;
        NSDocumentSaveNewDocumentsToCloud = false;
        PMPrintingExpandedStateForPrint = true;
        PMPrintingExpandedStateForPrint2 = true;

        # Disable "Smart" features
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
      };

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      loginwindow.GuestEnabled = false;

      dock = {
        autohide = true;
        magnification = true;
        show-recents = false;
        wvous-tl-corner = 5;
        wvous-br-corner = 14;
      };

      finder = {
        FXPreferredViewStyle = "Nlsv";
        ShowPathbar = true;
        FXDefaultSearchScope = "SCcf"; # Search current folder by default
        ShowExternalHardDrivesOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
      };

      menuExtraClock = {
        Show24Hour = true;
        ShowAMPM = false;
        ShowDate = 1; # Always
        ShowDayOfMonth = true;
        ShowDayOfWeek = true;
        ShowSeconds = true;
      };

      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 0;
      };

      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };
    };
  };
}
