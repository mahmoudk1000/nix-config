{ theme }:

with theme;

''
  :root {
    --button-bgcolor: ${base0A} !important;
    --button-hover-bgcolor: ${base0E} !important;
    --button-active-bgcolor: ${base06} !important;
    --button-primary-bgcolor: ${base06} !important;
    --button-primary-hover-bgcolor: ${base06} !important;
    --button-primary-active-bgcolor: ${base0E} !important;
    --button-primary-color: ${base00} !important;
    --input-bgcolor: ${base02} !important;
    --input-color: ${base01} !important;
    --input-border-color: ${base0A} !important;
    --lwt-accent-color: ${base00} !important;
    --lwt-text-color: ${base01} !important;
    --foldertree-background: ${base00} !important;
    --tree-view-bg: ${base00} !important;
    --tree-card-background: ${base00} !important;
    --tree-card-background-selected-current-unfocused: ${base0A} !important;
    --tabs-toolbar-background-color: ${base00} !important;
    --color-green-40: ${base04} !important;
    --color-green-60: ${base0C} !important;
  }
  element {
    -tab-max-width: 200px !important;
  }
  #unifiedToolbarContainer,
  #unifiedToolbar {
    display: none !important;
  }
  #threadTree[rows="thread-card"] {
    background-color: ${base00} !important;
  }
  table[is="tree-view-table"] {
    background-color: ${base02} !important;
    color: ${base01} !important;
  }
  .button {
    background-color: ${base02} !important;
  }
  .button.button-primary {
    background-color: ${base06} !important;
    color: ${base00} !important;
    border-color: ${base06} !important;
  }
  #messagePane {
    background-color: ${base00} !important;
  }
  #accountCentral {
    background-color: ${base00} !important;
  }
  #messageHeader {
    background-color: ${base02} !important;
  }
  #calendarViewHeader {
    background-color: ${base02} !important;
  }
  .calview-toggle {
    background-color: ${base00} !important;
  }
  button.calview-toggle-item {
    background-color ${base02} !important;
  }
  .minimonth-month-box,
  .minimonth-cal-box {
    background-color: ${base02} !important;
  }
  .minimonth-nav-section {
    background-color: ${base06} !important;
  }
  #folderTree:focus-within li.selected > .container, #folderTree li.drop-target > .container,
  .minimonth-week {
    background-color: ${base0A} !important;
    color: ${base01} !important;
  }
  .minimonth-day[selected="true"][today="true"] {
    background-color: ${base06} !important;
    border: 1px solid ${base06} !important;
    color: ${base00} !important;
  }
  .btn-hub,
  li:not(.selected) > .container:hover,
  .tab-background[selected="true"],
  .thread-card-container:focus,
  .thread-card-container:active,
  .container:focus,
  .calendar-month-day-box-other-month,
  .calendar-month-day-box-current-month[selected="true"],
  .calendar-month-day-box-other-month.calendar-month-day-box-day-off,
  #agenda-toolbar,
  .agenda-date-header,
  tr[is="thread-card"][data-properties~="unread"]:not(.selected, :hover) {
    background-color: ${base0A} !important;
  }
  .minimonth-day[selected="true"],
  .calendar-month-day-box-current-month[selected="true"], .calendar-month-day-box-day-off[selected="true"], .calendar-month-day-box-other-month[selected="true"]{
    border: 1px solid ${base06} !important;
  }
  .calendar-month-day-box-date-label[relation="today"][selected="true"]{
    color: ${base00} !important;
  }
  .calendar-month-day-box-date-label[relation="today"] {
    background-color: ${base06} !important;
  }
  .calendar-month-day-box-day-off,
  button.calview-toggle-item,
  #agenda-toolbar,
  .tab-content {
    background-color: ${base02} !important;
  }
  .tabmail-tab:not([selected], :-moz-lwtheme),
  .new-messages > .container > .name,
  #threadTree [data-properties~="new"]:not(.selected) .thread-card-container :is(.subject, .date) {
    color: ${base06} !important;
  }
  .notification-button-container, .notification-message {
    color: ${base00} !important;
  }
  li.selected > .container, [is="tree-view-table-body"]:focus > .selected, [is="tree-view-table-body"]:focus-within > .selected, [is="tree-view-table-body"] > .selected:focus-within, .unread > .container > .unread-count, .new-messages > .container > .unread-count, li.selected > .container, button.calview-toggle-item[role="tab"][aria-selected="true"], button.calview-toggle-item[role="tab"][aria-selected="true"] {
    color: ${base06} !important;
    background-color: ${base0A} !important;
  }
  .unread > .container > .unread-count,
  .new-messages > .container > .unread-count {
    color: ${base00} !important;
    background-color: ${base06} !important;
  }
  .recipient-avatar {
    background-color: ${base00} !important;
    color: ${base06} !important;
  }
  .message-header-view-button {
    fill: ${base06 + "DD"} !important;
  }
  calendar-day-label {
    color: ${base01} !important;
    background-color: ${base00} !important;
  }
  calendar-day-label[relation="today"] {
    color: ${base06} !important;
    background-color: ${base06 + "30"} !important;
  }
  #agenda {
    background-color: ${base00}  !important;
    --selected-background: ${base06} !important;
    --selected-foreground: ${base00} !important;
  }
  #attachmentBar {
    background-color: ${base02} !important;
  }
  .calendar-notification-bar {
    background-color: ${base07} !important;
    color: ${base00} !important;
  }
  .notificationbox-stack,
  :host([type="info"]) .icon,
  .list-header-bar:not([hidden]),
  .monthtable,
  .calendar-month-day-box-current-month,
  #mini-day-image,
  #today-pane-panel > .sidebar-header,
  #calendar-task-tree,
  #quick-filter-bar,
  #task-addition-box,
  #unifinder-searchBox,
  #calendar-panel,
  #calSidebar,
  #view-box,
  #tabs-toolbar,
  #toolbar-menubar,
  #statusTextBox,
  #calendar-list > li.selected,
  #folderPaneHeaderBar:not([hidden]),
  calendar-month-view, calendar-multiweek-view,
  #folderPane {
    background-color: ${base00} !important;
  }
  #threadTree[rows="thread-card"] {
    & .card-layout {
      background-color: ${base00} !important;
    }
  }
  #categories {
    & > .category {
      border-color: none !important;
    }
  }
  .sidebar-footer-link {
    border-color: none !important;
  }
  #tabmail-arrowscrollbox {
    &::part(scrollbox-clip) {
      background-color: ${base00} !important;
    }
  }
  :root[tabsintitlebar] {
    &:not([lwtheme]) #navigation-toolbox {
      &:-moz-window-inactive {
        color: ${base0A} !important;
      }
    }
  }
  :is(ul, ol)[role="tree"] {
  & .container {
    margin-inline: 0 !important;
    margin: 1px 0px 1px 0px !important;
  }
  #tabs-toolbar {
    box-shadow: none !important;
    padding-top: 1px !important;
    padding-inline: 2px !important;
  }
''
