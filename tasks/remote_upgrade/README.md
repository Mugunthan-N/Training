# Remote upgrade of hub

## upgrade.sh
* Rus on host machine, and extracts required files from given img.
* Copies extrcted files and upgrade_from_hub.sh script into the hub.
* Invokes the script inside the hub.

## upgrade_from_hub.sh
* Runs on hub, it can extract the required files from given img in host(if required).
* Copies all the new files to destination.
* Removes all the old files.
* Installs the new files to the hub and reboots the hub.

## upgrade_from_host.sh
* Runs all the above processes in host.
* Hub related lines are run through ssh.