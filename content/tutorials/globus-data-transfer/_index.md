---
date: "2024-02-10"
title: "Using Globus to Transfer Data"
summary: "This tutorial will cover data transfer using Globus software."
authors: [cag,kah]
categories: ["Data Transfer","Globus"]
weight: 50
url_video: /videos/globus-data-transfer.mp4
---

![](imgs/globus.png)

This tutorial will cover data transfer to and from UVA Research Computing storage systems using Globus software. Topics include: installing Globus, transferring files, monitoring large transfers, and sharing data with collaborators.

## Overview

Globus is a non-profit service for secure, reliable **research data management** developed and operated by the **University of Chicago** and **Argonne National Laboratory**, supported by funding from the Department of Energy, NSF, and the NIH. With Globus, subscribers can **move, share, & discover data** via a single interface – whether your files live on a supercomputer, lab cluster, tape archive, public cloud or your laptop, you can manage this data from anywhere, using your existing identities, via just a web browser.

Globus started as a pure transfer tool with two strengths:

1. Fast transfers over good networks
2. Robust transfers over flaky networks

Globus now has the add functionality of:

- Data sharing and flexible access control
- Identity management
- A web GUI, scriptable command line tool, and powerful API

## Advantages of Using Globus

Globus provides a secure, unified interface to your research data. Use Globus to "fire and forget" high-performance data transfers between systems within and across organizations.

![](imgs/globus_advantages.png?300)

There are many advantages to using Globus:

- The Globus web app has an easy-to-use point-and-click interface.
- Transfers faster than SCP/SFTP (usually by a factor of two).
- Globus continues interrupted transfers – no need to restart.
- Globus allows you to schedule regular transfers.
- Get email notifications for successful or failed transfers.
- Globus accounts are free! Collaborators don’t need a sponsored UVA account to use Globus.
- VPN is not needed to transfer to and from UVA systems.
- Approved for transferring sensitive data (HIPAA, CUI).


### VPN or no VPN?

UVA Anywhere/More Secure VPN is not necessary for Globus. With just the web app, you can control transfers between systems that have Globus Personal Connect or Server installed.

* The VPN will slow down transfers between your computer and Rivanna.
* The High Security VPN completely blocks transfers between your computer and secure Ivy storage.

## Globus Terminology

Collection
: A set of data that is linked to one or more folders on your computer or a remote server.

Personal Collection
: A group of folders on a PC or workstation where you installed Globus.

Personal Connector
: A program that runs in the background on your computer and allows you to connect to Globus through the Web app.

UVA Standard Security Storage
: The collection for Research Project and Research Value storage.

UVA IVY-DTN
: The collection for Ivy Central Storage.

Shared Collection
: A folder that you can share with other Globus users.

## Logging In

Most activities with globus will require logging in at their Website.

**Instructions**

1. Open the [Globus Website](https://globus.org) and click “Log In”
2. Choose "Use your existing organizational login"
3. Start typing  “University of Virginia” then select it in the dropdown.
4. Log in using Netbadge

Start from the Globus home page:

![](imgs/globus_homepage.png?500)

Log in with your organization login (Netbadge)

![](imgs/globus_login.png?500)

# Installing Globus on Your Computer

To transfer data to and from your computer, you will first need to install Globus Personal Connect. The following links provide instructions for installing Globus Personal Connect based on your machine's operating system.

| Platform | Installation instructions                                      |
|----------|----------------------------------------------------------------|
| Mac      | https://docs.globus.org/how-to/globus-connect-personal-mac     |
| Linux    | https://docs.globus.org/how-to/globus-connect-personal-linux   |
| Windows  | https://docs.globus.org/how-to/globus-connect-personal-windows |

The screenshots and set of instructions below show how to navigate to the installation links from the Globus homepage.

**Instructions**

1. Go to https://www.globus.org/
2. Click **“I Want To…”** > **“Enable Globus on my system”**
3. Scroll down to “Globus Connect Personal” (light blue box) and click the **“Get Globus Connect Personal”** link
4. Scroll down to “Install Globus Connect Personal” (light blue box)
5. Click the link for your operating system and follow the installation instructions

Download the software for your operating system:

![](imgs/globus_download_personal_connector.png?700 "Find the link to download for your operating system")

Install the software:

![](imgs/globus_install_personal_connector.png?700 "Download the application")

## Setting Up Globus on Your Computer

Set up Globus once it is installed on your computer.

**Instructions**

1. Start the Globus Personal Connector application.
2. Choose a label for consent and click “Allow”. (The label you choose doesn't really matter.)
3. Choose a name for your Personal Collection. This is the name that you will see in the Globus collections list, so choose something descriptive enough that you know what it is and can quickly find it by searching (e.g. Martinez-Lab-Workstation, Zhang-Personal-Laptop).
4. **Do NOT click the High Assurance checkbox!** The UVA Ivy Data Transfer Node (UVA IVY-DTN) is already configured for sensitive data transfer. Checking the box is redundant conflicts with the default configuration.  The checkbox is not required at all for the Standard Security Storage collection.
5. Click "Save" then "Exit Setup".

![](imgs/globus_setup_personal_connector.png?700 "Setting up the Globus Personal Connector")

## Adding Folders to the Globus Path

When you first set up Globus, it only has access to certain folders of your local drive. You can add additional locations such as mapped network drives or external hard drives in the Globus Options/Preferences menu.

**Instructions**

1. Right-click Globus icon in toolbar
2. Click “Preferences” (Mac) or “Options” (Windows)
3. Click the Access tab
4. Click the “+”
5. Select the drive location and click “Open”
6. Navigate to the drive in the File Manager

![](imgs/globus_connect_options.png "Select Options or Preferences from the Globus Connect menu.")

![](imgs/globus_connect_add_location.png "After clicking the +, navigate to the folder you wish to add.")

**Tips for Navigating to Mapped Drives**

- Click the Up button in the File Manager to navigate to higher level directories
- On a Mac, mapped network drives will typically be located at `/Volumes/drive_name`
- In Windows, network drives will be mapped to a drive letter (e.g., C: or Z:)
- In Globus, `Z:\Drive_Name\my_files` becomes `/Z/Drive_Name/my_files`

## Transferring Files with Globus

Files are transferred with the Globus File Manager Web App. There are three ways to access the app:

1. Go straight to https://app.globus.org/file-manager
2. Go to https://www.globus.org/ -> Log In (top right corner)
3. Click Globus icon in Toolbar -> Web: Transfer Files

These **instructions** summarize the steps to set up and start a transfer.

1. Click the “Collection” field.
2. Click the “Your Collections” tab.
3. Select your Personal Collection.
4. Click “Transfer or Sync to…” in the gray menu.
5. Click the second “Collection” field.
6. Search for and select “UVA Standard Security Storage” or “UVA IVY-DTN”.
7. Select the files or folders you want to transfer.
8. Select the destination for your files.
9. Click the highlighted “Start” button.

## Setting Up Source and Destinations

First we must assign the source and destination collections.

![](imgs/globus_search_for_collection.png?500 "Searching for collections")

Start typing into the Collection textbox. A search bar will appear. Type until you find your personal collection name in the dropdown.  A green icon to the left of the name indicates an active collection.  Red icons show inactive collections.

![](imgs/globus_finding_collection.png?500 "Finding your collection")

Do the same thing for the UVA collection you are targeting. Check again for the green "stack" icon for an active collection. In this case we also see a green "columns" icon.  This indicates the collection is _managed_.

![](imgs/globus_uva_standard_security_collection.png?500 "Find the managed collection")

## Getting Ready to Transfer

We are now ready to initialize our transfer.

**Instructions**

1. Select the files or folders you want to transfer.
2. Select the destination for your files.
3. Click the highlighted “Start” button.

Navigate to the folder or files to be transferred on the source (here the personal collection).  Chose the files or folders you wish to transfer.

![](imgs/globus_select_folder.png?500 "Select files or folders to transfer")

Navigate to the target folder on the destination (here the UVA Standard Security Collection).  You may need to move through several levels to find your target folder.

## Start the Transfer

You can optionally click the transfer options box to set specific parameters for your transfer.

- By default, transfers on UVA DTNs are synced (option 1) and encrypted (option 5) – no need to select them.
    ![](imgs/globus_transfer_options.png?500)
- Files with errors will cause the entire transfer to fail – skip files with errors instead (option 6).
    ![](imgs/globus_transfer_option_skip_files_with_errors.png?500)
- You can schedule one-time and regular transfers with Timer.
- When ready, click the blue <span style=color:blue>Start</span> button that points in the appropriate direction. When complete, the new folder will appear in the destination pane.
    ![](imgs/globus_completed_transfer.png?500)

## Monitoring Your Data Transfer

By clicking on the "Activity" tab, you can check on the progress of transfers, monitor the effective transfer speed, and look for any failures.

## Sharing Data with Others

Globus users are able to share data with anyone with a Globus account. All UVA Rivanna and Ivy users have Globus accounts (authenticate with Netbadge).

External collaborators don’t need to be affiliated with an institution using Globus in order for you to share data with them. Anyone can create a personal Globus account using @globusid.org

![](imgs/globus_collab.png?500)

The instructions below show how to create a **shared endpoint**, a folder in which collaborators can upload and download data. Shared endpoints may be public (visible to the world!) or accessible only to users with permission.

**Instructions**

1. Select the file or folder you want to share.
2. Click the `Share` button.
3. Click "Add a Guest Collection."
4. Enter a name and description for the Shared Endpoint. This should be unique and easy to remember.
5. Click "Create Guest Collection".
6. Click "Add Permissions  Share With".
7. Enter the UVA or Globus ID of the user you want to share with. Your collaborators must have a Globus ID; email is not sufficient.
8. Click "Add" and "Add Permission".

Optional: Add write permissions so the user can upload data. Enter an email message to the recipient if you wish.

![](imgs/globus_setup_guest_collection.png?500)

## Troubleshooting

Some problems occur frequently. Here are a few tips to solve them:

| Common Issues                                                                                    | Solution                                                                                                                             |
|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| I have admin privileges on my Health System computer. Why isn’t the Globus installation working? | Sometimes the Health System firewall prevents Globus software from connecting. Ask HIT to remote in and complete the installation.   |
| Why won’t my transfer to Ivy storage start?                                                      | Globus doesn’t work while connected to the High Security VPN. Disconnect while transferring data.                                    |
| Globus is transferring folders but they’re all empty.                                            | There is probably a file with bad permissions or characters in the filename. Choose “Skip files with errors” in the Transfer options |
| I can’t connect to UVA Standard Security Storage.                                                | When leaving UVA, your Eservices account can expire before your email – meaning no Globus access.                                    |

![](imgs/globus_transfer_option_skip_files_with_errors.png?500)
