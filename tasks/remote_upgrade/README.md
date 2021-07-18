# Remote upgrade of hub

## upgrade.sh
* Rus on host machine, and extracts required files from given img.
* Transfers extracted files and upgrade_from_hub.sh script to the hub.
* Checks if everythig is transfered properly
* Invokes the script inside the hub.

## upgrade_from_hub.sh
* Runs on hub, it can transfer the required files extracted from given img from host(if required).
* Copies all the new files to destination.
* Removes all the old files.
* Installs the new files to the hub and reboots the hub.

## upgrade_from_host.sh
* Runs all the above processes from host.
* Hub related lines are run through ssh.