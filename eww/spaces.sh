# This script is used in a <literal> tag in the bar, as the <space/> widget.
# It's refreshed (re-ran) on every space change with a signal set in my yabai config.

spaces_query=$(yabai -m query --spaces --display)
windows=true
output="<box class='spaces' vexpand='true' space-evenly='false'>"
for space in $(echo $spaces_query | jq -c '.[]')
do
	index="$(echo $space | jq .index)"
	if [ $(echo $space | jq .visible) = 1 ]
	then
		output+="<label class='visible-space' text='$index'/>"
	else
		output+="<button class='space' onclick='yabai -m space --focus $index'>$index</button>"
	fi

done
output+="</box>"
echo $output
