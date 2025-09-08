#!/bin/bash

# CPU usage (percentage)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')

# CPU temp (°C)
cpu_temp=$(cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null | head -n1)
cpu_temp=$((cpu_temp / 1000))"°C"

# RAM usage (percentage)
ram_usage=$(free | awk '/Mem/ {printf("%.0f%%", $3/$2 * 100)}')

# RAM usage (gigabytes)
ram_gb=$(free -g | awk '/Mem:/ {print $3 " GB"}')

# GPU usage & temp (requires nvidia-smi, adjust if AMD)
if command -v nvidia-smi &>/dev/null; then
  gpu_usage=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits | head -n1)"%"
  gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n1)"°C"
else
  gpu_usage="N/A"
  gpu_temp="N/A"
fi

# Nerd Font icons:
#  (CPU),  (RAM), 󰢮 (GPU),  (Temp)
text=" $cpu_usage ($cpu_temp)   󰢮 $gpu_usage ($gpu_temp)    $ram_usage ($ram_gb)"

# Print JSON for Waybar
echo "{\"text\": \"$text\"}"
