theme="launcher_theme"
dir="$HOME/.config/rofi"

# nord
ALPHA="#00000000"
BG="#3B425380"
FG="#BF616A"
SELECT="#343a4680"
ACCENT="#3B425280"

# overwrite colors file
cat > $dir/colors.rasi <<- EOF
	/* colors */

	* {
	  al:  $ALPHA;
	  bg:  $BG;
	  se:  $SELECT;
	  fg:  $FG;
	  ac:  $ACCENT;
	}
EOF

rofi -no-lazy-grab -show drun -modi drun -theme $dir/"$theme"
