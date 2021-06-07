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
```bash
$ mkdir build 
```
* In build dir 
```bash
$ cmake -S ../ -B . 
```
* MakeFile would be created 
* make in the dir to get the output
```bash
$ make
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