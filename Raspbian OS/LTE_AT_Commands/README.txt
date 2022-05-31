In this section we add related information for the dongle modems LTE and LTE-A.


The ATCommandTester GUIs for Linux helps to run "at" commands as scripts in a user friendly way.

Follow the link above to find the github instruction. You only need the instructions we list and the file ATCommandTester.jar
that we attach in this directory.


Instructions for Linux:
#######################

Install the Java Runtime Environment (JRE) and the java package for RXTXComm.jar

I.e: in Ubuntu GNU/Linux:

sudo apt install openjdk-11-jre for the JRE, if you don't have the command java

and

sudo apt install librxtx-java for the RXTXcomm library.

After that you can run the program with the right permissions to write to your serial port.

If you are in doubt... just use sudo ;)

sudo java -jar ATCommandTester.jar

