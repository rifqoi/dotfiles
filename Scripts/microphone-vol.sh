#!/bin/bash

microphone_volume=$(pactl list sources short | grep "alsa_input.pci-" | awk '{print $1}' | xargs -I{} pulsemixer --id {} --get-volume | awk {'print $1'})

while true 
do
	sleep 0.1 &&
	if [[ $microphone_volume -gt 45 ]]; then
		#echo "$(date) Volume: $microphone_volume" >> ~/Scripts/logs/mic_volume_logs.txt
		pactl list sources short | grep "alsa_input.pci-" | awk '{print $1}' | xargs -I{} pactl set-source-volume {} 45%
	fi
done
