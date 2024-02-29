#!/bin/bash

ALERT_IF_IN_NEXT_MINUTES=60
ALERT_POPUP_BEFORE_SECONDS=300
NERD_FONT_FREE="󱁕 "
NERD_FONT_MEETING="󰤙"

get_next_meeting() {
	next_meeting=$(gcalcli --calendar="gregoire@les-tilleuls.coop" agenda now now+2h --tsv)
    read time end_time title <<< $(echo "$next_meeting" | awk -F '\t' 'NR==1{print $2, $4, $5}')
}

calculate_times(){
    epoc_meeting=$(date -j -f "%T" "$time:00" +%s)
	epoc_now=$(date +%s)
    epoc_diff=$((epoc_meeting - epoc_now))
	minutes_till_meeting=$((epoc_diff/60))
}

display_popup() {
	tmux display-popup \
		-S "fg=#eba0ac" \
		-w50% \
		-h50% \
		-d '#{pane_current_path}' \
		-T meeting \
        gcalcli --calendar="gregoire@les-tilleuls.coop" agenda now now+8h --tsv | awk -F '\t' 'NR==1{print $2, $5}' 
}

print_tmux_status() {
	if [[ $minutes_till_meeting -lt $ALERT_IF_IN_NEXT_MINUTES \
		&& $minutes_till_meeting -gt -60 ]]; then
		echo "$NERD_FONT_MEETING \
			$time $title ($minutes_till_meeting minutes)"
	else
		echo "$NERD_FONT_FREE"
	fi

	if [[ $epoc_diff -gt $ALERT_POPUP_BEFORE_SECONDS && epoc_diff -lt $ALERT_POPUP_BEFORE_SECONDS+10 ]]; then
		display_popup
	fi
}

main() {
	get_next_meeting
	calculate_times
	print_tmux_status
	# echo "$minutes_till_meeting | $number_of_attendees"
}

main
