Configure eth0 with dhcp and fixed IP 192.168.2.0 and inet interface wwan0
##########################################################################

Given the fact that the wwan0, via modem 4.5G has been stablished and is being used as an internet interface, we want now
to configure the possibility of using a laptop/router via eth0, Gigabit Ethernet interface, with dhcp server and DNS 
configuration.

There will be a fixed IP address for the eth0 and only one IP address for the Laptop. This is for a security reason. Though
at the moment there is no security concern, we have to slowly introduce mor controls in order to reduce the possibility of
a hacking into the system. 


We will use an extract from a site where we found a use case for the wlan0 as AP and edit it in order to change the interfaces





1) Configure NAT

Make sure you are logged into your Pi. Edit the /etc/sysctl.conf file:

sudo vim /etc/sysctl.conf

Look for the line #net.ipv4.ip_forward=1, and uncomment it by deleting the #.

net.ipv4.ip_forward=1
net.ipv6.ip_forward=1


Enable IPv4 packet forwarding

We need to configure Network Address Translation (NAT) between the Ethernet and wwan0 interfaces to allow devices on both 
networks to communicate with each other. In the terminal, enter the following:

sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE  
sudo iptables -A FORWARD -i eth0 -o wwan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i wwan0 -o eth0 -j ACCEPT

This will work for now, but on reboot, the Pi will revert back to its previous state. 
To fix this, we need these NAT rules to be applied each time it starts up. Save the current rules to a file with this command:

sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"

Linux provides us with a number of ways to run commands on boot. Usually, the easiest is to put those 
commands into the /etc/rc.local script. To have our NAT rules restored on boot, we edit the rc.local file:

sudo nano /etc/rc.local

Just above the exit 0 line (which ends the script), add the following:

iptables-restore < /etc/iptables.ipv4.nat 

Restore NAT rules during boot with rc.local

Save and exit by pressing ctrl + x and y when prompted.
Test It Out

Restart your Pi:

sudo reboot

continue...
