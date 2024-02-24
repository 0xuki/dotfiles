configuration {
  font:                           "JetBrainsMono Nerd Font 12";
  drun-display-format:            "{name}";
  disable-history:                false;
  sidebar-mode:                   false;
}

@import "colors.rasi"

window {
  transparency:                   "real";
  background-color:               @bg;
  text-color:                     @fg;
  border:                         0px;
  border-color:                   @ac;
  border-radius:                  8px;
  width:                          18%;
  location:                       center;
  x-offset:                       0;
  y-offset:                       0;
}

prompt {
  enabled:                        true;
  padding:                        0.30% 1% 0% -0.5%;
  background-color:               @al;
  text-color:                     #81A1C1;
  font:                           "JetBrainsMono Nerd Font 14";
}

entry {
  background-color:               @al;
  text-color:                     #87CEFA;
  placeholder-color:              @bg;
  expand:                         true;
  horizontal-align:               0;
  placeholder:                    "Search";
  padding:                        0.10% 0% 0% 0%;
  blink:                          true;
}

inputbar {
  children:                       [ prompt, entry ];
  background-color:               @ac;
  text-color:                     @bg;
  expand:                         false;
  border:                         0% 0% 0% 0%;
  border-radius:                  0px;
  border-color:                   @ac;
  margin:                         0% 0% 0% 0%;
  padding:                        1.5%;
}

listview {
  background-color:               @al;
  padding:                        0px;
  columns:                        1;
  lines:                          5;
  spacing:                        0%;
  cycle:                          false;
  dynamic:                        true;
  layout:                         vertical;
}

mainbox {
  background-color:               @al;
  border:                         0% 0% 0% 0%;
  border-radius:                  0% 0% 0% 0%;
  border-color:                   @ac;
  children:                       [ inputbar, listview ];
  spacing:                        0%;
  padding:                        0%;
}

element {
  background-color:               @al;
  text-color:                     #FAF4FC;
  orientation:                    horizontal;
  border-radius:                  0%;
  padding:                        1% 0.5% 1% 0.5%;
}

element-icon {
  background-color:               inherit;
  text-color:                     inherit;
  horizontal-align:               0.5;
  vertical-align:                 0.5;
  size:                           32px;
  border:                         0px;
}

element-text {
  background-color:               @al;
  text-color:                     inherit;
  expand:                         true;
  horizontal-align:               0;
  vertical-align:                 0.5;
  margin:                         0% 0.25% 0% 0.25%;
}

element selected {
  background-color:               @se;
  text-color:                     @fg;
  border:                         0% 0% 0% 0%;
  border-radius:                  0px;
  border-color:                   @bg;
}
