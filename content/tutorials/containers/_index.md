---
date: "2023-05-12"
title: "Introduction to Building and Deploying Containers"
summary: "How to containerize our apps with Docker and maintain them with GitHub."
authors: [cag]
categories: ["Containers","Docker", "R", "Shiny", "App Development"]
weight: 250
---

You've developed an app and written the paper. Now it's time to deploy the app so the world (and the reviewers) can see how awesome it is. This is Part 1 of a two-part workshop that will cover how to deploy web apps for publication. In Part 1 we will go over how to containerize our apps with Docker and maintain them with GitHub.

![](img/docker.png)
![](img/github.jpeg)

## Overview

![](img/shipping-container.jpeg)

Shipping containers are used to transport cargo around the world. In computing, containers allow you to transport and share entire filesystems, processes, scripts, and more!

## Why Use Containers

Have you ever tried using new code or software from an exciting paper you just read, only to end up spending hours figuring out which versions of the dependencies work on your own machine? Containers eliminate that issue altogether!

A container is a single unit of software that contains all the packages and code you need to run an application. Sometimes that application is as small as a single function (like printing 'Hello World!'), and sometimes that application is an entire web app. A container will always run the same, regardless of the host system it runs on--making it the perfect solution for sharing reproducible code.

There are several container technologies out there, but the big ones are Docker and Singularity. Docker is what you will encounter most often in the wild. Singularity (now called Apptainer) is used on HPC systems where most users don't have root access.

![](img/docker.png)
![](img/apptainer.png)

## Containers vs VMs

You may be familiar with the virtual machines (VMs), which accomplish the same goal as containers: to create a reproducible and shareable compute environment. The big difference between VMs and containers is that VMs provide their own guest OS, whereas containers don't require an OS and run on the Docker Engine and share the host's OS kernel.

The size of Docker images is usually on the order of tens of MBs, while VMs can be several tens of GBs large.

![](img/container-vs-vm.pbm)

## Container Services

Container-based architecture, also known as "microservices," is an approach to designing and running applications as a distributed set of components or layers. Such applications are typically run within containers, made popular in the last few years by Docker.

Containers are portable, efficient, reusable, and contain code and any dependencies in a single package. Containerized services typically run a single process, rather than an entire stack within the same environment. This allows developers to replace, scale, or troubleshoot portions of their entire application at a time.

![](img/microservice-cluster.jpeg)

Research Computing runs microservices in a clustered orchestration environment that automates the deployment and management of many containers easy and scalable. This cluster has >1000 cores and ~1TB of memory allocated to running containerized services. It also has over 300TB of cluster storage and can attach to project and value storage.
