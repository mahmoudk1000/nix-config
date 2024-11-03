{ theme, font }:

with theme;

''
  @namespace url("http://www.w3.org/1999/xhtml");
  :root {
    scrollbar-color: ${base00} ${base02};
  }
  * {
    scrollbar-width: thin;
  }
  @-moz-document url-prefix("about:") {
    :root {
      --in-content-page-background: ${base00} !important;
      --toolbar-field-focus-border-color: ${base06} !important;
      --toolbarbutton-active-background: ${base06} !important;
    }
  }
  @-moz-document url("about:newtab"), url("about:home") {
    * {
      font-family: "${font.name}" !important;
    }
    body {
      background-color: ${base00} !important;
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
      border-color: ${base02} !important;
      background-size: 0px !important;
      background-color: ${base00} !important;
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
      background-color: ${base0A} !important;
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
''
