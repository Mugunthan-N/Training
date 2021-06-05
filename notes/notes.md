# CMake
#### What I learnt
* **CMake** is used to create **MakeFile**
* Makefile is file which contains bash commands to build/compile project
* **CMakelists.txt** file should be in root 
* CMakelists.txt contains information about project and its files
* When we build cmake in a **build** dir it creates bunch of files including MakeFile
* CMake automatically fills Makefile with required lines for make command

> **Process**
1. Create a CMakelists.txt and fill in
```cmake
		cmake_minimum_required(VERSION 3.16.3)
		project(name_of_project)
		add_executable($(PROJECT_NAME) main.c) 
```
1. Create a build dir
```bash
		$ mkdir build 
```
1. In build dir 
```bash
		$ cmake -S ../ -B . 
```
1. MakeFile would be created 
1. make in the dir to get the output
```bash
		$ make
```