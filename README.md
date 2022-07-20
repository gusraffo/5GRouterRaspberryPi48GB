# 5GRouterRaspberryPi48GB

This project is under the GNU General Public License v3.0, so it can be used as or modified as required. It serves as a platform for all the IoT enthusiasts that require a platform for connectivity to implment IoT projects. 

It is an IoT project itself but the objetive is give to the user/developer with the mobile/fixed solution that can be later used 
for private projects like for example private companies and anyone that want to provide mobile connectivity and control all 
the IoT devices of a fleet of devices remotley via mosquito mqtt and ZeroTier System VPN. 

We focus specifically in the connectivity solution because there are many ways to connect an IoT device nowadays. We want to make life easy for the 
developers of other areas of IT like Edge AI, Drones, Modems, Industry 4.0, V2-X, gaming, Mobile router or any LTE application that may arise. 


We will put examples in the Vendors Folders of chips and their applications for different types of projects. The use of modern 
LTE Advanced Pro and 5G compatible M.2 chips is highly adviced as they will perform far more better than LTE Rel-8 from 2010 and can be added to 
a lot of microcomputers like Raspberry Pi, Jetson NANO or Arduino. This M.2 form factor for communication chips is specially recommended for early stage development as it allows the developers to change different chips easily with a screw driver to teste differente vendors and different models.


This project has the objective of using RaspberryPi4b8GB running Raspbian OS as an internet WiFi 802.11ac Router and home Desktop. It should
work for fixed services using ethernet or/and LTE Advanced Pro M.2 form factor chips for long term evolution, including future proof 5G sub6GHz Rel.15 chips. But it is just one application for the system and one hardware configuration, as there are many raspberry pi models with differnt capabilities
that can be used according to the requirements of each user/deveolper.

The Raspbian OS can also be replaced by Ubuntu Desktop, Ubuntu Core, Ubuntu Server, OpenWRT or other linux distribution. Every distribution has benefits
and drawbacks and every application has different requirements in terms of features, performance and security.

This Router can be used as a Rural Router with LTE Advanced Pro M.2 chips and with Eth0 for connecting a local Switch or PC/Laptop, as well as WiFi AP.

In terms of WiFi, the Raspi4b has 2 interfaces dual-band and they are 802.11ac, which is not WiFi6, but an extra WiFi6 M.2 form factor can be added via USB or using a Raspberry HAT, to improve even more the speed.

It is important to note that though 5G promises high data rates, it is only in the lab that these high data rates are achieved and only using one device 
in the cells attached to the network for Carrier Aggregation. It usually is aroung 15% of what it is promised. In fact if 1Gbps is promised, in rural 
areas if 2 external directional Yagi antennas placed in high poles and with line of sight are not used, high speed data rates will not be achieved as only
the 700MHz to 850MHz bands will be able to reach distances kilometers away from the Cell Tower.


RaspberryPi4B HW

The two wiFi interfaces can be configured as Hot Spots in theory. The "iw" command controls most of WiFi interface configurations.

Two monitors can be connected to the Raspbi4b8GB. A camera that can use GPU and Tensor Flow for AI image inference, for recognition of images, video, etc.

Audio jack port is included.

GPIO should be used with a MODEM HAT, that uses also a USB3.0 link, to mount an M.2 female interface with external antennas ports and the micro SIM Card.

GPS is included in some of the 4.5G/5G M.2 form factor chips as specified by the tech specs.

The specifications of the raspberry4b8GB can be see in the Hardwar folder of the repository.


5G Chips scarcity:

As 5G chips are now 650 dollars compared to 250 dollars 6 months ago. In this model of house/office Router with WiFi or WiFi6, it should be cheaper than
buy 5G mobile devices, as only one 5G Sub6Ghz chip has to be aquired. It is the model of the CPE (Customer Premises Equipment) that is more economic for the customers, ad they can buy WiFi6 devices and connect the CPE for high speed data rates both in uplink and downlink.

4.5G chips M.2 are a Long Term Evolution option and have different categories with different max speeds in downlink and uplink and also have different cost gamma, so the customer offerings can be wide and it can also be easily upgraded for better chips, returning the old ones for other customers that require an entry level. They can also be upgrade to M.2 form factor 5G chips eventually when the National Operators networks migrate to Rel.15 non stand alone.

The hardware of the raspberry4b will be used as a router and has to be modified according with a list of options for different setups and there should be a web interface to be able to reconfigure different options easily by the end user with no support.
The options are mentioned in other files in depth so please refer to the documentation. 

Open Tier Systems will be used to create VPN network for private customers or companies and it also allows connectivity to the remote RaspberryPis for confiuration, update, support and also allow MQTT Server to be used to have the Raspberries subscribed to Topics in order to report information or other tasks like check connectivity, etc.

Though initially the Raspbian OS and Ubuntu Desktop 22.04 will be used to test the chips with GUI, the ideal solution should use OpenWRT distribution 
dedicated for the RaspberryPi Hardware as it is a Router Specific Distribution with no GUI and a Web Interface that will be easy to configure by 
regular users that are used to any standard router or modem connecting to the 192.168.1.1 via web Browser.


Mobile device Categories:
#########################

Cat 4 150 down / 50 Up
Cat 6 300 down / 150 up
Cat 12 600 down / 150 Up
Cat 16 1000 down / 150 Up

