{ theme, font }:

with theme;

''
  /* General Styling */
  * {
    font-family: "${font.name}" !important;
    font-size: 12px !important;

    --arrowpanel-background: ${base00} !important;
    --arrowpanel-border-color: ${base02} !important;
    --autocomplete-popup-highlight-color: ${base01} !important;
    --autocomplete-popup-highlight-background: ${base06} !important;
    --toolbarbutton-active-background: ${base06} !important;
    --lwt-toolbarbutton-icon-fill-attention: var(--button-primary-bgcolor, ${base06}) !important;
    --toolbar-field-focus-border-color: ${base06} !important;
  }

  /* Toolbar Styling */
  .toolbar {
    background-color: ${base00} !important;
  }
  #nav-bar {
    background-color: ${base02} !important;
    -moz-appearance: none !important;
    background-image: none !important;
    border: none !important;
    transition: margin 0.5s !important;
    border-bottom: 0px !important;
    box-shadow: none !important;
  }
  #navigator-toolbox {
    background: none !important;
  }
  #navigator-toolbox:not(:focus-within):not(:hover) #nav-bar {
    margin-top: -40px !important;
  }
  #TabsToolbar {
    z-index: 1000 !important;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
    padding: 0 !important;
    background: none !important;
    max-height: 40px !important;
  }
  #toolbar-menubar:not([inactive=true]) {
    margin-bottom: 0 !important;
    margin-top: 0 !important;
  }

  /* Window and Main Styling */
  window,
  #main-window,
  #toolbar-menubar,
  #TabsToolbar,
  #PersonalToolbar,
  #navigator-toolbox,
  #sidebar-box {
    background-color: ${base02} !important;
    -moz-appearance: none !important;
    background-image: none !important;
    border: none !important;
  }
  #tabbrowser-tabs {
    -moz-box-flex: 1 !important;
    text-align: center !important;
  }
  #tabbrowser-tabs[orient="horizontal"] {
    min-height: 40px !important;
    max-height: 40px !important;
  }
  #tabbrowser-tabs:not([noshadowfortests]) .tab-background:is([selected], [multiselected]) {
    box-shadow: none !important;
  }

  /* Tab Styling */
  .tab-background[selected="true"],
  .tabbrowser-tab[selected="true"] .tab-background {
    background-color: ${base00} !important;
    -moz-appearance: none !important;
    background-image: none !important;
    border: none !important;
  }
  .tab-background {
    background-color: ${base02} !important;
    border-radius: 0px !important;
    margin-block: 0px !important;
    border-bottom: 2px solid ${base0A};
  }
  .tabbrowser-tab:hover .tab-background {
    background-color: ${base0A} !important;
  }
  .tabbrowser-tab[fadein] {
    max-width: 100vw !important;
  }
  .tabbrowser-tab {
    height: 40px !important;
    z-index: 1000 !important;
    padding: none !important;
    padding-inline: 0px !important;
  }
  .tabbrowser-tab::before,
  .tabbrowser-tab::after,
  .tab-close-button,
  #tabs-newtab-button,
  .tab-secondary-label,
  .tab-icon-image:not([pinned]),
  #identity-box,
  #tracking-protection-icon-container,
  #alltabs-button,
  #whats-new-menu-button,
  #pocket-button,
  #save-to-pocket-button,
  #pageActionSeparator,
  #reader-mode-button,
  #urlbar-one-offs-header-label,
  .titlebar-buttonbox-container,
  .titlebar-spacer {
    display: none !important;
  }
  .tab-line {
    display: none !important;
  }
  .tab-label {
    padding-top: 5px !important;
    overflow: hidden !important;
  }
  .tab-text,
  .tab-label {
    -moz-box-flex: 1 !important;
    text-align: center !important;
  }
  .tabbrowser-tab .tab-label-container,
  .tab-label-container {
    margin-inline-end: 7px !important;
    -moz-box-pack: center !important;
    -moz-box-orient: horizontal !important;
    display: grid !important;
    justify-content: safe center !important;
  }

  /* URL Bar Styling */
  #urlbar {
    background-color: ${base00} !important;
    border-radius: 10px !important;
    padding: 0 !important;
  }
  #urlbar-input,
  #urlbar-scheme,
  .searchbar-textbox {
    color: ${base0A} !important;
  }
  #urlbar-input {
    text-align: center !important;
    background-color: ${base00} !important;
    color: ${base01} !important;
  }
  .urlbar-input-box {
    text-indent: 4px !important;
    padding-left: 4px !important;
  }
  #urlbar-results {
    background-color: ${base00} !important;
    border-radius: 5px !important;
  }
  #urlbar-results .urlbarView-row:hover {
    color: ${base06} !important;
    border-radius: 5px !important;
  }
  .urlbarView-row[selected] .urlbarView-row-inner {
    border-radius: 5px !important;
    background-color: ${base06} !important;
    color: ${base00} !important;
  }
  .urlbarView-body-inner {
    border-top: none !important;
  }
  #urlbar ::-moz-selection,
  .searchbar-textbox ::-moz-selection {
    background-color: ${base01} !important;
    color: ${base0A} !important;
  }
  urlbar > #urlbar-background,
  #urlbar-background,
  #urlbar-background:not([focused]) {
    background-color: ${base00} !important;
    color: ${base02} !important;
    box-shadow: none !important;
    border: none !important;
    background: none !important;
    border-radius: 8px !important;
  }
  .search-one-offs > .search-panel-one-offs-header::before {
    display: block;
    content: "Search With:";
    padding-inline: var(--urlbarView-item-inline-padding) 18px;
    opacity: 0.6;
  }
  #urlbar:not(:hover) #page-action-buttons .urlbar-page-action:not([open]) {
    visibility: collapse;
  }
  #page-action-buttons .urlbar-page-action {
    position: absolute;
    right: 0;
  }
  #urlbar[breakout][breakout-extend] {
    z-index: 600 !important;
  }
  #urlbar {
    opacity: 0;
    pointer-events: none !important;
    transition: opacity 0.2s ease, visibility 0.2s ease;
  }
  #navigator-toolbox:hover #urlbar,
  #navigator-toolbox:focus-within #urlbar {
    opacity: 1;
    margin-top: calc((var(--urlbar-container-height) - 5px)) !important;
    pointer-events: auto !important;
  }

  /* Megabar: disable breakout */
  #urlbar[breakout][breakout-extend] {
    margin-left: 0 !important;
    width: var(--urlbar-width) !important;
    margin-top: calc((var(--urlbar-container-height) - var(--urlbar-height)) / 2) !important;

    > .urlbar-input-container {
      height: var(--urlbar-height) !important;
      padding-block: var(--urlbar-container-padding) !important;
      padding-inline: var(--urlbar-container-padding) !important;
    }
  }

  #urlbar[breakout][breakout-extend] > #urlbar-background {
    animation-name: unset !important;
  }

  #urlbar[breakout][breakout-extend] > :is(#urlbar-input-container,.urlbar-input-container) {
    height: var(--urlbar-height) !important;
    padding-block: 1px !important;
    padding-inline: 1px !important;
    border-bottom-left-radius: 0px !important;
    border-bottom-right-radius: 0px !important;
  }

  /* disable 'breakout' animation */
  #urlbar[breakout],
  #urlbar[breakout] * {
    animation: unset !important;
    duration: 0s !important;
    animation-duration: 0s !important;
  }

  .urlbarView-body-inner {
    border-top: 0px !important;
  }

  /* Other Elements Styling */
  #mainPopupSet menupopup,
  menupopup:not(.in-menulist) > menuitem,
  menupopup:not(.in-menulist) > menu {
    border: 0 !important;
    border-radius: 0px !important;
    padding: 0px 0px 0px 0px !important;
  }
  .checkbox-check[checked] {
    color: ${base0A} !important;
  }
  .browserContainer > findbar {
    background-color: ${base0A} !important;
  }
  .urlbarView {
    background: ${base02} !important;
    color: ${base01} !important;
    margin: 6px 0 0 0 !important;
    width: 100% !important;
    position: absolute !important;
    box-shadow: ${base0A} !important;
    border-radius: 12px !important;
    border: 0 !important;
  }
  #tabbrowser-tabpanels {
    background-color: ${base01} !important;
  }

  /* Button Styling */
  #back-button > .toolbarbutton-icon {
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
  #star-button {
    color: ${base06} !important;
  }

  /* Title Bar Styling */
  #titlebar {
    min-height: 0 !important;
    max-height: 40px !important;
  }
  .titlebar-spacer[type="pre-tabs"],
  .titlebar-spacer[type="post-tabs"] {
    width: 0 !important;
  }
  .titlebar-spacer {
    display: none !important;
  }
  #navigator-toolbox #titlebar {
    -moz-box-ordinal-group: 0;
    order: 0;
  }
  #navigator-toolbox #TabsToolbar {
    -moz-box-ordinal-group: 1;
    order: 1;
  }
  #navigator-toolbox toolbar {
    -moz-box-ordinal-group: 2;
    order: 2;
  }
  #navigator-toolbox #nav-bar,
  findbar {
    -moz-box-ordinal-group: 3;
    order: 3;
  }
  #navigator-toolbox #PersonalToolbar {
    -moz-box-ordinal-group: 4;
    order: 4;
  }
''
