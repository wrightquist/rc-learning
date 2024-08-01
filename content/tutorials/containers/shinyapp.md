---
date: "2023-05-01"
title: "Serving a ShinyApp"
weight: 200
---

In this section of the workshop, we will take a completed ShinyApp and create a Docker image for it by writing a Dockerfile. We will then run the container to make sure that the ShinyApp is working as expected. Once we know the container is working, we will create a GitHub repository for our Shiny code and Dockerfile.

To complete this section on your own, you will need:

1. Docker Desktop installed on your machine
    The installers and installation instructions can be found here: https://docs.docker.com/engine/install/

2. A GitHub account
    If you don't have one already you can make one here: https://github.com/

3. A copy of the Shiny code
    You can clone a copy of the code to your local machine using `git clone https://github.com/uvarc/chickweight`

## Writing the Dockerfile

Below is the Dockerfile that we will use to build the container for our Chick Weight app. Each line is a command for building our environment and corresponds to a different layer of our image. We will cover each section below.


## 1. Choose a base image
```
# Install R version 4.1.2
FROM r-base:4.1.2
```

In this section we are specifying that we are starting with the r-base Docker image. The r-base container uses Ubuntu and already has R installed, so we don't need to worry about installing that ourselves. There are many other base containers out there that you can use depending on what kind of app you're developing.

## 2. Install Ubuntu packages and libraries

The following packages and libraries will allow us to install Shiny server and various R packages that we need for our app. This list will cover most of your bases for most Shiny apps. If you find you need additional libraries, you can just add them to this list.

How do you know if you're missing a library? You'll get an error message, and we will cover how to debug in a later section.
```
# Install Ubuntu packages
RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    libcurl4-gnutls-dev \
    libcairo2-dev/unstable \
    libxt-dev \
    libssl-dev \
    libxml2-dev \
    libnlopt-dev \
    libudunits2-dev \
    libgeos-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libgdal-dev \
    git             
```

## 3. Install Shiny server

This just installs Shiny server in your image. If you're not developing a Shiny app, no need to include it. If you *are* developing a Shiny app, no need to change it!

```
# Install Shiny server
RUN wget --no-verbose https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/VERSION -O "version.txt" && \
    VERSION=$(cat version.txt) && \
    wget "https://s3.amazonaws.com/rstudio-shiny-server-os-build/ubuntu-12.04/x86_64/shiny-server-$VERSION-amd64.deb" -O ss-latest.deb && \
    gdebi -n ss-latest.deb && \
    rm -f version.txt ss-latest.deb
```

## 4. Install R Packages

Here we are installing all the packages that we need for our Shiny app. Again, if you're not developing a Shiny app, you can skip this part.

```
##### Install R packages that are required ######
## CRAN packages
RUN R -e "install.packages(c('shiny','shinydashboard','dplyr','ggplot2','fresh'))"
```

## 5. Copy configuration files to the Docker image

These are just some files that make our Shiny app run. These will be in the directory that your app is in. These will be the same for all Shiny apps.
```
# Copy configuration files into the Docker image
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY shiny-server.sh /usr/bin/shiny-server.sh
RUN rm -rf /srv/shiny-server/*
```

## 6. Copy your code to your app

Ideally your code will be maintained within a GitHub repository (we will cover how to do this in a later section). Here we are cloning the GitHub repo and copying the contents to the shiny-server folder.
```
# Get the app code
RUN git clone https://github.com/uvarc/chickweight.git
COPY chickweight/* /srv/shiny-server/
RUN rm -rf chickweight
```

## 7. Some R and Shiny Stuff

This is just some stuff for setting R paths, etc.
```
# Make the ShinyApp available at port 80
ENV R_HOME=/usr/lib/R
ENV PATH=/usr/lib/R:/usr/lib/R/bin:$PATH
EXPOSE 80
WORKDIR /srv/shiny-server
RUN chown shiny.shiny /usr/bin/shiny-server.sh && chmod 755 /usr/bin/shiny-server.sh
```

## 8. Run the Shiny app!

The CMD just tells the container what to run once it starts. This line starts up the Shiny server and app.
```
# Run the server setup script
CMD ["/usr/bin/shiny-server.sh"]
```

Once we're done writing the Dockerfile, we save it as "Dockerfile" (no file extension).

## Building the App Image

Now that we've written the Dockerfile, it's time to build our image! To do that, we will use the `docker build` command.

In the same directory that your Dockerfile is in, you can run the following:

```
docker build -t <dockerhub-username>/<image-name>:<tag> .
```

- `-t` lets us specify the tag name for this image.

- `dockerhub-username` is pretty self-explanatory.

- `image-name` is the name for our image. It will also be the name of the image repository in DockerHub.

- `tag` can be a version number or other identifying label to help you differentiate this image from previous iterations. If you leave this blank, the tag name will default to `latest`.


I will be calling this image `cagancayco/chickweight:latest`. Simply replace `cagancayco` with your own username.

## Running the Container

Before we do anything else with our new Docker image, we want to make sure it runs correctly locally.

To run the container, we will use the following command.

```
docker run -p 8080:80 <dockerhub-username>/<image-name>:<tag>
```

With `-p 8080:80`, we are mapping port 80 of the container to port 8080 of our local machine. When we want to preview our app, we will go to [localhost:8080](localhost:8080) in our web browser. You don't have to use 8080, you can use another number if you want.

{{<figure src="/tutorials/containers/img/chickweight.png">}}


## Debugging

What if there's something wrong with the image for our Shiny app? How will we know? If there's an error, we'll see this message:

![](img/error.png)

How do we go about debugging this? We'll need to take a peek into our app. We will use `docker run` like before, but this time we will run the container interactively.

```
docker run -it -p 8888:80 <dockerhub-username>/<image-name>:<tag> /bin/bash
```

- `-it` allows us to run the container interactively

- With `/bin/bash`, we are entering the container in a bash shell.

- We use port 8888 instead of 8080, because we need to restart Docker Desktop in order to use 8080 again.

<br>

When we try going to [localhost:8888](localhost:8888), the app isn't running yet. We had a command at the end of our Dockerfile to start up Shiny server and run our app, but we just replaced that with `/bin/bash`. So within our new container, let's run `/usr/bin/shiny-server.sh`.

Now we see that error message again when we reload the page in the browser. Hit **Ctrl + C** to stop running the app.

Navigate to `/var/log/shiny-server`. Here you will see log files--use the `cat` command to take a look at them. In this example, we are missing the `fresh` package from our Docker image. We need to add that to our Dockerfile and rebuild the image.

## Pushing our Image to a Container Registry

Once our container runs successfully, we can push it to a container registry so that others can pull the container. "Others" includes our Kubernetes cluster at UVA.

We have a few options for container registries. The two main options are DockerHub and GitHub Container Registry (ghcr.io).

For this workshop, we're going to use GHCR. The main benefit of using GHCR over DockerHub is that it is less restrictive with how many times your image can be pulled in an hour.

## Re-tagging our image

To use GHCR, we need to prepend our image name with `ghcr.io/<github-username>`. That means we will need to re-tag our image. We can do that with the `docker tag` command.

```
docker tag cagancayco/chickweight:latest ghcr.io/uvarc/chickweight
```

## Allowing Docker to push to GHCR

If this is your first time using GHCR, it is likely that you need to authorize your local Docker installation to push to GitHub.

1. Go to GitHub -> Settings -> Developer Settings -> Personal Access Tokens, or click [here](https://github.com/settings/tokens).

2. Generate new token with read/write permissions for packages.

3. Copy the token to the clipboard.

4. In your terminal, run

    ```
    docker login ghcr.io -u <github-username> -p <copied-token>
    ```

Now we can use `docker push` to push our container to GitHub!

```
docker push ghcr.io/uvarc/chickweight
```

## Set the package to public

By default, GHCR packages (or images) are set to private. We need them to be public in order for the Kubernetes cluster to see it. To change the visibility, do the following:

1. Go to Packages -> chickweight -> Package Settings

2. Click "change visibility" and follow the on-screen instructions.
