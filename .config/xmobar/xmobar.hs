Config { 
	font            = "xft:Droid Sans Mono Nerd Font:pixelsize=30:antialias=true:hinting=true"
       , additionalFonts = [ "xft:Iosevka Nerd Font:pixelsize=20:antialias=true:hinting=true"
                           , "xft:Font Awesome 5 Free Solid:pixelsize=22"
                           , "xft:Fira Code Nerd Font:pixelsize=18:antialias=true:hinting=true"
                           , "xft:Material Design Icons:size=17"
                           , "xft:Material Design Icons:size=15"
                           , "xft:Font Awesome 5 Brands:pixelsize=12"
                           ]
       -- , bgColor      = "#2e3440"
       , bgColor      = "#0f1213"
       , fgColor      = "#ccdce4"
       -- Position TopSize and BottomSize take 3 arguments:
       --   an alignment parameter (L/R/C) for Left, Right or Center.
       --   an integer for the percentage width, so 100 would be 100%.
       --   an integer for the minimum pixel height for xmobar, so 24 would force a height of at least 24 pixels.
       --   NOTE: The height should be the same as the trayer (system tray) height.
       -- , position       = TopSize L 98 50
       , position       = Static {xpos = 10, ypos = 5, width = 465, height = 50}
       -- , position       = TopSize L 100 50
       , lowerOnStart = True
       , hideOnStart  = False
       , allDesktops  = True
       , persistent   = True
       , iconRoot     = ".xmonad/xpm/"  -- default: "."
       , commands = [
                     Run UnsafeStdinReader
                    , Run BatteryP ["BAT1"]
                     ["-t", "<acstatus>"
                     , "-L", "20", "-H", "80"
                     , "--", "-O", "<fc=#87af87><fn=4>a</fn></fc> <fc=#87af87><left>%</fc>", "-o", "<fc=#bf616a><fn=4>s</fn></fc> <left>%", "-i", "<fc=#87af87><fn=4>b</fn></fc> <left>%"
                     , "-l", "#bf616a", "-h", "#87af87"
                     ,"-a", "notify-send -i ~/.config/dunst/icons/skull.svg -u critical -t 500 'BATREEEE \n GOBLOOOK \n '"
                     ,"-A", "20"
                     ] 10
                    , Run Date "<fc=#556A73><fn=4>c</fn> %A, %_d %B</fc> <fc=#556A73><fn=4>d</fn> %H:%M</fc>" "date" 10
                    -- , Run Date "<fc=#556A73><fn=4>󰅒</fn> %H:%M</fc>" "date" 10
                    , Run Volume "default" "Master"
                      [ "-t", "<status> <fc=#ccdce4><volume>%</fc>"
                      , "--"
                      , "-o", "<fn=4>\983946</fn>" , "-O", ""
                      , "-C", "#ccdce4" , "-c" , "#ea6962" 
                      , "-H", "60" , "-h", "<fn=>\983948</fn>", "-m" , "<fn=4>\983947</fn>"
                      , "-L", "30" , "-l", "<fn=4>\983945</fn>"
                      ] 1
                    , Run Brightness
                      ["-t", "<percent> <ipat>",  "--", "-D", "/sys/class/backlight/intel_backlight/"
                      ] 1 
                    -- , Run Memory ["-t", "<used>/<total>M"] 100
                    , Run Memory ["-t", "<used>M"] 100
                    , Run Wireless "" ["-t", "<ssid>"] 10
                    , Run Com "/home/thousandv/.config/xmobar/microphone.sh" [] "mic"1



                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " %UnsafeStdinReader% "
       -- \}\
       -- \<action=`xdotool key super+g`><fn=3>%date%</fn></action> \
       -- \{\
       -- \<action=`pavucontrol`><fn=3>%default:Master%</fn></action> \
       -- \<action=`sh ~/scripts/notification/mic.sh toggle`><fc=#8AA3AE><fn=3>%mic%</fn></fc></action> \
       -- \<action=`alacritty -e nmtui`><fn=3><fc=#5A7988><fn=4>󰖩</fn> %wi%</fc></fn></action> \
       -- \<fn=3><fc=#6E8E9C><fn=4>󰃛</fn> %bright%</fc></fn>\
       -- \<action=`xdotool key super+shift+y`><fn=3><fc=#9C7863><fn=4>󰘚</fn> %memory%</fc></fn></action> \
       -- \<fn=3>%battery%</fn> \
       -- "
       }

