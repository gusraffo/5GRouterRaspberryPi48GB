!#/bin/bash

#After using Raspi Imager to burn the Raspbian OS Bullseye 64-bit into a micro SD card 16GB, this script includes all the initial packages
#and scripts that have to be run in order to have the OS configured to work with the desired system.


#In the case of a cloned micro SD card with the final configuration ready and the operating system working smooth, this script can be ommited.

#This script helps in the case that the micro SD card has to be burned again and it has only the initial configuration. It happens that some times
#the configuration of files or other configurations in the system is run and generates issues that are not solvable, or even if they are solved,
#will in some way alter the initial configuration of files in a way that can't be predicted.


#It will initially be used as a .txt file so you can copy one by one the lines and make sure that the result of each command is succesfull

sudo -i #Enter the root password for the first time. Use password pi for simplicity in this stage


#Get and install the new packages. This routine should be scheduled in crontab of root user to run once a day in order to keep the system security
#patches up to date

sudo apt  update
sudo apt upgrade

#Install Gpared

#Install modem manager GUI as modem manager is already installed

#
