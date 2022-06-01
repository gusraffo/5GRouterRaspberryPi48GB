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



Initial Result
##############

Modem Manager worked with the Huawei M.2 form factor Huawei Chip and the USB adator with the SIM Slot.

Connection of the two antennas and the configuration of a connection APN antel.lte and International Code 78401 with *99# with no user and password worked smoothly and the web browser is working in the internet.

Some pictures with the design are shown in this folder.
