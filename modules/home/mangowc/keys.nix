{pkgs, ...}: ''
	repeat_rate=25
	repeat_delay=600
	numlockon=0
	xkb_rules_layout=us,ua
	xkb_rules_options=grp:win_space_toggle

  bind=SUPER,r,reload_config

  bind=Ctrl,space,spawn,fuzzel
  bind=SUPER,q,spawn,ghostty +new-window
  bind=SUPER,s,spawn,flameshot gui

  bind=SUPER,c,killclient,

  bind=SUPER,Tab,focusstack,next
  bind=SUPER,Left,focusdir,left
  bind=SUPER,Right,focusdir,right
  bind=SUPER,Up,focusdir,up
  bind=SUPER,Down,focusdir,down

  bind=SUPER+SHIFT,Up,exchange_client,up
  bind=SUPER+SHIFT,Down,exchange_client,down
  bind=SUPER+SHIFT,Left,exchange_client,left
  bind=SUPER+SHIFT,Right,exchange_client,right

  bind=SUPER,g,toggleglobal,
  bind=ALT,Tab,toggleoverview,
  bind=SUPER,t,togglefloating,
  bind=SUPER,a,togglemaximizescreen,
  bind=SUPER,f,togglefullscreen,
  bind=SUPER+SHIFT,f,togglefakefullscreen,
  bind=SUPER,i,minimized,
  bind=SUPER,o,toggleoverlay,
  bind=SUPER+SHIFT,I,restore_minimized
  bind=ALT,z,toggle_scratchpad

  bind=SUPER,n,switch_layout

  bind=SUPER,1,view,1,0
  bind=SUPER,2,view,2,0
  bind=SUPER,3,view,3,0
  bind=SUPER,4,view,4,0
  bind=SUPER,5,view,5,0
  bind=SUPER,6,view,6,0
  bind=SUPER,7,view,7,0
  bind=SUPER,8,view,8,0
  bind=SUPER,9,view,9,0

  bind=SUPER+SHIFT,1,tag,1,0
  bind=SUPER+SHIFT,2,tag,2,0
  bind=SUPER+SHIFT,3,tag,3,0
  bind=SUPER+SHIFT,4,tag,4,0
  bind=SUPER+SHIFT,5,tag,5,0
  bind=SUPER+SHIFT,6,tag,6,0
  bind=SUPER+SHIFT,7,tag,7,0
  bind=SUPER+SHIFT,8,tag,8,0
  bind=SUPER+SHIFT,9,tag,9,0

  bind=alt+shift,Left,focusmon,left
  bind=alt+shift,Right,focusmon,right
  bind=SUPER+Alt,Left,tagmon,left
  bind=SUPER+Alt,Right,tagmon,right

  bind=ALT+SHIFT,X,incgaps,1
  bind=ALT+SHIFT,Z,incgaps,-1
  bind=ALT+SHIFT,R,togglegaps

  bind=CTRL+SHIFT,Up,movewin,+0,-50
  bind=CTRL+SHIFT,Down,movewin,+0,+50
  bind=CTRL+SHIFT,Left,movewin,-50,+0
  bind=CTRL+SHIFT,Right,movewin,+50,+0

  bind=CTRL+ALT,Up,resizewin,+0,-50
  bind=CTRL+ALT,Down,resizewin,+0,+50
  bind=CTRL+ALT,Left,resizewin,-50,+0
  bind=CTRL+ALT,Right,resizewin,+50,+0

  mousebind=SUPER,btn_left,moveresize,curmove
  mousebind=SUPER,btn_right,moveresize,curresize
  mousebind=NONE,btn_left,toggleoverview,1
  mousebind=NONE,btn_right,killclient,0

  axisbind=SUPER,UP,viewtoleft_have_client
  axisbind=SUPER,DOWN,viewtoright_have_client
''
