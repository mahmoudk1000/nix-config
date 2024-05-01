{ theme }:

with theme;

''
  @namespace url("http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul");
  * {
    font-family: "Iosevka" !important;
    font-size: 12px !important;

    --arrowpanel-background: ${base00} !important;
    --arrowpanel-border-color: ${base02} !important;
    --autocomplete-popup-highlight-color: ${base01} !important;
    --autocomplete-popup-highlight-background: ${base06} !important;
    --toolbarbutton-active-background: ${base06} !important;
    --lwt-toolbarbutton-icon-fill-attention: var(--button-primary-bgcolor, ${base06}) !important;
    --toolbar-field-focus-border-color: ${base06} !important;
  }
  .toolbar {
    background-color: ${base00} !important;
  }
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
  .tab-background[selected="true"] {
    background-color: ${base00} !important;
    -moz-appearance: none !important;
    background-image: none !important;
    border: none !important;
  }
  .tab-background {
    background-color: ${base02} !important;
    border-radius: 0px !important;
    margin-block: 0px !important;
    border-bottom: 2px solid ${base09};
  }
  .tabbrowser-tab:hover .tab-background {
    background-color: ${base09} !important;
  }
  .tabbrowser-tab[selected="true"] .tab-background {
    background-color: ${base00} !important;
  }
  .tabbrowser-tab[fadein] {
    max-width: 100vw !important;
  }
  #urlbar {
    background-color: #11171D !important;
    border-radius: 10px !important;
  }
  #urlbar-input, #urlbar-scheme, .searchbar-textbox {
    color: ${base09} !important;
  }
  #nav-bar {
    background-color: ${base02} !important;
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
    height: 35px !important;
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
    color: ${base06} !important;
  }
  #save-to-pocket-button {
    visibility: hidden !important;
  }
  #PanelUI-button {
    border-image-slice: 0 !important;
  }
  #urlbar-input {
    background-color: ${base00} !important;
  }
  .urlbar-input-box {
    text-indent: 4px !important;
    padding-left: 4px !important;
  }
  #urlbar-results {
    background-color: ${base00} !important;
    border-radius: 5px !important;
  }
  #urlbar-results .urlbarView-row:hover{
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
  #nav-bar {
    border-bottom: 0px !important;
    box-shadow: none !important;
  }
  #urlbar ::-moz-selection,
  .searchbar-textbox ::-moz-selection {
    background-color: ${base01} !important;
    color: ${base09} !important;
  }
  #tabbrowser-tabpanels {
    background-color: ${base01} !important;
  }
  urlbar > #urlbar-background {
    background-color: ${base00} !important;
  }
  #urlbar-background {
    background-color: ${base00} !important;
    color: ${base02} !important;
    border: 1px solid ${base06} !important;
  }
  #urlbar-background:not([focused]) {
    background-color: ${base00} !important;
    color: ${base02} !important;
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
  .checkbox-check[checked] {
    color: ${base09} !important;
  }
  .browserContainer > findbar {
    background-color: ${base09} !important;
  }
''
