[![Build Status](https://travis-ci.com/uvarc/rc-website.svg?branch=master)](https://travis-ci.com/uvarc/rc-website)

# UVA Research Learning & Workshop Website

| Staging URL                              | Production URL                       |
|------------------------------------------|--------------------------------------|
| https://staging.learning.rc.virginia.edu | https://www.learning.rc.virginia.edu |

- [Developing](#developing)
    * [Local Install](#local-install)
- [Creating New Content](#creating-new-content)
    * [Methods for creating content](#methods-for-creating-content)
    * [Suggestions for creating content](#suggestions-for-creating-content)
    * [Directory Structure](#directory-structure)
    * [Front matter](#front-matter)
    * [Images](#images)
    * [Links](#links)
    * [Shortcodes](#shortcodes)
    * [Delete content](#delete-content)
    * [Categories](#categories)
- [Building and Publishing](#building-and-publishing)
    * [Preview content locally](#preview-content-locally)
    * [Publish content](#publish-content)
    * [Automated Builds](#automated-builds)

## Developing

### Local Install

* [Install](https://gohugo.io/overview/installing/) the HUGO binary on your local computer. This has been tested with version 0.74.x-extended. **You need the extended version.** Binaries for different operating systems can be downloaded from the Hugo GitHub repo: https://github.com/gohugoio/hugo/releases/tag/v0.74.3.
* Clone this website repository: `git clone git@github.com:uvarc/rc-learning.git`.  The `master` branch is protected.  New content has to be pushed to the `staging` branch. Use this command to clone the staging branch only: `git clone --single-branch -b staging git@github.com:uvarc/rc-learning.git`.

- - -

## Creating New Content

The `TL;DR` version:

1. Make your changes to the `staging` branch and be sure to preview locally before you push back to GitHub.
2. All website pages are stored within `/content/`
3. You can use Markdown or HTML (or a mix of both) within pages.

### Methods for creating content

1. Copy an existing page and modify it.
2. Create a new page using the `hugo new` command declaring a path to the page you want to create:
  * `hugo new courses/my-new-course-name`
  * `hugo new tutorials/my-new-tutorial-name`
  
### Suggestions for creating content

  * The "content type" of a page is usually determined by what folder it is in. Different content types are displayed in slightly different ways, i.e. the sidebar or layout.
  * Reference: [markdown cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
  * Follow guidelines from https://gohugo.io/content/organization/.

### Directory Structure

Content of this website is contained in a series of markdown files within the `content/` subdirectory. The site hierarchy consists of 5 main subsections:

* `authors` - Mission statement and staff directory.
* `courses` - Short courses with multi-chapter content, e.g. Summer Education Series
* `tutorials` - Self-paced material, includes material formerly in /workshops
* `slides` - Slides (powerpoints, PDFs, image slideshows) associated with tutorials
* `videos` - Videos associated with tutorials/courses

Content for courses + tutorials is structured as followed:

```
tutorials or courses
├── _index.md - the first page of content
├── example_section.md - additional content pages.  file names should be the title of the page
├── ...
├── img - images for the tutorial/course
├── code - code/scripts for the tutorial/course
└── data - datasets for the tutorial/course
```

### Front matter

Metadata for each web page is contained in YAML format at the top of each markdown page.

For all tutorial/course markdowns you must include the `date`, `title` and `weight` for the page.  ex. 
```
---
date: "2020-11-17"
title: "MPI Project Set 2"
weight: 130
---
```

The date should be the date the page was last edited.  The `weight` determines the order in which the page will be displayed in the course outline.  Higher weights = later pages, lower weights = earlier pages

For the `_index.md` pages for tutorials/courses, you need the `date`, `title` and `weight`, as well as `summary`, `authors`, and `categories`.  ex.
```
---
date: "2022-10-27"
title: "Scientific Image Processing with Python OpenCV"
summary: "An introduction to scientific image processing with the Python OpenCV package. Topics include splitting and merging of color channels, morphological filters, image thresholding and segmentation."
author: [khs]
categories: ["Image Processing","Python"]
weight: 100
---
```

here, the `weight` determines how high in the list of courses/tutorials on the /courses and /tutorials pages the page should be listed

see [categories](#categories) for more about what categories are available

### Images

For courses/tutorials, images should be in the `img` directory associated with the course.  Images should be included in the markdown files as markdown images.  For images in the course's `img` directory, image links should look like this:
    
    ![this is some alt text](img/my-image.png?500 "this is the image title")

For images elsewhere on the site (not in the course's `img` directory), image links should look like this:
        
    ![this is some alt text](/content/tutorials/some-other-tutorial/img/my-image.png?500 "this is the image title")

For both types of local images, you can specify the image width by adding `?x` to the end of the filepath where `x` is the width in pixels.  If this is omitted the image is displayed at its default size.

Links to external images should look like this:

    ![this is some alt text](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a6/Pink_lady_and_cross_section.jpg/330px-Pink_lady_and_cross_section.jpg "this is the image title")

Image alt text and title is not required.

### Links

### Shortcodes

Hugo's [shortcodes](https://gohugo.io/content-management/shortcodes/) are small template snippets that you can use in your markdown files.  Feel free to add/improve/extend any new shortcodes you think would be useful.  We encourage you to use the following shortcodes when creating new markdowns:

{{< code >}}
: allows you to include code from a separate file in your markdown as if you had typed it as a code block.  
    *Usage Example:*  
    
    {{< code lang="c++" >}}  
    [](code/fractions.cxx)  
    {{</ code >}}

* Use `lang` to specify the language that should be used for the code block's syntax highlighting
* Specify the file to include with a markdown link.  You should **NOT** include a title for the link (i.e. the square brackets should be empty).  Files should be referenced the same way as if you were [linking](#links) them.

{{< file-download >}}
: allows you to include a "download" button for a file.  
    *Usage Example:*
    
    {{< file-download text="VaGoldfinch.txt" >}}
    [](data/VaGoldfinch.txt)
    {{</ file-download >}}

* `text` lets you specify what text the download button should display
* Specify the file the same way as in the `{{< code >}}` shortcode

{{< info >}}
: creates a highlighted info box for important text.  Can contain any markdown/shortcodes
    *Usage Example:*
    
    {{< info >}}
    This is some important markdown
    {{</ info >}}

{{< warning >}}
: similar to `{{< info >}}` except with a yellow warning highlight
*Usage Example:*

    {{< warning >}}
    This is some warning markdown
    {{</ info >}}

{{< spoiler >}}
: creates a dropdown that hides the enclosed markdown by default.  Useful for hiding answers to exercises  
*Usage Example:*

    {{< spoiler text="show answer" >}}
    This is some hidden markdown
    {{</ info >}}
* `text` is the text to display next to the dropdown arrow

{{< slideshow >}}
: displays a slideshow from a folder of images.  
*Usage Example:*

    {{< slideshow ext="png" >}}
    [](img/slides)
    {{</ slideshow >}}

* slide images should be in a single folder and the images should be named Slide1.png, Slide2.png, etc in order of how they should be displayed
* the link to the slides folder should be relative to the file the shortcode is used in, and should be located somewhere in /content
* `ext` is the extension of the images files (ex. "png", "JPG", etc)

### Delete content
* Delete the .md object(s) you no longer want in the site, then commit and push.
* To temporarily remove content, set the `draft` status of any .md object to `true`.
* Republishing deletes remote files in S3/CloudFront.

### Categories

The _index.md file for a course/tutorial should contain a list of categories associated with that page in its frontmatter.  ex. `categories: ["Containers","HPC"]`.  Only the `_index.md` file should list the categories, and they should not be included in the course/tutorial's other `.md` files.  The available categories are:

> App Development, Bioinformatics, C/C++, C++, Containers, Data Analytics, Data Transfer, Databases, Deep Learning, Docker, Fiji, Fortran, Git, Globus, GPU, HPC, Image Processing, Julia, Machine Learning, MATLAB, MPI, OpenMP, Parallel Computing, Programming, Python, R, Shiny, Unix

Categories should be spelled/capitalized exactly as shown here.

## Building and Publishing

### Preview content locally
`hugo server` will bring up the local hugo server and give you a preview URL `http://localhost:1313/`. If making many changes, open another terminal to keep the `hugo server` running as you edit.

### Publish content
Simply push `staging` back to GitHub. We're in the process of setting up the S3 buckets for hosting the content. 

TravisCI will handle it from there and publish the content at the staging site, https://staging.learning.rc.virginia.edu. Pushing your content to the production website requires a PULL REQUEST.

> Remember that after pushing your changes back to the `staging` branch, the https://staging.rc.virginia.edu/ website will be updated within 1-2 minutes. Hold down the SHIFT key when reloading your browser to refresh your local cache.

### Automated Builds

Travis-CI is a CI/CD tool that automates builds and deployments of the website code. Take note of the contents of `.travis.yml` and you will see instructions for how Travis builds the site:
* Upon a push to `staging` or `master` it launches a customized container `uvarc/hugo-build:v2`.
* That container runs a script that clones that branch of the repository and runs `hugo -v --ignoreCache` to build the site.
* Travis then synchronizes the published HTML, JS, CSS, images and files to Amazon S3.
* Finally, the build invalidates the CloudFront cache that serves out the actual website.

Build+deployment generally takes 70 seconds and can be monitored using the [Travis-CI dashboard](https://travis-ci.com/uvarc/rc-website/builds) for this repository.
