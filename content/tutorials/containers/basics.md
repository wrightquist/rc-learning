---
date: "2023-05-01"
title: "Container Basics"
weight: 100
---

To run and build containers, you will need Docker Desktop installed on your local machine. Instructions and installation files can be found here: https://docs.docker.com/engine/install/.

## Terminology

**Image**: The layers of libraries, code, and configuration that make up the environment that you need to run your application. 

**Container**: A running instance of an image. You can have many containers of a single image run simultaneously.

**DockerHub**: An online registry for Docker images (similar to GitHub)

## Commonly Used Docker Commands

- **docker pull**: Fetches an image from a container registry to your local machine

- **docker images**: List all locally available images (kind of like ls)

- **docker run**: Run a container based on a particular image

## A Quick Example

Cowsay is a Linux game that prints ASCII art of a cow and a speech bubble containing a string input by the user. The Whalesay image modifies that game by replacing the cow with a whale.

Let's try pulling the whalesay image from DockerHub and running a container on our machine.

## 1. Pull the Image

```
> docker pull docker/whalesay

Using default tag: latest
latest: Pulling from docker/whalesay
Image docker.io/docker/whalesay:latest uses outdated schema1 manifest format. Please upgrade to a schema2 image for better future compatibility. More information at https://docs.docker.com/registry/spec/deprecated-schema-v1/
e190868d63f8: Pull complete 
909cd34c6fd7: Pull complete 
0b9bfabab7c1: Pull complete 
a3ed95caeb02: Pull complete 
00bf65475aba: Pull complete 
c57b6bcc83e3: Pull complete 
8978f6879e2f: Pull complete 
8eed3712d2cf: Pull complete 
Digest: sha256:178598e51a26abbc958b8a2e48825c90bc22e641de3d31e18aaf55f3258ba93b
Status: Downloaded newer image for docker/whalesay:latest
docker.io/docker/whalesay:latest
```

You'll notice that there are several lines with a hash/SHA ID followed by "Pull complete". These correspond to the different layers of the image, or the different components that will make up the compute environment when we run the container. We will talk more about layers when we cover building our own images.

## 2. List all pulled images

By listing all images, we are confirming that we successfully pulled the whalesay image.
```
> docker images

REPOSITORY        TAG       IMAGE ID       CREATED       SIZE
docker/whalesay   latest    6b362a9f73eb   8 years ago   247MB
```

## 3. Run the Container
```
> docker run docker/whalesay
```

Just running whalesay looks like it didn't do anything since we didn't provide a command. What happened behind-the-scenes is that Docker spun up an instance of the whalesay image, ran an empty command, and then exited once that was complete.

Let's try running a container again, this time adding the cowsay command at the end.

```
> docker run docker/whalesay cowsay "hi there"

 __________ 
< hi there >
 ---------- 
    \
     \
      \     
                    ##        .            
              ## ## ##       ==            
           ## ## ## ##      ===            
       /""""""""""""""""___/ ===        
  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
       \______ o          __/            
        \    \        __/             
          \____\______/ 
          
```

## Running WebApps in a Container

Just like with the whalesay/cowsay program, we can run web apps in a container. Let's try with this static website example.

## 1. Pull the nginx image

```
> docker pull nginx
```

## 2. Run the nginx container

We can use -p to specify a custom port to connect to our container. In this case we are using port 8080.

```
> docker run -p 8080:80 nginx
```

We can see that the container is running when we go to [http://localhost:8080](http://localhost:8080) in the browser.

When you're done, you can use Ctrl + C to stop the container.

## Building a Docker Image

In order to serve our own webapp in a container, we will need to build an image for it. There are many "blank" images like the nginx container we pulled earlier that we can use as a starting point. This is called a base image.

To create our image, we will first write a Dockerfile. A Dockerfile is a text file containing the commands we will use to build the environment we need for our app. These are very similar to commands we would use to install libraries and packages that we need locally.

Once complete, we will use the `docker build` and `docker push` commands to build our image and upload it to DockerHub.
