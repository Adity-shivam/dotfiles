{
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

}

# {
#   programs.zen-browser = {
#     enable = true;
#     setAsDefaultBrowser = true;

#     policies =
#       let
#         mkExtensionSettings = builtins.mapAttrs (
#           _: pluginId: {
#             install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
#             installation_mode = "force_installed";
#           }
#         );
#       in

#       {
#         AutofillAddressEnabled = true;
#         AutofillCreditCardEnabled = false;
#         OfferToSaveLogins = true;

#         DisableAppUpdate = false;
#         DisableFeedbackCommands = true;
#         DisableFirefoxStudies = true;
#         DisablePocket = true;
#         DisableTelemetry = true;
#         DontCheckDefaultBrowser = true;
#         NoDefaultBookmarks = true;

#         EnableTrackingProtection = {
#           Value = true;
#           Locked = true;
#           Cryptomining = true;
#           Fingerprinting = true;
#         };
#       };

#     policies.Preferences = {
#       # use double quotes!

#       "browser.startup.homepage" = {
#         Value = "https://chromedino.com/";
#         Status = "locked";
#       };
#       "browser.tabs.warnOnClose" = {
#         Value = false;
#         Status = "locked"; # User cannot change this
#       };
#     };

#     profiles.default.presets.catppuccin = {
#       enable = true;
#       flavor = "Latte"; # Frappe | Latte | Macchiato | Mocha
#       accent = "Green"; # Blue, Flamingo, Green, Lavender, Maroon, Mauve, ...
#     };

#     profiles.default.presets.betterfox.enable = true;
#     profiles.default.presets.arkenfox.enable = false;

#     profiles.default.settings = {
#       # use double quotes!
#       # In about:config, search "zen."
#       "zen.workspaces.continue-where-left-off" = true;
#       "zen.view.compact.hide-tabbar" = true;
#       "zen.urlbar.behavior" = "float";
#       "zen.welcome-screen.seen" = true;

#     };

#   };
# }

