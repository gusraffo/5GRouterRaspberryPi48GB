OpenWrt

The OpenWrt Project is a Linux operating system targeting embedded devices. Instead of trying to create a single, static firmware, OpenWrt 
provides a fully writable filesystem with package management. This frees you from the application selection and configuration provided by 
the vendor and allows you to customize the device through the use of packages to suit any application. For developers, OpenWrt is the framework 
to build an application without having to build a complete firmware around it; for users this means the ability for full customization, 
to use the device in ways never envisioned.

PROBLEMS OF PERFORMANCE WITH RASPBIAN OS WITH GUI

An issue of performance in the download/upload was detected in the RaspberryPi when the packets are forwarded between wwan0 and eth0. The CPU
of the raspberrypi with all the software that is running reduces the speed of the download when it has to handle packets between interfaces.

That is a problem for the performance we want to achieve and it will be a good idea to move slowly to openwrt and Luci instead.

The important objective of this project is to be able to test different module of different vendors and categories so the best ones can be used
for deployments and testing. The max speed in the Raspbian OS can be used as a reference. 

But for achieving an interface towards the eth0 it will need more processing capacity that OpenWRT should provide easier than Raspbian.
