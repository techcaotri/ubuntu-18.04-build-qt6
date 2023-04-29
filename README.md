# ubuntu-18.04-build-qt6
Scripts to build Qt6 from source automatically on Ubuntu 18.04

### Steps to build Qt6 6.4.3 source code using Docker container:
#### Prepare the Docker container:
```shell
./prepare_docker.sh
```
After this, there's instance of container running:
```shell
➜ docker ps
CONTAINER ID   IMAGE               COMMAND               CREATED        STATUS        PORTS                                   NAMES
b78b1ed6ffdb   ubuntu:18.04        "/usr/sbin/sshd -D"   24 hours ago   Up 24 hours   0.0.0.0:2222->22/tcp, :::2222->22/tcp   ubuntu_18_04
```
#### Enter the Docker container:
You could either enter the container as *user* user (password: *user*):
```shell
➜ ./enter_docker_user.sh 
+ docker exec -u user -it ubuntu_18_04 bash
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

user@b78b1ed6ffdb:~$ 
```
Or (bonus and not recommended way) ssh to it as *root* (password: *root*):
