{ theme }:

with theme;

''
  .sidebar-footer-icon, .category-icon {
    fill: ${base06 + "DD"} !important;
  }
  #categories > .category[selected],
  #searchInput {
    background-color: ${base02} !important;
  }
  .sticky-container,
  .main-search,
  .main-heading,
  #content,
  #sidebar,
  #pref-category-box,
  #accountTreeBox,
  #containerBox,
  #preferencesContainer {
    background-color: ${base00} !important;
  }
''
