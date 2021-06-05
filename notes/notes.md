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
![Terminal Screenshot]()