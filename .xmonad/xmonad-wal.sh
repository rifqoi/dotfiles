
#!/bin/bash

input="/home/thousandv/.cache/wal/colors.yml"
# yq is a command line yaml parser which allows querring yaml with a selector
# yq special.background
# yq special.foreground

background=$(yq .special.background ~/.cache/wal/colors.yml | tr -d \" )
foreground=$(yq .special.foreground ~/.cache/wal/colors.yml | tr -d \" )

color0=$(yq .colors.color0 ~/.cache/wal/colors.yml | tr -d \" )
color1=$(yq .colors.color1 ~/.cache/wal/colors.yml | tr -d \" )
color2=$(yq .colors.color2 ~/.cache/wal/colors.yml | tr -d \" )
color3=$(yq .colors.color3 ~/.cache/wal/colors.yml | tr -d \" )
color4=$(yq .colors.color4 ~/.cache/wal/colors.yml | tr -d \" )
color5=$(yq .colors.color5 ~/.cache/wal/colors.yml | tr -d \" )
color6=$(yq .colors.color6 ~/.cache/wal/colors.yml | tr -d \" )
color7=$(yq .colors.color7 ~/.cache/wal/colors.yml | tr -d \" )
color8=$(yq .colors.color8 ~/.cache/wal/colors.yml | tr -d \" )
color9=$(yq .colors.color9 ~/.cache/wal/colors.yml | tr -d \" )
color10=$(yq .colors.color10 ~/.cache/wal/colors.yml | tr -d \" )
color11=$(yq .colors.color11 ~/.cache/wal/colors.yml | tr -d \" )
color12=$(yq .colors.color12 ~/.cache/wal/colors.yml | tr -d \" )
color13=$(yq .colors.color13 ~/.cache/wal/colors.yml | tr -d \" )
color14=$(yq .colors.color14 ~/.cache/wal/colors.yml | tr -d \" )
color15=$(yq .colors.color15 ~/.cache/wal/colors.yml | tr -d \" )

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/.config/xmobar/xmobar-template.hs > /home/thousandv/.config/xmobar/xmobar.hs

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/.config/xmobar/xmobar-template-original.hs > /home/thousandv/.config/xmobar/xmobar-original.hs

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/.config/xmobar/xmobar-template2.hs > /home/thousandv/.config/xmobar/xmobar2.hs

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/.config/xmobar/xmobar-template3.hs > /home/thousandv/.config/xmobar/xmobar3.hs

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/.config/xmobar/xmobar-template4.hs > /home/thousandv/.config/xmobar/xmobar4.hs

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/.config/xmobar/xmobar-template5.hs > /home/thousandv/.config/xmobar/xmobar5.hs

sed -e "s/BGCOLOR/\"$background\"/g" \
    -e "s/FGCOLOR/\"$foreground\"/g" \
    -e "s/COLOR1/\"$color1\"/g" \
    -e "s/COLOR2/\"$color2\"/g" \
    -e "s/COLOR3/\"$color3\"/g" \
    -e "s/COLOR4/\"$color4\"/g" \
    -e "s/COLOR5/\"$color5\"/g" \
    -e "s/COLOR6/\"$color6\"/g" \
    -e "s/COLOR7/\"$color7\"/g" \
    -e "s/COLOR8/\"$color8\"/g" \
    -e "s/COLOR9/\"$color9\"/g" \
    -e "s/COLOR10/\"$color10\"/g" \
    -e "s/COLOR11/\"$color11\"/g" \
    -e "s/COLOR12/\"$color12\"/g" \
    -e "s/COLOR13/\"$color13\"/g" \
    -e "s/COLOR14/\"$color14\"/g" \
    -e "s/COLO15/\"$color15\"/g" \
    /home/thousandv/.xmonad/xmonad-template.hs > /home/thousandv/.xmonad/xmonad.hs

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/scripts/notification/volume-template.sh> /home/thousandv/scripts/notification/volume.sh

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    -e "s/COLOR1/$color1/g" \
    -e "s/COLOR2/$color2/g" \
    -e "s/COLOR3/$color3/g" \
    -e "s/COLOR4/$color4/g" \
    -e "s/COLOR5/$color5/g" \
    -e "s/COLOR6/$color6/g" \
    -e "s/COLOR7/$color7/g" \
    -e "s/COLOR8/$color8/g" \
    -e "s/COLOR9/$color9/g" \
    -e "s/COLOR10/$color10/g" \
    -e "s/COLOR11/$color11/g" \
    -e "s/COLOR12/$color12/g" \
    -e "s/COLOR13/$color13/g" \
    -e "s/COLOR14/$color14/g" \
    -e "s/COLOR15/$color15/g" \
    /home/thousandv/scripts/notification/mic-template.sh > /home/thousandv/scripts/notification/mic.sh

# SVG
sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    ~/.config/dunst/icons/health-increase-template.svg > ~/.config/dunst/icons/health-increase.svg

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    ~/.config/dunst/icons/health-decrease-template.svg> ~/.config/dunst/icons/health-decrease.svg

sed -e "s/BGCOLOR/$background/g" \
    -e "s/FGCOLOR/$foreground/g" \
    ~/.config/dunst/icons/skull-template.svg> ~/.config/dunst/icons/skull.svg
killall xmobar
xmonad --recompile; xmonad --restart
