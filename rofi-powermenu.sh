#!/bin/bash

# Create a temporary file to hold the options
TMPFILE=$(mktemp)

# Define the options
echo "󰍃 Logout" >> $TMPFILE
echo " Reboot" >> $TMPFILE
echo " Shutdown" >> $TMPFILE
echo " Lock" >> $TMPFILE
echo "󰋊 Hibernate" >> $TMPFILE

# Use rofi to display the options
CHOICE=$(rofi -dmenu -i -p "Power Menu" < $TMPFILE)

# Execute the chosen option
case "$CHOICE" in
    "󰍃 Logout")
        i3-msg exit  # Change this if you're using a different window manager
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Shutdown")
        systemctl poweroff
        ;;
    " Lock")
        i3lock
        ;;
    "󰋊 Hibernate")
        systemctl hibernate
        ;;
    *)
        echo "No valid option selected."
        ;;
esac

# Clean up
rm $TMPFILE

