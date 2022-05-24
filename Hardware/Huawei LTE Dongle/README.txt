Initially a regular dongle will be used for acceleration of the integraration process, to be able to simplify the system.

It has already been configured and connected to the internet with a Raspbian OS App.

There is a guide for connecting a USB dongle with a chip: 
https://www.jeffgeerling.com/blog/2022/using-4g-lte-wireless-modems-on-raspberry-pi

In this case though we will use modem manager.


Modem Manager
#############


Open Terminal Window:

sudo apt update
sudo apt install modemmanager modem-manager-gui

sudo reboot now

For simplification and to incorporate this to the final system as a normal connection that the user can recognize easily we will
use the GUI version of the app.


