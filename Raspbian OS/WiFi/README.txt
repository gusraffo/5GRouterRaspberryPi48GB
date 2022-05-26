################################################################################################################
Configuration of WiFi interface as Access Point in the following link:
https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-routed-wireless-access-point
################################################################################################################


There are two options for the WiFi Access point configuration:

1) Setting up a Bridged Wireless Access Point

The Raspberry Pi can be used as a bridged wireless access point within an existing Ethernet network. 
This will extend the network to wireless computers and devices.

If you wish to create a standalone wireless network, consider instead setting up a routed access point.

                                         +- RPi -------+
                                     +---+ 10.10.0.2   |          +- Laptop ----+
                                     |   |     WLAN AP +-)))  (((-+ WLAN Client |
                                     |   |  Bridge     |          | 10.10.0.5   |
                                     |   +-------------+          +-------------+
                 +- Router ----+     |
                 | Firewall    |     |   +- PC#2 ------+
(Internet)---WAN-+ DHCP server +-LAN-+---+ 10.10.0.3   |
                 |   10.10.0.1 |     |   +-------------+
                 +-------------+     |
                                     |   +- PC#1 ------+
                                     +---+ 10.10.0.4   |
                                         +-------------+
A bridged wireless access point can be created using the inbuilt wireless features of the Raspberry Pi 4, 
Raspberry Pi 3 or Raspberry Pi Zero W, or by using a suitable USB wireless dongle that supports access point mode. 
It is possible that some USB dongles may need slight changes to their settings. If you are having trouble with a 
USB wireless dongle, please check the forums.

This documentation was tested on a Raspberry Pi 3B running a fresh installation of Raspberry Pi OS Buster.


2) Setting up a Routed Wireless Access Point


A Raspberry Pi within an Ethernet network can be used as a wireless access point, creating a secondary network. The resulting 
new wireless network is entirely managed by the Raspberry Pi.

If you wish to extend an existing Ethernet network to wireless clients, consider instead setting up a bridged access point.

                                         +- RPi -------+
                                     +---+ 10.10.0.2   |          +- Laptop ----+
                                     |   |     WLAN AP +-)))  (((-+ WLAN Client |
                                     |   | 192.168.4.1 |          | 192.168.4.2 |
                                     |   +-------------+          +-------------+
                 +- Router ----+     |
                 | Firewall    |     |   +- PC#2 ------+
(Internet)---WAN-+ DHCP server +-LAN-+---+ 10.10.0.3   |
                 |   10.10.0.1 |     |   +-------------+
                 +-------------+     |
                                     |   +- PC#1 ------+
                                     +---+ 10.10.0.4   |
                                         +-------------+
A routed wireless access point can be created using the inbuilt wireless features of the Raspberry Pi 4, Raspberry Pi 3 or 
Raspberry Pi Zero W, or by using a suitable USB wireless dongle that supports access point mode. It is possible that some 
USB dongles may need slight changes to their settings. If you are having trouble with a USB wireless dongle, please check the forums.

This documentation was tested on a Raspberry Pi 3B running a fresh installation of Raspberry Pi OS Buster.


Router Option Prefered
######################

If you wish to extend an existing Ethernet network to wireless clients, consider instead setting up a bridged access point.

To have a Private LAN in the Raspberry and only the connectivity via Ethernet or/and LTE it is the preferred option and it will be 
investigated and teste in the first place. It should give extra benefits in terms of cyber security as it will be behind a NAT and also
the Routing can be better to choose the Gateway of last ressort to have differnt precedence between Eth0 and LTE. 

Other topics like firewall in the LAN can be taken into consideration as an advantage and last but not least the fact that there might
be a chance of load balancing taking into consideration different sessions.


ZTE Modem
#########
					 
The ZTE Antel Modems use Gigabit Ethernet in the 192.168.1.0/24 IP range.







wlan0 commands examples
#######################


NAME
       iw - show / manipulate wireless devices and their configuration

SYNOPSIS
       iw [ OPTIONS ] { help [ command ] | OBJECT COMMAND }

       OBJECT := { dev | phy | reg }

       OPTIONS := { --version | --debug }

OPTIONS
        --version
              print version information and exit.

        --debug
              enable netlink message debugging.

IW - COMMAND SYNTAX
   OBJECT
       dev <interface name>
              - network interface.

       phy <phy name>
              - wireless hardware device (by name).

       phy#<phy index>
              - wireless hardware device (by index).

       reg    - regulatory agent.

   COMMAND
       Specifies the action to perform on the object.  The set of possible actions depends on the object type.  iw help will print all supported commands, while iw help command will print the help for all matching commands.




#channels available in the country in this interface for dual band 802.11ac

pi@raspberrypi:~ $ sudo iw phy phy0 channels
Band 1:
	* 2412 MHz [1] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+
	* 2417 MHz [2] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+
	* 2422 MHz [3] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+
	* 2427 MHz [4] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+
	* 2432 MHz [5] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+
	* 2437 MHz [6] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+
	* 2442 MHz [7] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+
	* 2447 MHz [8] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+
	* 2452 MHz [9] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+
	* 2457 MHz [10] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40-
	* 2462 MHz [11] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40-
	* 2467 MHz [12] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40-
	* 2472 MHz [13] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40-
	* 2484 MHz [14] (disabled)
Band 2:
	* 5170 MHz [34] (disabled)
	* 5180 MHz [36] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+ VHT80
	* 5190 MHz [38] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+ VHT80
	* 5200 MHz [40] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5210 MHz [42] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5220 MHz [44] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5230 MHz [46] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- VHT80
	* 5240 MHz [48] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5260 MHz [52] 
	  Maximum TX power: 20.0 dBm
	  Radar detection
	  Channel widths: 20MHz HT40- HT40+ VHT80
	  DFS state: usable (for 327 sec)
	  DFS CAC time: 60000 ms
	* 5280 MHz [56] 
	  Maximum TX power: 20.0 dBm
	  Radar detection
	  Channel widths: 20MHz HT40- HT40+ VHT80
	  DFS state: usable (for 327 sec)
	  DFS CAC time: 60000 ms
	* 5300 MHz [60] 
	  Maximum TX power: 20.0 dBm
	  Radar detection
	  Channel widths: 20MHz HT40- HT40+ VHT80
	  DFS state: usable (for 327 sec)
	  DFS CAC time: 60000 ms
	* 5320 MHz [64] 
	  Maximum TX power: 20.0 dBm
	  Radar detection
	  Channel widths: 20MHz HT40- VHT80
	  DFS state: usable (for 327 sec)
	  DFS CAC time: 60000 ms
	* 5500 MHz [100] (disabled)
	* 5520 MHz [104] (disabled)
	* 5540 MHz [108] (disabled)
	* 5560 MHz [112] (disabled)
	* 5580 MHz [116] (disabled)
	* 5600 MHz [120] (disabled)
	* 5620 MHz [124] (disabled)
	* 5640 MHz [128] (disabled)
	* 5660 MHz [132] (disabled)
	* 5680 MHz [136] (disabled)
	* 5700 MHz [140] (disabled)
	* 5720 MHz [144] (disabled)
	* 5745 MHz [149] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40+ VHT80
	* 5765 MHz [153] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5785 MHz [157] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5805 MHz [161] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- HT40+ VHT80
	* 5825 MHz [165] 
	  Maximum TX power: 20.0 dBm
	  Channel widths: 20MHz HT40- VHT80
    
    
    
 #Nighbour WiFi networks dual band   
    pi@raspberrypi:~ $ sudo iw wlan0 scan | grep freq
	freq: 5240
		 * center freq segment 1: 42
		 * center freq segment 2: 0
	freq: 5805
		 * center freq segment 1: 155
		 * center freq segment 2: 0
	freq: 2412
	freq: 2412
	freq: 2422
	freq: 2437
	freq: 2442
	freq: 2462
	freq: 2462
	freq: 5320
		 * center freq segment 1: 58
		 * center freq segment 2: 0
	freq: 5320
		 * center freq segment 1: 58
		 * center freq segment 2: 0
	freq: 2437



    
