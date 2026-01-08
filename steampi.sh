#!/bin/bash

# Small delay at boot
sleep 4

# Launch Steam Link
steamlink &
PID=$!

# Wait for Steam Link to exit
wait $PID

# Show shutdown prompt with 10-second countdown
zenity --question \
  --title="SteamPi Shutdown" \
  --text="Steam Link has closed. Shutting down in 5 seconds unless you click Cancel." \
  --ok-label="Shutdown" \
  --cancel-label="Cancel" \
  --timeout=5

# $? returns exit code from zenity: 0 = OK, 1 = Cancel, -1 = timeout
if [ $? -eq 1 ]; then
    echo "Shutdown canceled. Returning to desktop."
    exit 0
else
    sudo shutdown -h now
fi
