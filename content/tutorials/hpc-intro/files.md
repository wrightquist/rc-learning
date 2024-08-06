---
date: "2022-10-01"
title: "Working with Files"
weight: 400
---

Files are the foundation of working with an HPC cluster.  We need to be able to

* Transfer files to and from the cluster
* Edit text files
* Create files through the software we run

Each user has a `home` location and a `scratch` location.  When you log in you will be in the `home` location.  For now we will assume you will work with files in your home folder.  We will discuss the scratch folder later.

## File Paths

Every file has a full name called its _path_. The path provides the operating system with the exact location of the file, relative to some starting point.

Examples:
* Windows
  `C:\Users\mst3k\Desktop\mystuff.txt`
* Mac OS
  `/Users/mst3k/Desktop/mystuff.txt`
* Linux (usually)
  `/home/mst3k/Desktop/mystuff.txt`

These paths traverse through some _folders_, which in Linux are often called **directories**, to arrive at the file `mystuff.txt`

### Paths on Linux

UVA HPC runs the Linux operating system.  File paths start from _root_, denoted with a forward slash (`/`).  The layout of the folders/directories is like an upside-down tree.

![](img/unix_tree.png "Schematic of folders on Rivanna. Only some files and folders shown.")

## Transferring Files

You have several options for transferring data onto your home or scratch directories.

* Use a drag-and-drop option with [MobaXterm](https://mobaxterm.mobatek.net) (Windows) or [Filezilla](https://filezilla-project.org/) (Mac OS and Linux).
* For small files, use the Upload and Download buttons in the Open OnDemand FileExplorer App.
* Use the scp command.
* Use the web browser in the FastX desktop to download data from UVA Box or other cloud locations.
* Use the git clone command to copy git repositories
* Set up a [Globus](https://globus.org) endpoint on your laptop and use the Globus web interface to transfer files.
  See [https://www.rc.virginia.edu/userinfo/globus/](https://www.rc.virginia.edu/userinfo/globus/) for details.

### Transferring with Graphical Clients: macOS and Linux - Filezilla

This illustration is from a Linux computer.  macOS is similar.

First click the Site Manager icon in the upper left.

![](img/Filezilla_ribbon.png "Site Manager")

Select New Site.  Rename it.  Fill in the text boxes and dropdown.  Be sure to select SFTP in the Protocol box.  As for MobaXTerm, we recommend using a specific host name.  Click `OK` to save and `Connect` to initiate the connection.  A multiple-pane window similar to that of MobaXTerm will open.

![](img/Filezilla_settings.png "Site Manager")

### Transferring with Graphical Clients: Windows - MobaXterm

Start an SFTP session in MobaXterm.  Use one of the specific hosts `login1.hpc.virginia.edu`, `login2.hpc.virginia.edu`, `login3.hpc.virginia.edu`

![](img/Moba_sftp_session.png "New SFTP session in MobaXTerm")

A double-paned window will open.  Drag and drop files between your local machine and the remote server.

![](img/Moba_sftp_pane.png?1000 "drag and drop")

## Transferring with Globus

Globus is a non-profit service for secure, reliable research data management developed and operated by the University of Chicago and Argonne National Laboratory, supported by funding from the Department of Energy, NSF, and the NIH. With Globus, subscribers can move, share, & discover data via a single interface – whether your files live on a supercomputer, lab cluster, tape archive, public cloud or your laptop, you can manage this data from anywhere, using your existing identities, via just a web browser.

![](img/globus.png)

### Advantages of Using Globus

Globus provides a secure, unified interface to your research data. Use Globus to "fire and forget" high-performance data transfers between systems within and across organizations.

### Installing Globus

To transfer data to and from your computer, you will first need to install Globus Personal Connect. The following links provide instructions for installing Globus Personal Connect based on your machine's operating system.

| Platform | Installation instructions                                      |
|----------|----------------------------------------------------------------|
| Mac      | https://docs.globus.org/how-to/globus-connect-personal-mac     |
| Linux    | https://docs.globus.org/how-to/globus-connect-personal-linux   |
| Windows  | https://docs.globus.org/how-to/globus-connect-personal-windows |


### Transferring Files

Files are transferred with the Globus File Manager Web App. There are three ways to get to the app:

1. Go straight to https://app.globus.org/file-manager
2. Go to https://www.globus.org/ > Log In (top right corner)
3. Click Globus icon in Toolbar > Web: Transfer Files

Once the app is open you can choose collections to transfer data between.

### Sharing Data with Collaborators

Globus users are able to share data with anyone with a Globus account. All UVA HPC and Ivy users have Globus accounts (authenticate with Netbadge).

External collaborators don’t need to be affiliated with an institution using Globus in order to share data with them. Anyone can create a Globus account using @globusid.org

More information on using Globus can be found on our learning [website](/content/tutorials/globus-data-transfer) and from our [documentation](https://www.rc.virginia.edu/userinfo/globus/).

## Creating and Deleting Files

There are three quick ways to work with files.

* The Open OnDemand File Explorer.

* If logged in through FastX, you can use the "Caja" file manager.  It can be accessed through the filing-cabinet icon in the ribbon at the top, or via the Applications->System Tools menu.  Caja works very similarly to Windows Explorer and the Mac Finder, but is somewhat more limited. It should be simple to use.  The Open OnDemand file manager shows only one location at a time, whereas Caja, like Explorer or Finder, can open multiple windows. Note: you will not be allowed to do anything as "Administrator."

{{< info >}}
In Open OnDemand and Caja, rather than trying to navigate to your /scratch directory, use Go To (OOD) or Go->Location (Caja) and type the path `/scratch/mst3k`, using your own ID rather than `mst3k`.
{{< /info >}}


### Creating Files and Folders

* Open OnDemand: click the New File (file) or New Dir (folder) button and provide the name. You may also provide a path.
* In FastX with Caja: For a new file go to the File->Create Document menu. For a folder use File->Create Folder.
* In FastX you can use an editor such as `pluma`, which is accessible through the Applications->Accessories menu, using its File->New menu item.  You can then use the editor to add content to the file.

### Deleting Files and Folders
* In the Open OnDemand File Explorer, select the file or folder, then click the red Delete button.  It will request confirmation.
* In the "Caja" file manager on FastX, right-click and Delete.  Since the space in your home directory is limited, we recommend not moving to Trash.

## Copy, Rename, and Move Files

### Renaming Files and Folders
* In the Open OnDemand File Explorer, click on Files on the Dashboard and click the file or folder you want to rename.  Find the menu (three vertical dots) to the right of the file name.  Click Rename.
* In the "Caja" file manager on FastX, select the file or folder.  The combination of clicking on the icon and hitting the F2 key, should work on most keyboards as it does for Windows.  You can also right-click and choose Rename.

### Moving Files and Folders
* In the Open OnDemand File Explorer, use the Copy/Move button in the upper right.  Select the file or folder you wish to move.  A dialog will open.  In your navigation pane, go to the target folder.  Click Copy in the dialog on the left.
* In the "Caja" file manager on FastX, if moving within the same parent folder, just drag the file or folder to the new location.  If moving between folders that do not share a parent, open another Caja window.  `Cut` the file or folder and `paste` to its new location.

### Copying Files and Folders
* In the Open OnDemand File Explorer, use the `Copy/Move` button, but click on Copy rather than Move.
* In the "Caja" file manager on FastX, open another Caja window and drag the icon of the file or folder between them.  Alternatively right-click and use the `copy` and `paste` menu items.

## Editing Files

Once we have our files on the system, we may need to edit them.  It is a good idea to edit your files directly on the system, rather than editing on your local computer and then transferring them back and forth.

You can create files by the same process as editing an existing one; just select `New` if there is a menu.

You can use:
* The built-in editor in Open OnDemand. Click on Files on the Dashboard, highlight the file that you want to edit. From the dropdown menu next to the file name, select Edit.  A simple editor will open. To create a file, navigate to the desired location, click the New File button, then edit that file.
* If logged in through FastX, you can use the `pluma` editor, which is accessible through the Applications->Accessories menu.  You can also start it from a terminal with either its name `pluma` or as `gedit` (those are the same program).
* The MATE desktop in FastX also provides the semi-graphical editors `Emacs` and `GVim` in the same menu.
* In FastX, you can also use a programmer's interface such as VSCode, Spyder, or Rstudio.  For extensive editing or running programs through environments such as VSCode, use the Open OnDemand [interactive app](interactive_apps).

## Exercise 3

Now that we have covered the basics of OOD interactive apps, OOD functionality, and how to work with files, we will now put everything together to create a unique job submission script and run it through the job composer on OOD. In this example we will write a simple 'Hello World!' python script and a submission script to be run with the OOD job composer.

You'll need to create two files in your Desktop (```/home/computingID/Desktop```): ```hello.py``` and ```hello.slurm```. You can use any text editor of your choice: FastX editors (pluma, gedit, etc.) or the  OOD file editor. In hello.py add the following lines:

```
# Write hello 10 times
for i in range(10):
    
   print ("\n {}  Hello World!".format(i+1))

print("\n\n")
```

Next, we will need a submission script to submit this code to run on a compute node. Open ```hello.slurm``` and add the following:

```
#!/bin/bash
#SBATCH --cpus-per-task=1            
#SBATCH --mem=6000            
#SBATCH --time=00:05:00       
#SBATCH --partition=standard    
#SBATCH --account=your_allocation

module purge
module load anaconda
python hello.py
```

Be sure to replace ```your_allocation``` with the name of the allocation you have access to.

Once these two files are created, you can use the job composer on OOD to submit ```hello.slurm``` to a compute node to run the python code.

Once the job has completed, you should see a slurm-jobID.out file in your Desktop. View the file and make sure its contents are what you expect.
