---
date: "2022-10-01"
title: "Features of Open OnDemand"
weight: 300
---

Open OnDemand has many features accessible directly from the menu bar.

![](img/OOD_File_Menu.png "Open OnDemand Menu Options")

## Accessing Files on Open OnDemand

The "Files" tab on the menu bar gives access to all files in home or project (if applicable) directories.

![](img/OOD_files_tab.png "OOD Files Menu")


Here, you can upload and download small files to and from the cluster from your local computer. You can also create and delete new files and directories in addition to copying or renaming them. The Filter search bar searches for files or directories in the file system.

## Jobs on Open OnDemand

The "Jobs" tab on the menu bar allows you to submit and search for jobs on the cluster.

![](img/OOD_jobs_tab.png "OOD Jobs Menu")

The "Active Jobs" tab shows all jobs currently running or queues on all partitions for all users. The Filter search bar allows you to narrow jobs by either user, queue, job name, job ID, or job status (running, queued, completed, etc).

### Job Composer

The job composer tab allows you to create and submit a job to run on the cluster.

![](img/Features_job_composer.png "OOD Job Composer")

Selecting the default template will automatically create a submission script called ```demo_hello_world.slurm``` located in ```/home/computingID/Rivanna/data/sys/myjobs/projects/default/1``` on the file system:

![](img/featues_template_job.png "Default Template Job")

Before submitting the job, ```your_allocation``` on the ```#SBATCH --account=your_allocation``` line must be replaced with the name of the allocation you're a member of. We will review editing files later. Once the correct allocation name is edited in, you can click "Submit" to queue your job. It will be given a corresponding Job ID, and once it's completed, the Folder contents will now contain a corresponding output file that contains the instructions from the submission script:

![](img/features_job_output.png "Default Template Output")

There are several job templates that can be run in addition to the default hello world option under New Job > From Template:

![](img/features_templates.png "Template Options")

### Job Viewer

Open OnDemand allows you to check the status of your jobs easily.  Open the Jobs tab and go to Active Jobs.  The default view is All Jobs.

![](img/OOD_squeue_viewer.png "Job status viewer in OOD.")

You can filter to select subsets of the jobs, for example you can view only jobs in the `gpu` partition.

![](img/OOD_squeue_filter.png "Viewing only the GPU partition.")

You can also look at the status of only your own jobs by switching from All Jobs to My Jobs.

![](img/OOD_squeue_myjobs.png "Viewing only my jobs.")

### Getting Job Details

In the OOD Job Viewer, clicking on the right arrow for a particular job will show details of the job if it is queued or running.  Completed jobs will have no information available.  Be patient as it can take a few moments for the information to be loaded.  In this illustration the selected job is PENDING.  The reason given is Resources, which means that no resources are available yet for this job.

![](img/OOD_job_status.png "Viewing only my jobs.")

Completed jobs will be visible only for a short while as they are wrapping up and exiting.

If an error occurs, try reloading the page.

## Shell Access

The "Clusters" tab on the menu bar open a new browser tab with a Linux command line interface for shell access:

![](img/features_shell_access.png "Command line Shell Access")


Here, you are able to upload and download small files to and from the cluster from your local computer. You can also create and delete new files and directories in addition to copying or renaming them. The Filter search bar searches for files or directories in the file system.

## Interactive Sessions

This tab will show you running, pending or completed interactive sessions from the OOD interface.

![](img/features_interactive.png "Interactive Sessions")

## Useful Commands

Sometimes it's useful to check how many SUs are still available on your allocation. The ```allocations``` command displays information on your allocations and how many SUs are associated with them:

![](img/features_allocations.png "Allocations")

running ```allocations -a <allocation_name>``` provides even more detail on when the allocation was last renewed and its members.

One way to check your storage utilization is with the ```hdquota``` command. This command will show you how much of your home, scratch, and project (if applicable) storage are being utilized. Below is the sample output for ```hdquota```:

![](img/features_hdquota.png "Disk Usage")

This is a useful command to check whether you're running out of storage space or to see where files need to be cleaned up. For more detailed information on disk utilization you may also use the ```du``` command to investigate specific directories.


To gain information on the different queues you can type ```qlist``` on the command line:

![](img/features_qlist.png "Queues")

This will show the list of partitions, their occupancy, and the SU charge rate. You can type ```qlimits``` for information on each queue's limits:

![](img/features_qlimits.png "Queue Limits")

Finally, the ```sinfo``` command will provide some more detailed information on the health of each queue and the number of active nodes available. These commands can be useful in diagnosing why a job may not be running, or in better understanding queue usage for more efficient job throughput. More information on hardware specifications and queue information can be found on our [website](https://www.rc.virginia.edu/userinfo/rivanna/overview/#system-details).

## Exercise 2

Start an Open OnDemand File Explorer tab.  In your home directory, create a new file.  Use the Editor to enter the following text:

> I came in with Halley's Comet in 1835. It is coming again next year, and I expect to go out with it. It will be the greatest disappointment of my life if I don't go out with Halley's Comet. The Almighty has said, no doubt: "Now here are these two unaccountable freaks; they came in together, they must go out together."
>
>-Mark Twain

Name the file whatever you wish.  Make a new folder "Quotes."  Move the file to this directory.

Go to the FastX desktop and open Caja (the filing-cabinet icon, or from the System Tools menu).  Navigate to your new directory.  Change the name of the file.  Use whatever method you prefer (right-click or F2 key).  Still in Caja, copy the file.  Give the copy the original name you choose.  Move it to your Desktop.

Return to your Desktop in OOD and delete the file there.

On FastX, return to the Quotes directory.  Open the file with Pluma, and after "Mark Twain" add ", 1909".  
