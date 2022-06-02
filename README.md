# 5GRouterRaspberryPi48GB

This project is under the GNU General Public License v3.0, so it can be used as or modified as required. It serves as a platform for all the IoT enthusiasts that require a platform for connectivity to implment IoT projects. It is an IoT project itself but the objetive is give to the user/developer with the mobile 
communication/fixed solution that can be later on used for private projects like for example companies that want to provide home connectivity and control all 
the devices remotley via mosquito mqtt and ZeroTier System VPN. 

We focus in the connectiviy and will in the vendor folder put examples of chips and their applications for different projects. The use of modern 
LTE Advanced Pro compatible M.2 chips is highly adviced as they will perform far more better than LTE Rel-8 from 2010. 


This project has the objective of using RaspberryPi4b8GB running Raspbian OS as an internet WiFi 802.11ac Router and home Desktop. It should
work for fixed services using ethernet or/and LTE Advanced Pro M.2 form factor chips for long term evolution, including future proof 5G sub6GHz Rel.15 chips. But it is just one application for the system and one hardware configuration, as there are many raspberry pi models with differnt capabilities
that can be used according to the requirements of each user/deveolper.

The internet connection would be optionally as Gigabit Ethernet and/or 4.5G/5G M.2 form factor chips with Snapdragon Qualcomm modems as components of these chips.

In the development process it will be attempeted to have Eth0 + 4.5G modem added Upload/Download data speeds to improve fixed service upload using  lod balancer running in the OS.

It can also be used as a Rural Router with LTE Advanced Pro M.2 chips and with Eth0 for connecting a local Switch or PC/Laptop.

In terms of WiFi, the Raspi4b has 2 interfaces dual band and they are 802.11ac, which is not WiFi6, but an extra WiFi6 M.2 form factor can be added via USB to improve even more the speeds in the order of more than 1Gbps.

The two interfaces can be configured as Hot Spots in theory. The "iw" command controls most of WiFi interface configurations.

Two monitors can be connected to the Raspbi4b8GB. A camera that can use GPU and Tensor Flow for AI image inference, for recognition of images, video, etc.

Audio jack port is included.

GPIO should be used with a MODEM HAT, that uses also a USB3.0 link, to mount an M.2 female interface with external antennas ports and the micro SIM Card.

GPS is included in the 4.5G/5G M.2 form factor chips.

The specifications of the raspberry4b8GB can be see in the Hardwar folder of the repository.

As 5G chips are more expensive 250 dollars, compared to 25 dollars of WiFi6, this model of house/office router would allow a cheap solution as only one 5G Sub6Ghz chip has to be aquired is cheaper for the customer. It is the model of the CPE (Customer Premises Equipment) that is more economic for the customers, ad they can buy WiFi6 devices and connect the CPE for high speed data rates both in uplink and downlink.

4.5G chips M.2 are have different categories with different max speeds in downlink and uplink and also have different cost gamma, so the customer offerings can be wide and it can also be easily upgraded for better chips, returning he old ones for other customers that require an entry level.

The routing has to be modified according with the option chosen and there should be a web interface to be able to reconfigure different options easily.
The options are mentioned in other files in depth. 

Open Tier Systems will be used to create VPN network for private customers or companies and it also allows connectivity to the remote RaspberryPis for confiuration, update, support and also allow MQTT Server to be used to have the Raspberries subscribed to Topics in order to report information or other tasks like check connectivity, etc.


Mobile device Categories:
#########################

Cat 4 150 down / 50 Up
Cat 6 300 down / 150 up
Cat 12 600 down / 150 Up


