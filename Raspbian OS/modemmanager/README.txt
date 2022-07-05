Modemmanager has been installed with gui. It is nos meant to be used in the CLI directly, but it can be used with command mmcli

There is a man page and also help page. I will copy a text from a forum with examples, etc. It's a higher level than at commands



https://techship.com/faq/how-to-guide-control-and-set-up-a-data-connection-in-linux-using-modemmanager-as-connection-manager/



tart by installing ModemManager and its dependencies to your Linux system.
You can build it from source code release tarball found at freedesktop.org (install instructions included in the archive)
If you have a package manager in your Linux distribution, it can usually be installed through them also.
E.g. on Ubuntu using apt to install it and related dependencies:
apt install modemmanager libmbim-utils libqmi-utils

Keep in mind that Linux distributions sometimes rely on fairly old releases in their repositories and the development of ModemManager, libqmi and libmbim are on-going continuously. So is also the development of the cellular devices when the cellular technologies evolve. It is therefore recommended that you have a fairly recent version of ModemManager, libqmi and libmbim running in your system as well as when it comes to kernel version since the driver modules sometimes acquire patch fixes to be compatible with new chipset features etc.
Check Freedesktop.org pages for details on the latest ModemManager, NetworkManager, Libqmi and Libmbim releases.

Once you've installed ModemManager and rebooted your system, the service daemon should be running already in background.
Mmcli is the related command line interface tool which can be used to interact with ModemManager daemon through command line commands.

Check the version by command:
mmcli -V
<< mmcli 1.13.0
<< Copyright (2011 - 2020) Aleksander Morgado
<< License GPLv2+: GNU GPL version 2 or later
<< This is free software: you are free to change and redistribute it.
<< There is NO WARRANTY, to the extent permitted by law.

Print general mmcli help message:
mmcli --help

ModemManager normally listen, probes and detects cellular devices automatically when operating correctly but a forced scan can be triggered with command:
mmcli --scan-modems
<< successfully requested to scan devices

To list detected cellular devices use command:
mmcli --list-modems
<< /org/freedesktop/ModemManager1/Modem/0 [Sierra Wireless, Incorporated] MC7455

Here ModemManager have detected a Sierra Wireless cellular device and it has here been given the the identifier number 0 by ModemManager.

To acquire more device information and status use the --modem command and identifier value.
mmcli --modem=0
<< -----------------------------
<< General | dbus path: /org/freedesktop/ModemManager1/Modem/0
<< | device id: 3a2f5fad8e91dbf417694f23165017c1f8a6e061
<< -----------------------------
<< Hardware | manufacturer: Sierra Wireless, Incorporated
<< | model: MC7455
<< | firmware revision: SWI9X30C_02.32.11.00 r8042 CARMD-EV-FRMWR2 2019/05/15 21:52:20
<< | carrier config: default
<< | h/w revision: 1.0
<< | supported: gsm-umts, lte
<< | current: gsm-umts, lte
<< | equipment id: 359072066171840
<< -----------------------------
<< System | device: /sys/devices/pci0000:00/0000:00:14.0/usb3/3-2
<< | drivers: qcserial, qmi_wwan
<< | plugin: sierra
<< | primary port: cdc-wdm0
<< | ports: cdc-wdm0 (qmi), wwan1 (net), ttyUSB2 (at), wwan0 (net),
<< | cdc-wdm1 (qmi), ttyUSB1 (gps), ttyUSB0 (qcdm)
<< -----------------------------
<< Status | lock: sim-pin
<< | unlock retries: sim-pin (3), sim-puk (10), sim-pin2 (0), sim-puk2 (10)
<< | state: locked
<< | power state: on
<< | signal quality: 0% (cached)
<< -----------------------------
<< Modes | supported: allowed: 3g; preferred: none
<< | allowed: 4g; preferred: none
<< | allowed: 3g, 4g; preferred: 4g
<< | allowed: 3g, 4g; preferred: 3g
<< | current: allowed: 3g, 4g; preferred: 4g
<< -----------------------------
<< Bands | supported: utran-1, utran-3, utran-4, utran-5, utran-8, utran-2,
<< | eutran-1, eutran-2, eutran-3, eutran-4, eutran-5, eutran-7, eutran-8,
<< | eutran-12, eutran-13, eutran-20, eutran-25, eutran-26, eutran-29,
<< | eutran-30, eutran-41
<< | current: utran-1, utran-3, utran-4, utran-5, utran-8, utran-2,
<< | eutran-1, eutran-2, eutran-3, eutran-4, eutran-5, eutran-7, eutran-8,
<< | eutran-12, eutran-13, eutran-20, eutran-25, eutran-26, eutran-29,
<< | eutran-30, eutran-41
<< -----------------------------
<< IP | supported: ipv4, ipv6, ipv4v6
<< -----------------------------
<< SIM | dbus path: /org/freedesktop/ModemManager1/SIM/0

A detailed summary of device status, configs and system drivers, paths and IDs are returned.

Currently the device status indicates that inserted SIM card is PIN locked, so a unlock by --pin command is necessary:
mmcli --modem=0 --sim=0 --pin=****
<< successfully sent PIN code to the SIM

Now we can change device state to enabled using command:
mmcli --modem=0 --enable
<< successfully enabled the modem

if we're check device status again we can see that device:
mmcli --modem=0
…
<< --------------------------------
<< Status | lock: sim-puk2
<< | unlock retries: sim-pin (3), sim-puk (10), sim-pin2 (0), sim-puk2 (10)
<< | state: registered
<< | power state: on
<< | access tech: lte
<< | signal quality: 96% (recent)
…
<< 3GPP | imei: 359072066171840
<< | operator id: 24002
<< | operator name: 3
<< | registration: home
<< --------------------------------
<< 3GPP EPS | ue mode of operation: csps-2
<< --------------------------------
<< SIM | dbus path: /org/freedesktop/ModemManager1/SIM/0


The status output shows that devices is registered in network using LTE technology with a good signal strength.

It is now time to activate the data connection with --simple-connect command.
ModemManager will tie the data bearer for our given subscription APN to the qmi_wwan network interface, typically named wwan0 (unless renamed by Linux distribution or user)
Fill in the details as below but for your modem number, subscription APN and the IP type it can work with (ipv4 / ipv6 ipv4v6)
mmcli -m 0 --simple-connect='apn=data.tre.se,ip-type=ipv4v6'
<< successfully connected the modem

if we check modem status again we can see that a bearer have been established.
mmcli --modem=0
…
<< --------------------------------
<< Bearer | dbus path: /org/freedesktop/ModemManager1/Bearer/0
…

The bearer have got identifier number 0 so we can request more details for it to acquire the IP details:

mmcli --modem=0 --bearer=0
<< ------------------------------------
<< General | dbus path: /org/freedesktop/ModemManager1/Bearer/0
<< | type: default
<< ------------------------------------
<< Status | connected: yes
<< | suspended: no
<< | interface: wwan1
<< | ip timeout: 20
<< ------------------------------------
<< Properties | apn: data.tre.se
<< | roaming: allowed
<< | ip type: ipv4v6
<< ------------------------------------
<< IPv4 configuration | method: static
<< | address: 2.68.206.100
<< | prefix: 29
<< | gateway: 2.68.206.101
<< | dns: 80.251.201.177, 80.251.201.178
<< | mtu: 1500
<< ------------------------------------
<< IPv6 configuration | method: static
<< | address: 2a02:aa1:1010:b6bb:6d12:d0dc:978e:3982
<< | prefix: 64
<< | gateway: 2a02:aa1:1010:b6bb:21ea:c721:62c3:9760
<< | dns: 2a02:aa0::55, 2a02:aa0::56
<< | mtu: 1500
<< ------------------------------------
<< Statistics | duration: 450
<< | bytes rx: 6693
<< | attempts: 1
<< | total-duration: 450
<< | total-bytes rx: 6693

From here we can see the IP details we've been assigned by the cellular network.
ModemManager does not assign IPv4 address details to the cellular modules network interface in Linux by itself.
When ModemManager is used in conjunction with NetworkManager and the cellular connection is managed by it, then the IPv4 address details will be collected by NetworkManager through ModemManager and automatically assigned to network interface when connection is established.
If the system does not implement NetworkManager, then the IP and routing configuration needs to be handled by user software/scripting.

Example:
Enable network interface in Linux:
ip link set wwan0 up

Set the IPv4 address acquired from bearer information above, the CIDR subnet mask can always be set to 32:
ip addr add 2.68.206.100/32 dev wwan0

Disable ARP:
ip link set dev wwan0 arp off

Set MTU value acquired from network:
ip link set dev wwan0 mtu 1500

Add a default or other type of route to the cellular network device (e.g. with a metric to set which route to prefer)
ip route add default dev wwan0 metric 200

Add the DNS servers reported by cellular network or use other public/desired ones.
DNS server addresses are handled in different ways depending on the Linux distribution and network manager used. Therefore please refer to related dist documentation for best practice to add / maintain DNS server addresses in your specific system.
sh -c "echo 'nameserver 80.251.201.177' >> /etc/resolv.conf"
sh -c "echo 'nameserver 80.251.201.178' >> /etc/resolv.conf"

We should now have a network interface passing data successfully, we can try it out by doing ping requests:
IPv4 data:
ping -4 -c 4 -I wwan0 8.8.8.8
PING 8.8.8.8 (8.8.8.8) from 2.68.206.100 wwan0: 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=57 time=50.8 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=57 time=48.8 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=57 time=24.0 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=57 time=44.8 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3005ms
rtt min/avg/max/mdev = 23.979/42.115/50.840/10.694 ms

IPv6 data:
ping -6 -c 4 -I wwan0 2600::
PING 2600::(2600::) from 2a02:aa1:1010:b6bb:8962:7405:b81c:7627 wwan0: 56 data bytes
64 bytes from 2600::: icmp_seq=1 ttl=47 time=179 ms
64 bytes from 2600::: icmp_seq=2 ttl=47 time=176 ms
64 bytes from 2600::: icmp_seq=3 ttl=47 time=175 ms
64 bytes from 2600::: icmp_seq=4 ttl=47 time=177 ms

--- 2600:: ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3004ms
rtt min/avg/max/mdev = 175.411/176.935/179.268/1.446 ms


Related products
Huawei ME909u-521 - EU/ASIA
Huawei ME909u-523D - US - AT&T
Huawei ME909u-521 Mini PCI Express - EU/ASIA
Huawei ME909u-523D Mini PCI Express - US - AT&T
Huawei MS2131i-8 USB-stick
Huawei ME909s-821 mPCIe
Huawei ME909s-821 LGA
Huawei ME909s-120 mPCIe EU
Huawei ME909s-120 LGA EU
SimCom SIM7100E LTE SMT EU
SimCom SIM7100E LTE mPCIe EU
SimCom SIM7100A LTE mPCIe US
SimCom SIM7100C LTE mPCIe China
SimCom SIM7100E LTE mPCIe SIM
SIMCom SIM7500A LTE SMT US
SIMCom SIM7500E LTE SMT EU
SIMCom SIM7500E LTE mPCIe EU
SIMCom SIM7500SA LTE mPCIe Audio
SIMCom SIM7000E CAT-M1/NB1 SMT
Telit HE910-G HSPA+, GPS, mPCIe
Telit HE910-G-SIM HSPA+, GPS, miniPCIe, SIM card holder
Telit HE910-D HSPA+, miniPCIe, Global
Telit HE910-D-SIM HSPA+, miniPCIe, SIM card holder
Telit LM940A11 LTE CAT-11, GPS, mPCIe
Telit LE910-EU V2 LTE CAT-4, mPCIe
Telit LE910-SV V2 LTE CAT-4, Verizon, mPCIe
Telit LE910-NA V2 LTE CAT-4, AT T, TM, mPCIe
Telit LE910-AU V2 LTE CAT-4, Telstra, mPCIe
Telit HE910-GL SIM UMTS, miniPCIe, SIM card holder
Telit HE910-G (Voice) HSPA+ LGA
Telit HE910-DG HSPA+ LGA
Telit HE910-EUD HSPA LGA
Telit LE910-NA1 LTE CAT-1 LGA
Telit LE910-EU1 LTE CAT-1 LGA
Telit LE910-SV1 LTE CAT-1 LGA
Telit LE910-EU V2 LTE CAT-4 LGA
Telit LE910-NA V2 LTE CAT-4 LGA
Telit LE910D1-E1 LTE CAT-1 LGA
Huawei MS2372h-153 LTE USB Dongle EU
SIMCom SIM7600E-H LTE SMT EU
SIMCom SIM7600E-H LTE CAT-4 mPCIe EU
SIMCom SIM7600E-H LTE CAT-4 mPCIe SIM
Huawei MS2372h-517 LTE USB Dongle US
SIMCom SIM7600A-H LTE CAT-4 mPCIe Audio
Huawei MS2372h-607 LTE USB Dongle Asia
Telit LE910-NA V2 LTE CAT-4, S.SKU, mPCIe
SIMCom SIM7600SA-H LTE CAT-4 mPCIe
Simcom SIM7600JC-H LTE CAT-4 mPCIe
SIMCom SIM7600A-H LTE CAT-4 mPCIe US
SIMCom SIM7600V-H LTE CAT-4 mPCIe Audio Verizon
SIMCom SIM7000G
Fibocom NL668-EAU mPCIe LTE CAT-4
SIMCom SIM7600SA-H LTE CAT-4 mPCIe with SIM holder
SIMCom SIM7600E LTE CAT-1 mPCIe
SIMCom SIM7600SA LTE CAT-1 mPCIe
SIMCom SIM7600E-H LTE CAT 4 -mPCIE with Audio
Telit LM960 LTE CAT-18, GPS, mPCIe
SIMCom SIM7000E CAT-M1/NB1 mPCIe
SIMCom SIM7000G CAT-M/NB-IoT/GSM miniPCIe
Fibocom NL678-E mPCIe LTE CAT-6
SIMCom SIM7600A-H LTE CAT-4 mPCIe-SIM
SIMCom SIM7600CE-T LTE CAT-4 mPCIe CN
Sierra Wireless MC-WP7607 LTE CAT-4 mPCIe
Telit LE910C4-NF LTE CAT-4 mPCIe
Telit LE910-NA V2 LTE CAT-4, S.SKU LGA
Telit LE910B1-NA S.SKU LTE Cat-1 LGA
Telit LE910C1-NS LTE CAT-1 Sprint mPCIe
Telit LE910-SVL LTE CAT-1
Telit HE910-GL HSPA+ LGA
SIMCom SIM7000A CAT-M SMT Verizon
SIMCom SIM7000A CAT-M SMT AT&T
SIMCom SIM7906E LTE CAT-6 M.2
SIMCom SIM7906E LTE CAT-6 mPCIe
SIMCom SIM7000A CAT-M mPCIe
Telit HE910-NAD HSPA+ LGA
Telit LE910-SVG LTE CAT-3 LGA
Telit HE910-NAR HSPA LGA
Telit HE910-D HSPA+ LGA
Telit LE910C1-NA LTE CAT-1 AT&T LGA
Telit LE910C1-NS LTE CAT-1 Sprint LGA
Telit LE910-NAG LTE CAT-3 AT&T LGA
Telit LE910-SVG LTE CAT-3 mPCIe
Telit LE910-NVG LTE CAT-3 LGA
SIMCom SIM7600G-H LTE CAT-4 mPCIe
Telit LE910-NA1 S.SKU LTE Cat-1 LGA
Telit LE910-JN1 LTE Cat-1 LGA
Telit LE910C1-AP
Telit LE910C1-EU LTE CAT-1 LGA
Telit LE910B1-NA
Telit LE910B1-SA
Telit LE910-AU V2
Telit LE910-SV V2
Telit LE910B4-NA
Telit LE910C4-NF LTE Cat-4 LGA
Telit LE910-SV1 LTE Cat-1 mPCIe
Telit LE910-EU1 LTE Cat-1 mPCIe
Telit LE910-JN1 LTE Cat-1 mPCIe
Telit LE910-NA1 LTE Cat-1 mPCIe
Telit LE910C1-AP LTE CAT-1 mPCIe
Telit LE910C1-EU LTE CAT-1 mPCIe
Telit LE910C4-EU LTE CAT-4 mPCIe
Telit LE910C4-EU LTE CAT-4 mPCIe SIM
Telit LE910C1-NF S.SKU LTE CAT-1 LGA
Telit LM940A11, HW Rev. 2, LTE CAT-11, GPS, mPCIe
Telit LE910C4-NF LTE CAT-4 mPCIe SIM
SIMCom SIM7912G LTE CAT-12 M.2
Telit LM960A18 LTE CAT-18 mPCIe
Telit LE910C1-EU LTE CAT-1 mPCIe SIM
Telit LE910C1-AP LTE CAT-1 mPCIe SIM
Telit LE910C1-NF LTE CAT-1 mPCIe
Telit LE910C4-AP LTE CAT-4 mPCIe SIM
Telit LE910C4-CN LTE CAT-4 mPCIe
Telit LE910C4-CN LTE CAT-4 mPCIe SIM
SIMCom SIM7600V-H LTE CAT-4 M.2 Verizon
Sierra Wireless EM7411 NAM
Sierra Wireless MC7411 NAM
Sierra Wireless EM7421 EMEA/APAC
Sierra Wireless MC7421 EMEA/APAC
Sierra Wireless EM7431 Japan
Sierra Wireless MC7431 Japan
Huawei MS2372h-158 LTE USB Dongle EU
Huawei MS2372h-518 LTE USB Dongle US
Huawei MS2372h-608 LTE USB Dongle Asia
Huawei ME909s-120p V2 mPCIe
Huawei ME909s-120 V2 LGA
Telit LE910C1-SA CAT-1 LGA
SIMCom SIM7600E LTE CAT-1 SMT
Telit LE910C1-NF S.SKU LTE CAT-1 mPCIe SIM
Sierra Wireless MC-WP7610 LTE CAT-4 mPCIe
SIMCom SIM7600G-H R2 LTE Cat-4 mPCIe
SIMCom SIM7600NA-H LTE Cat-4 mPCIe
Telit LE910C1-LA LTE CAT-1 mPCIe
Telit LE910C4-EU LTE CAT-4 LGA
Sierra Wireless MC7455 mPCIe
Sierra Wireless MC7430
Sierra Wireless EM7565 M.2
Sierra Wireless EM7430 M.2
Sierra Wireless EM7511 M.2
Telit LE910C1-EUX LTE CAT-1 mPCIe
SIMCom SIM7600G-H R2 LTE CAT-4 SMT
Sierra Wireless, EM7455 M.2
SIMCom SIM7600G R2 LTE CAT-1 SMT
SIMCom SIM7600SA LTE CAT-1 SMT
Alcatel IK41VE1 LTE USB Dongle EU
Alcatel IK41CQ LTE USB Dongle APAC
Alcatel IK41UD LTE USB Dongle LATAM
Alcatel IK41UC LTE USB Dongle NA
Telit LE910C4-LA LTE CAT-4 mPCIe
Telit LE910C4-AP LTE CAT-4 LGA
Telit LE910C4-LA LTE CAT-4 mPCIe w/ Simholder
Telit LE910C4-WWX LTE Cat-4 mPCIe
Telit LE910C4-WWX LTE Cat-4 LGA
Telit LE910C4-NFD LTE Cat-4 LGA
