{ config, pkgs, theme, ... }:

{
    programs.firefox = {
        enable = true;
        package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
            extraPolicies = {
                CaptivePortal = false;
                DisableFirefoxStudies = true;
                DisablePocket = true;
                DisableTelemetry = true;
                DisableFirefoxAccounts = false;
                NoDefaultBookmarks = true;
                OfferToSaveLogins = false;
                OfferToSaveLoginsDefault = false;
                PasswordManagerEnabled = false;
                FirefoxHome = {
                    Search = true;
                    Pocket = false;
                    Snippets = false;
                    TopSites = false;
                    Highlights = false;
                };
                UserMessaging = {
                    ExtensionRecommendations = false;
                    SkipOnboarding = true;
                };
            };
        };
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            ublock-origin
            privacy-badger
            bitwarden
            clearurls
            decentraleyes
            duckduckgo-privacy-essentials
            ghostery
            privacy-redirect
            privacy-badger
            languagetool
        ];
        profiles = {
            mahmoud = {
                id = 0;
                name = "mahmoud";
                search = {
                    force = true;
                    default = "DuckDuckGo";
                    engines = {
                        "Nix Packages" = {
                            urls = [{
                                template = "https://search.nixos.org/packages";
                                params = [
                                    { name = "type"; value = "packages"; }
                                    { name = "query"; value = "{searchTerms}"; }
                                ];
                            }];
                            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
                            definedAliases = [ "@np" ];
                        };
                        "NixOS Wiki" = {
                            urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
                            iconUpdateURL = "https://nixos.wiki/favicon.png";
                            updateInterval = 24 * 60 * 60 * 1000;
                            definedAliases = [ "@nw" ];
                        };
                        "Wikipedia (en)".metaData.alias = "@wiki";
                        "Google".metaData.hidden = true;
                        "Amazon.com".metaData.hidden = true;
                        "Bing".metaData.hidden = true;
                        "eBay".metaData.hidden = true;
                    };
                };
                settings = {
                    # Smooth scroll
                    "general.smoothScroll" = true;

                    # Force using WebRender. Improve performance
                    "gfx.webrender.all" = true;
                    "gfx.webrender.enabled" = true;

                    # https://wiki.archlinux.org/title/firefox#Hardware_video_acceleration
                    "media.ffmpeg.vaapi.enabled" = true;
                    "media.ffvpx.enabled" = false;

                    # Enable multi-pip
                    "media.videocontrols.picture-in-picture.allow-multiple" = true;

                    # Misc
                    "browser.aboutConfig.showWarning" = false;
                    "browser.tabs.warnOnClose" = false;
                    "widget.use-xdg-desktop-portal" = true;
                    "ui.context_menus.after_mouseup" = true;
                    "browser.toolbars.bookmarks.visibility" = "never";

                    # Tab
                    "browser.urlbar.suggest.quickactions" = false;
                    "browser.urlbar.suggest.topsites" = false;
                };
                extraConfig = ''
                    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
                    user_pref("full-screen-api.ignore-widgets", true);
                    user_pref("media.ffmpeg.vaapi.enabled", true);
                    user_pref("media.rdd-vpx.enabled", true);
                '';
                userChrome = ''
                    * {
                        font-family: "Iosevka" !important;
                        font-size: 12px !important;

                        --arrowpanel-background: ${theme.base00} !important;
                        --arrowpanel-border-color: ${theme.base02} !important;
                        --autocomplete-popup-highlight-color: ${theme.base01} !important;
                        --autocomplete-popup-highlight-background: ${theme.base06} !important;
                        --toolbarbutton-active-background: ${theme.base06} !important;
                        --lwt-toolbarbutton-icon-fill-attention: var(--button-primary-bgcolor, ${theme.base06}) !important;
                        --toolbar-field-focus-border-color: ${theme.base06} !important;
                    }
                    .toolbar {
                        background-color: #11171D !important;
                    }
                    window,
                    #main-window,
                    #toolbar-menubar,
                    #TabsToolbar,
                    #PersonalToolbar,
                    #navigator-toolbox,
                    #sidebar-box {
                        background-color: ${theme.base02} !important;
                        -moz-appearance: none !important;
                        background-image: none !important;
                        border: none !important;
                    }
                    .tab-background[selected="true"] {
                        background-color: ${theme.base00} !important;
                        -moz-appearance: none !important;
                        background-image: none !important;
                        border: none !important;
                    }
                    .tab-background {
                        background-color: ${theme.base02} !important;
                        border-radius: 0px !important;
                        margin-block: 0px !important;
                    }
                    .tabbrowser-tab:hover .tab-background {
                        background-color: ${theme.base09} !important;
                    }
                    .tabbrowser-tab[fadein] {
                        max-width: 100vw !important;
                    }
                    #urlbar {
                        background-color: #11171D !important;
                        border-radius: 10px !important;
                    }
                    #nav-bar {
                        background-color: ${theme.base02} !important;
                        -moz-appearance: none !important;
                        background-image: none !important;
                        border: none !important;
                        transition: margin 0.5s !important;
                    }
                    #TabsToolbar {
                        z-index: 1000 !important;
                    }
                    #mainPopupSet menupopup,
                    menupopup:not(.in-menulist) > menuitem,
                    menupopup:not(.in-menulist) > menu {
                        border: 0 !important;
                        border-radius: 0px !important;
                        padding: 0px 0px 0px 0px  !important;
                    }
                    .tabbrowser-tab {
                        height: 25px !important;
                        z-index: 1000 !important;
                        padding: none !important;
                        padding-inline: 0px !important;
                    }
                    #navigator-toolbox:not(:focus-within):not(:hover) #nav-bar {
                        margin-top: -40px !important;
                    }
                    .tab-line {
                        display: none !important;
                    }
                    .tab-icon-image:not([pinned]){
                        display: none !important;
                    }
                    #tab-content {
                        vertical-align: middle !important;
                    }
                    .tab-text,
                    .tab-label {
                        -moz-box-flex: 1 !important;
                        text-align: center !important;
                    }
                    .tab-secondary-label {
                        display:none !important;
                    }
                    .tab-label {
                        padding-top: 5px !important;
                        overflow: hidden !important;
                    }
                    .tabbrowser-tab .tab-label-container {
                        margin-inline-end: 7px !important;
                    }
                    .tab-label-container {
                        -moz-box-pack: center !important;
                        -moz-box-orient: horizontal !important;
                        display: grid !important;
                        justify-content: safe center !important;
                    }
                    #tabbrowser-tabs {
                        -moz-box-flex: 1 !important;
                        text-align: center !important;
                    }
                    #tabs-newtab-button{
                        display: none !important;
                    }
                    .tabbrowser-tab::before,
                    .tabbrowser-tab::after{
                        display: none !important;
                    }
                    .tab-close-button {
                        display: none !important;
                        border-radius: 10px !important;
                    }
                    #identity-box,
                    #tracking-protection-icon-container {
                        display: none !important;
                    }
                    #back-button>.toolbarbutton-icon {
                        transform: scale(.85, .85) !important;
                        animation: none !important;
                        border: none !important;
                        box-shadow: none !important;
                    }
                    #back-button:not(:hover),
                    #back-button:not(:hover) > .toolbarbutton-icon {
                        background: none !important;
                    }
                    #back-button:hover,
                    #back-button:hover > .toolbarbutton-icon {
                        border-radius: 2px !important;
                    }
                    #back-button {
                        list-style-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADdcAAA3XAUIom3gAAAAHdElNRQfiAxMSNzVLQoGBAAAAb0lEQVQoz43ROQqDUBSF4UMEESKCBBehOODK7ezSWZnGJmuI4xp+66CX9077FXc40k1o+fCSFRoOOgKLa3Z6QosrNt5EFpesDDwtLlgYSSzOmZlILY758SW7ykO+cYzwWNLjTI9HSc5XS86ypP+6Tw/fVEqhFbEZAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE4LTAzLTE5VDE4OjU1OjUzKzAxOjAwq3ccegAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOC0wMy0xOVQxODo1NTo1MyswMTowMNoqpMYAAAAZdEVYdFNvZnR3YXJlAHd3dy5pbmtzY2FwZS5vcmeb7jwaAAAAAElFTkSuQmCC') !important;
                    }
                    #forward-button {
                        list-style-image: url('data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAAmJLR0QAAKqNIzIAAAAJcEhZcwAADdcAAA3XAUIom3gAAAAHdElNRQfiAxMSOA3k2CXQAAAAbklEQVQoz5WRMQqDABAEF4UgKEIIPkKJii+3s7NLpY1N3qBR84axsPYOt1sYuNtdSZLEi5FG1yKk5U9tIQ86dioLiejZKC0k5sPK20JSBn4UFvJkYiG3kIwvM8npAt2Vc8J50onpFOVU7Y51PfcBtUFUSir+geUAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTgtMDMtMTlUMTg6NTY6MTMrMDE6MDDECqmDAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE4LTAzLTE5VDE4OjU2OjEzKzAxOjAwtVcRPwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAASUVORK5CYII=') !important;
                    }
                    #whats-new-menu-button,
                    #pocket-button,
                    #save-to-pocket-button
                    #pageActionSeparator,
                    #reader-mode-button {
                        display: none !important;
                    }
                    #star-button {
                        color: ${theme.base06} !important;
                    }
                    #save-to-pocket-button {
                        visibility: hidden !important;
                    }
                    #PanelUI-button {
                        border-image-slice: 0 !important;
                    }
                    #urlbar-input {
                        background-color: ${theme.base00} !important;
                        padding-left: 5px !important;
                    }
                    #urlbar-results {
                        background-color: ${theme.base00} !important;
                        border-radius: 5px !important;
                    }
                    #urlbar-results .urlbarView-row:hover{
                        color: ${theme.base06} !important;
                        border-radius: 5px !important;
                    }
                    .urlbarView-row[selected] .urlbarView-row-inner {
                        border-radius: 5px !important;
                        background-color: ${theme.base06} !important;
                        color: ${theme.base00} !important;
                    }
                    .urlbarView-body-inner {
                        border-top: none !important;
                    }
                    #nav-bar {
                        border-bottom: 0px !important;
                        box-shadow: none !important;
                    }
                    #urlbar ::-moz-selection,
                    .searchbar-textbox ::-moz-selection {
                        background-color: ${theme.base01} !important;
                        color: ${theme.BLACK} !important;
                    }
                    #tabbrowser-tabpanels {
                        background-color: ${theme.base01} !important;
                    }
                    urlbar > #urlbar-background {
                        background-color: ${theme.base00} !important;
                    }
                    #urlbar-background {
                        background-color: ${theme.base00} !important;
                        color: ${theme.base02} !important;
                        border: 1px solid ${theme.base06} !important;
                    }
                    #urlbar-background:not([focused]) {
                        background-color: ${theme.base00} !important;
                        color: ${theme.base02} !important;
                    }
                    #urlbar-one-offs-header-label{
                        display: none;
                    }
                    .search-one-offs > .search-panel-one-offs-header::before{
                        display: block;
                        content: "Search With:";
                        padding-inline: var(--urlbarView-item-inline-padding) 18px;
                        opacity: 0.6;
                    }
                '';
                userContent = ''
                    @namespace url("http://www.w3.org/1999/xhtml");
                    :root {
                        scrollbar-color: ${theme.base00} ${theme.base02};
                    }
                    * {
                        scrollbar-width: thin;
                    }
                    @-moz-document url-prefix("about:") {
                        :root {
                            --in-content-page-background: ${theme.base00} !important;
                            --toolbar-field-focus-border-color: ${theme.base06} !important;
                            --toolbarbutton-active-background: ${theme.base06} !important;
                        }
                    }
                    @-moz-document url("about:newtab"), url("about:home") {
                        * {
                            font-family: "Iosevka" !important;
                        }
                        body {
                            background-color: ${theme.base00} !important;
                        }
                        .logo-and-wordmark {
                            display: none !important;
                        }
                        .SnippetBaseContainer {
                            display: none !important;
                        }
                        .search-handoff-button {
                            border-radius: 15px !important;
                            border-width: 4px !important;
                            border-color: ${theme.base02} !important;
                            background-size: 0px !important;
                            background-color: ${theme.base00} !important;
                            padding-inline-start: 10px !important;
                            padding-inline-end: 10px !important;
                        }
                        .icon-settings {
                            display: none !important;
                        }
                        .fake-textbox {
                            text-align: center !important;
                        }
                        .search-wrapper input {
                            background-color: ${theme.BLACK} !important;
                            border-radius: 0px !important;
                            background-image: none !important;
                            background-size: none !important;
                            text-align: center !important;
                            font-size: 17px !important;
                            padding-inline-start: 10px !important;
                            padding-inline-end: 10px !important;
                        }
                        .search-wrapper input:focus {
                            text-align: left !important;
                        }
                        .body-wrapper {
                            display: none !important;
                        }
                    }
                '';
            };
        };
    };
}
