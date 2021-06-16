# CMake

> **What I learnt**
* **CMake** is used to create **MakeFile**
* Makefile is file which contains bash commands to build/compile project
* **CMakeLists.txt** file should be in root 
* CMakeLists.txt contains information about project and its files
* When we build cmake in a **build** dir it creates bunch of files including MakeFile
* CMake automatically fills Makefile with required lines for make command

> **Process**
* Create a CMakeLists.txt and fill in
```cmake
cmake_minimum_required(VERSION 3.16.3)
project( Name_of_project )
add_executable(${PROJECT_NAME} main.c) 
```
* Create a build dir
```sh
mkdir build 
```
* In build dir 
```sh
cmake -S ../ -B . 
```
* MakeFile would be created 
* make in the dir to get the output
```sh
make
```
> **What I Did**
>
![Terminal](https://github.com/Mugunthan-N/Training/blob/master/notes/cmake/CMake_Screenshot.png)

# Z-Wave

> **What I learnt**
> Z-Wave
* It is a type of wireless communication technology
* It opperates in sub gigahertz freaquency range around 900MHz
* This avoids conjunction with other protocols

> **Ovweview**
* Uses **Network ID** and **Node ID**
* Uses RF
* Mesh Network
* AC powered nodes can act as **repeaters**, but battery powered nodes can't
* Must have **Primary Controller**
* Max devices that can be connected **232**

 > **Radio Spec**
 * Bandwidth: 9,600 bit/s or 40 kbit/s
 * Modulation: GFSK
 * Range: 75 feet assuming a non-intrusive environment (non interference), with an optimum range of 30 feet.
 * Frequency band: uses the 900 MHz ISM band: 908.42MHz (U.S.)
 * Power limit: 1mW transmission

### Z-Wave Components and Terminology
 > **Controllers**
 * They are used here for compiling routing table and to calculate routes to different nodes
 * **Primary Controller** - It contains network description and controls the outputs. It assigns the **Network & Node ID** to the nodes during enrollment process.
 * **Secondary Controller** - contains same **Network ID** as the primary and remains stationary to maintain the routing table
 * Only one primary controller can exist on a network at a time
 * Primary controller manages the allotment of node IDs and gathers information about which nodes can
 reach each other
 * Secondary controllers can obtain the network routing information gathered by the primary controller

 > Slave Nodes
 * They do not contain any routing tables, butmay contain a network map
 * **Slave Nodes** has the ability to receive frames and respond to them if necessary
 * **Routing Slave** have the ability to host a number of routes for talking to other slaves and controllers
 * **Frequently Listening Routing Slave (FLiRS)** is configured to listen to a wake up beam during every
 wake up interval

 > Home ID
 * To seperate from one to another Z-Wave network
 * It refers to the ID that is assigned by **Primary Controller** during inclusion process
 * 32 bit code 
 * Additional controllers will be assigned the same Home ID
 * Initially all nodes will have home ID set to 0

  > Node ID
  * Node is a ZWave module itself
  * It is a ID or address that each device is assigned
  * Primary controller assigns the ID to each node
  * There are a total of 232 nodes available on each network
  * *eg* 
  
  ```
  Home ID  0x00001111
  Node ID1 0x01 (Primary Controller)
  Node ID2 0x02 (Slave)
  Node ID3 0x03 (Slave)
  etc...
  ``` 
 > Routing
 * All controllers have a routing table that enables the controller to calculate the routes in the Z-Wave network.
 * It keeps track of these routes and knows which ‘path’ to take to communicate with the destination node. 

 ## Interrupts

 > **What I learnt**
 * As the name indigates they are the interrupts for background code that is running already
 * When an interrupt occurs (external or internal) which is not, in any case predictable, will pause the backround code from excecuting and passes the control to some other address
 * This address is nothing but an ISR(Interrupt Service Routine), a subroutine which contains instruction to excecute when repective interrupt occurs
 * ISR can be already defined or explicitly defined based on the application
 * When an Interrupt occurs the excecution of background code halts and all the CPU states and return address are saved
 * The excecution of ISR takes place and after its finished, all the saved states are preserved in the CPU and background code continues excecution
 * When there is an interrupt occurs when already an ISR is in excecution then, the interrupt with higher priority excecutes.
 * Other interrupts which are active will be in queue when an ISR is running
 * And after the completion of ISR the interrupts in the queue are excecuted based on their priority
 * There may be some background code excecution between those ISR excecution, and this wasted time is resolved in latest microcontrollers

 # Embedded Linux

 # Yocto Project

 > **What I learnt**
 * It is a framework that helps us to build a customised Embedded Linux for our target
 * It contains a Build system called as **Poky**
 ```
 Poky = BitBake + MetaData

 BitBake - *Basically it schedules the tasks for the build*

 MetaData 
   |___ .config   - *Contains all the config variables used for build*
   |___ bbclasses - *Contains the logic to execute the building process*
   |___ Recipe    - *Contains the sources for blocks that are to be included in build*   
 ```
 * Based on the configurations set in the config files the BitBake builds the image for the target

 > **Process**
 * Install Yocto Project
 ```sh
git clone git://git.yoctoproject.org/poky
 ```
 * Into the **Poky** dir
 ```sh
cd poky
 ```
 * Initialise the **build environment**
 ```sh
source oe-init-build-env
 ```
 * To build a **minimal image**
 ```sh
bitbake core-image-minimal
 ```
 