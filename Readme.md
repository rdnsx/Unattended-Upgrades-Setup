###Unattended-Upgrades-Setup

This is a Bash script that sets up unattended upgrades on a Linux system. Here's a breakdown of what the script does:

It updates and cleans up the operating system using the apt package manager.
It installs the unattended-upgrades package, which allows for automatic upgrades of packages on the system.
It copies two configuration files (50unattended-upgrades and 20auto-upgrades) to the /etc/apt/apt.conf.d/ directory.
It restarts the unattended-upgrades service to apply the changes.
It prints a message indicating that the setup process is complete.
Note that the script redirects all output to /dev/null, so it won't display any output unless an error occurs. It's also assumed that the configuration files 50unattended-upgrades and 20auto-upgrades are located in the same directory as the script.
