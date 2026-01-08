**SteamPi Auto-Shutdown**

This is a small script for a Raspberry Pi that auto-launches Steam Link when the Pi starts and shuts it down safely when you exit. It even gives a prompt so you can cancel the shutdown if you need to use the desktop.

**What you need**

- Raspberry Pi running Raspberry Pi OS

- Steam Link installed (sudo apt install steamlink)

- Zenity for the popup (sudo apt install zenity) but should be pre-isntalled with Raspbian

- Pi user allowed to shutdown without password (add pi ALL=(ALL) NOPASSWD: /sbin/shutdown in sudo visudo)

**How to use**

- Put the script somewhere, for example /home/pi/steampi.sh

**Make it executable:**

- sudo chmod +x /home/pi/steampi.sh


**Add it to autostart:**

- sudo nano /etc/xdg/labwc/autostart
- Paste /home/pi/steampi.sh to the bottom of the list
- Save and exit (ctrl+o, ENTER, ctrl+x)


Reboot. Steam Link will start automatically after a 4 second delay and then shutdown automatically unless you click cancel in a prompt within 5 seconds. If you click Cancel on the popup, the Pi won’t shut down and you can use the desktop.

You can change the countdown time's for both the launch and shut down by editing line 4 (sleep 4) and line 19 (--timeout=5). I find the 4 second delay for launch gives enough time for the desktop and drivers to load and doesn't feel too long. The 5 second shutdown also is enough time to click but not too long that it's annoying.
