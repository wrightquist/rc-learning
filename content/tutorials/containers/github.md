---
date: "2023-05-01"
title: "Version Control"
weight: 300
---

Tools like Git and GitHub are great keeping track of changes in our app. They also allow for easy collaboration and sharing of code.

Another great functionality of GitHub is GitHub Actions (GHA). GHA detect updates pushed to your repository and can kick off workflows automatically. For example, if we make updates to our Shiny code and push them to our repository, GHA can automatically rebuild our Docker image and push the new image to GHCR. This means we don't have to manually go through the whole rebuild+push process ourselves!

To take advantage of this, we will need to:

1. Create a new GitHub repository for our Shiny App

2. Add the Dockerfile to the GitHub repo.

3. Set up a workflow for rebuilding the container whenever there is a new commit.

## Creating a New GitHub Repository

There are several ways to create a new GitHub repository. Here is one way I like to do it:

1. Create a new repository with the "New repository" button.

2. Fill out the "Repository name".

3. Select "Add a README file".

4. Click "Create repository".

5. In your local terminal, clone the new repository with the following command:

    ```
    git clone https://github.com/<username>/<repo-name>
    ```

6. Copy or move the files you want to the <repo-name> folder.

7. Run the following code to add the new files to your GitHub repository:

    ```
    cd /path/to/<repo-name>
    
    git add *
    
    git commit -m "adding files"
    
    git push
    ```
   
## Common Git Commands

As we make changes to our Shiny app or Dockerfile, we will need to push the updates to our GitHub repository. Typically this is done with a `git add` + `git commit` + `git push`.

1. `git add <file(s)>`: **git add** is similar to packing a box. We are adding the files that we want to send up to our repository.

2. `git commit -m <message>`: With **git commit** we are creating a "packing slip" for our box of updated files. We can add a message that tells us and others why we're pushing these updates and what they do. Your message can be vague or informative--the choice is up to you.

3. `git push`: This command is doing the actual "shipping" of our files.


If we are working with collaborators, another useful command is `git pull`. This allows us to update our local repository with any updates our friends have pushed.

## GitHub Actions

GitHub Actions allow us to incorporate **Continuous Integration/Continuous Deployment** in our repository. We can automatically rebuild and redeploy our app whenever any changes are committed to the repo.

To add a workflow to your repo:

1. Create a `.github/workflows` directory.

2. Add the following .YAML file to the new directory, replacing the **IMAGE_NAME** and **SVC_NAME** with your image's name and the name that you want for your app on the Kubernetes cluster, respectively.

```
name: Container Build CICD

on:
  push:
    branches:
    - 'main'

env:
  # The preferred container registry
  REGISTRY: ghcr.io
  # The base org/image-name for the container
  IMAGE_NAME: uvarc/chickweight
  # A service name if mapping this to a k8s deployment
  SVC_NAME: chickWeight

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set ENV
        run: echo "IMAGE_TAG=${GITHUB_REF#refs/*/}" >> $GITHUB_ENV
      -
        name: Set up QEMU
        uses: docker/setup-qemu-action@v1
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1
      -
        # GHCR require a GitHub username and a Personal Access Token with the right permissions.
        # These can be stored as repository secrets in the repo settings.
        name: Login to GHCR
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ secrets.GHCR_USERNAME }}
          password: ${{ secrets.GHCR_PAT }}
      -
        name: Build and push
        id: docker_build
        uses: docker/build-push-action@v2
        with:
          push: ${{ github.event_name != 'pull_request' }}
          tags: ghcr.io/${{ env.IMAGE_NAME }}:${{ env.IMAGE_TAG }}
          labels: ${{ steps.meta.outputs.labels }}
      -
        name: Image digest
        run: echo ${{ steps.docker_build.outputs.digest }}

      # Now update another repo so that ArgoCD can deploy the new version.
      # Note that the dispatch call simply curls a POST payload to another repository with JSON that you define.
      - name: Remote Dispatch
        run: |
          curl -X POST https://api.github.com/repos/uvarc/uvarc-services/dispatches \
            -H 'Accept: application/vnd.github.everest-preview+json' \
            -H "Authorization: token ${{ secrets.GHCR_PAT }}" \
            --data '{"event_type": "${{ env.IMAGE_NAME }} update to ${{ env.IMAGE_TAG }}", "client_payload": { "service": "${{ env.SVC_NAME }}", "version": "${{ env.IMAGE_TAG }}" }}'

```
