---
date: "2022-10-01"
title: "Interactive Apps with Open OnDemand"
weight: 200
---

Open OnDemand's File Explorer, the FastX Web interface, and various command-line interfaces, can be used to prepare work for the cluster. This includes transferring and editing files, looking at output, and so forth. However, all production work must be run on the compute nodes, not on the frontends.

A large, multi-user system like UVA's HPC cluster must be managed by some form of _resource manager_ to ensure equitable access for all users.  Research Computing uses the [Slurm](https://slurm.schedmd.com/) resource manager.  Resource managers are also often called _queueing systems_.  Users submit _jobs_ to the queueing system. A process called a _scheduler_ examines the resource requests in each job and assigns a priority. The job then waits in a _queue_, which Slurm calls a _partition_, until the requested resource becomes available.  A partition is a set of compute nodes with a particular set of resources and limits. There are partitions for single-node jobs, multiple-node jobs, GPU jobs, and some other dedicated partitions. A list of the different queues and resources are listed below.

![](img/overview_queue_info.png "Queue Information")

Open OnDemand offers an easy way to run _interactive_ jobs.  With an interactive job, you are logged in directly to a compute node and can work as if it were a frontend.  Please keep in mind that an interactive job terminates when the time limit you specify expires, unless you explicitly end the session.

## The OOD Interactive Apps Menu

To submit an interactive job, from the Open OnDemand dashboard click on the menu `Interactive Apps` for the dropdown list.

We will focus on JupyterLab, Rstudio Server, and the Desktop for now.

![](img/OOD_Interactive_Apps.png "OOD Interactive Apps menu")

## Interactive JupyterLab Sessions

From the Interactive Apps menu, select JupyterLab.

The Jupyter Web Form gathers information about the computing resources that you need to run your Jupyter Notebook.

{{< info >}}
After you fill in the form, it will remember settings the next time that you connect to it, so watch out if you wish to change something.
{{< /info >}}

![](img/OOD_juplab_form.png "Setting up a job in JupyterLab through OOD")

You must choose a partition from the dropdown list. The partition limitations are explained below the dropdown box. Most of the time, you will select the __Standard__ partition.  If you are running a deep learning model, you will want to choose a __GPU__ Partition. If you do not specify a GPU model, your job will be assigned to the first available.

The "Number of hours" is the time your job session will remain active.

{{< warning >}}
If you exceed the requested time limit, your session will be terminated without warning.
{{< /warning >}}

The "Allocation" is the name of the allocation that should be charged.  Your advisor should have told you what to use.  You can be a member of more than one allocation.  In that case one of them, not chosen by you, will be the default.  It is best to always fill in the name of an allocation, but remember to change it if necessary.

Once you have completed the form, click on the `Launch` button to submit the request.

### Launching an Interactive Session

When you submit a request for an interactive app, it will be placed into the partition you specified, where it will wait until resources become available.  Requests with higher resource requests (more cores, more memory, more time) may wait longer.

Once the job session begins, the screen will ask you to connect.  In our example you will see a `Connect to Jupyter` button appear.

![](img/OOD_Jupyter_connect.png "Connecting to a session.")

When you connect, you will see your files on the left sidebar and a collection of kernels from which to choose.  You may not see all of these "tiles" because some accounts have customized tiles set up.

![](img/OOD_Jupyter_kernels.png "Start screen for JupyterLab")

If you have connected previously, it may start from your earlier status and you will not see the tiles.  

### Using and Closing an Interactive Session

If you have not previously used the OOD JupyterLab interactive app, you must select a kernel before initiating the notebook.  Once JupyterLab is set up, you can also start another notebook with a different kernel by selecting File->New Notebook.  It will then show a dropdown with the kernels available to you.

![](img/OOD_Jupyter_nb.png "Starting a new notebook.")

If you are accidentally disconnected, you can go back to the OOD "My Interactive Sessions" tab and reconnect.  However, anything left running in a cell may have been terminated.  This is due to a limitation of Jupyter, not OOD or the HPC cluster, and does not apply to all interactive apps.

Remember to delete your session if you finish early. Closing your browser tab does not end the session.

![](img/OOD_delete_session.png "Ending a session.")

### JupyterLab Terminal

You are also able to access the terminal through a JupyterLab session.

![](img/OOD_JupyterLab_Terminal.png "JupyterLab Terminal")

Here, you can execute Linux commands to create custom conda environments and JupyterLab kernels. Additionally, you can access and run singularity containers through this functionality.

Your JupyterLab sessions will be saved in your ```/home/computingID/ondemand/data/sys/dashboard/batch_connect/sys/jupyter_lab/output/``` directory; however, you can navigate to any part of the filesystem in the JupyterLab terminal.

## Rstudio Server

Rstudio Server is a standalone app like JupyterLab. Starting a session is very similar to JupyterLab, but the form differs slightly.  Instead of kernel tiles, you will select a version of R from a dropdown menu from those available.  In this example, the version is R 4.2.2.

![](img/OOD_Rstudio_form.png "Starting an Rstudio session.")

Rstudio Server can continue running any active processes if your network is disconnected.  Simply log back in to Open OnDemand, go to the "My Interactive Sessions" tab, and click `Launch` again.  It will reconnect, not launch another session.

### Rstudio Session

Once you launch/submit your request, your job will wait in the queue until resources are available. You'll then be able to connect to your session:

![](img/OOD_Rstudio_session.png)
![](img/OOD_Rstudio_session2.png "Starting an Rstudio session.")

Rstudio Server can continue running any active processes if your network is disconnected.  Simply log back in to Open OnDemand, go to the "My Interactive Sessions tab", and click `Launch`  again.  It will reconnect, not launch another session.  

## Other Interactive Apps

Some other widely-used interactive apps are MATLAB and the Desktop.

### Desktop

The most general OOD interactive app is the Desktop.  It will start a desktop identical to the FastX desktop, but on a compute node rather than a frontend.  From the desktop you can open a variety of applications from the menu, such as the Caja file manager.  You can also open a terminal window and type any valid commands into it.  In this illustration, the user has loaded a module to build a program for running. The OOD interactive desktop is the preferred method for interactive jobs.

![](img/OOD_Desktop_terminal.png "The OOD Desktop.")

### MATLAB

The MATLAB interactive app starts a MATLAB Desktop environment on a Desktop (VNC). Similar to Rstudio Server, in the form you can choose a version of MATLAB from a dropdown menu.  Once there, you are in a less complete desktop environment.  Your files may not be visible on the Desktop, but you can access them from the Places menu or from the Caja (filing cabinet) icon in the ribbon at the top of the screen.  If you exit the MATLAB Desktop, it will also exit the session.

### Reconnecting

Both MATLAB and the Desktop will persist if your network is disconnected. Log back in to Open OnDemand, find your session from the My Interactive Sessions tab, then click `Launch` again.

## Choosing Resource Requests

| Field                                                            | Description                                                                                                                                                                          |
|------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Number of cores                                                  | Used in parallel processing.  Your code must be modified to take advantage of using multiple cores.                                                                                  |
| Memory Request in GB                                             | When dealing with Big Data, you will need to increase the amount of memory.  A good rule of thumb is to request 2 to 3 times the size of data that you are reading in or generating. |
| Work Directory                                                   | Allows you to change the working directory of a Jupyter Notebook to your /scratch folder.                                                                                            |
| Optional: Slurm Option                                           | Allows you to provide advanced features, like requesting specific nodes or providing a reservation                                                                                   |
| Optional Group                                                   | Only needed if you are in more than 16 computing groups.  You may need to force the system to see your allocation.                                                                   |
| Optional: GPU type for GPU partition &  Optional: Number of GPUs | Only needed in you are running on a GPU node.  The “default” for GPU type will put you on the first available GPU node. For now, the number of GPUS should be 1.                     |

Some fields on the Web Forms are blank, while others are set to default values.

The most important request will usually be the Memory Request.

## Exercise 1

Start a JupyterLab interactive session.  Select the Python 3 kernel.  If you are familiar with Python, you may write any code you wish.  If you do not know Python, click on a cell and type the following

```python
import numpy as np
import matplotlib.pyplot as plt
```
Hit [Shift][Enter] (hold both keys at once) to run the cell, or from the Run menu choose Run Selected Cell.

In the next cell type
```python
x=np.linspace(-1.*np.pi,np.pi,100)
y=np.sin(x)
plt.plot(x,y)
```

Run this cell.

Close the tab, return to My Interactive Sessions in the OOD Dashboard, and delete the interactive job.
