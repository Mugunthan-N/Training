# Remote upgrade of hub

## upgrade.sh
* Rus on host machine, and extracts required files from given img.
* Transfers extrcted files and upgrade_from_hub.sh script to the hub.
* Invokes the script inside the hub.

## upgrade_from_hub.sh
* Runs on hub, it can transfer the required files extracted from given img in host(if required).
* Copies all the new files to destination.
* Removes all the old files.
* Installs the new files to the hub and reboots the hub.

## upgrade_from_host.sh
* Runs all the above processes in host.
* Hub related lines are run through ssh.