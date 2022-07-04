# Docker

## What is Docker?
- Docker is a software framework for building, running, and managing containers on servers and the cloud. 

![](/images/what_is_docker.png)

## Understanding containers
Container technology can be thought of as three different categories:

Builder: a tool or series of tools used to build a container, such as distrobuilder for LXC, or a Dockerfile for Docker.

Engine: an application used to run a container. For Docker, this refers to the docker command and the dockerd daemon. For others, this can refer to the containerd daemon and relevant commands (such as podman.)

Orchestration: technology used to manage many containers, including Kubernetes and OKD.

Containers often deliver both an application and configuration, meaning that a sysadmin doesn't have to spend as much time getting an application in a container to run compared to when an application is installed from a traditional source. Dockerhub and Quay.io are repositories offering images for use by container engines.

The greatest appeal of containers, though, is their ability to "die" gracefully and respawn when load balancing demands it. Whether a container's demise is caused by a crash or because it's simply no longer needed because server traffic is low, containers are "cheap" to start, and they're designed to seamlessly appear and disappear. Because containers are meant to be ephemeral and to spawn new instances as often as required, it's expected that monitoring and managing them is not done by a human in real time, but is instead automated.

## Container utilities
By design, containers can multiply quickly, whether you're running lots of different services or you're running many instances of a few services. Should you decide to run services in containers, you probably need software designed to host and manage those containers. This is broadly known as container orchestration. While Docker and other container engines like Podman and CRI-O are good utilities for container definitions and images, it's their job to create and run containers, not help you organize and manage them. Projects like Kubernetes and OKD provide container orchestration for Docker, Podman, CRI-O, and more.

## Why use Docker
One of the great things about open source is that you have choice in what technology you use to accomplish a task. The Docker engine can be useful for lone developers who need a lightweight, clean environment for testing, but without a need for complex orchestration. If Docker is available on your system and everyone around you is familiar with the Docker toolchain, then Docker Community Edition (docker-ce) is a great way to get started with containers.

![](/images/why_docker.png)



## Benefits of Docker
- Uses less memory
- Faster Startup
- Better integration
- Provides multi cloud services


## VM vs Docker
![](/images/vm_vs_docker.png)
