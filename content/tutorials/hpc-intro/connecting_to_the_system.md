---
date: "2022-10-01"
title: "Connecting and Logging On To Rivanna"
weight: 100
---

* There are three ways to connect to the HPC System:
    * Open OnDemand, a graphical user interface through a web browser
        * you can examine and manipulate files and submit jobs.
        * you can access applications such as Matlab, Jupyterlab, and R Studio Server.
    * FastX Web, direct access to a desktop
    * _ssh_ (Secure Shell) client, which provides direct access to the command line.
        * For Windows we recommend [MobaXterm](https://mobaxterm.mobatek.net/)

## Open Ondemand

To connect to Open OnDemand, open your web browser and type

[https://ood.hpc.virginia.edu](https://ood.hpc.virginia.edu/)

You will need to authenticate with Netbadge (“Netbadge in")

You can connect to Open OnDemand from off-Grounds locations without a VPN connection.

Remember that Open OnDemand is a Web application.  If it freezes on you, click `UVA Open OnDemand` in the upper left.  It will log you out eventually so you may need to log in again.  You also may have to refresh pages to see changes.

It may also open many tabs.  It is safe to close them if you aren't using them; just make sure you first click "Save" for any files you are editing and want to save changes.  You can even close all the tabs and log in again.

### Open Ondemand Dashboard

The Open OnDemand home page is the Dashboard.

![](img/OOD_Dashboard.png "OOD Dashboard")

## FastX

FastX is a Web-based desktop environment for HPC. It is accessible either through the [Open OnDemand Interactive Apps](interactive_apps) menu, or directly at [rivanna-desktop.hpc.virginia.edu](https://rivanna-desktop.hpc.virginia.edu).

FastX requires the VPN.  If the VPN is not active, the start page _will not_ load.

Always use either the OOD link or the `rivanna-desktop` URL.  The underlying name of the host may change from time to time.

![](img/FastX_splash_screen.png "Logging in to FastX")

### Launching a FastX Session

FastX starts a _session_ on a frontend. A new session is started by selecting either the _MATE_ or _Terminal_ icon under Applications on the right side of the page.

![](img/FastX_session_page.png "Starting a new session")

Most users should choose the MATE session.

![](img/FastX_session_launch.png "Starting a MATE session")

Click the icon, then click the play button on the MATE session under "Disconnected Sessions" on the page. This will open a new window with two options: Browser Client, and Desktop Client.

![](img/FastX_connect_options.png "Browser or Desktop Client")

Select the Browser Client to connect to your session.

### The FastX Desktop

A MATE desktop looks a little like an older Windows desktop. In the ribbon at the top are `Caja`, a file manager; a `Terminal` application, and the Firefox Web browser.

![](img/FastX_desktop.png "The MATE Desktop")

### Logging out of FastX

If you simply close your session browser tab, FastX _suspends_ your session rather than terminates it.  It is generally preferable to terminate rather than suspend so that you will not accidentally have multiple sessions running.

One way to terminate is to log out.  Go to the System menu in the top ribbon and select `Log Out mst3k` (with your ID).

![](img/FastX_logout.png "Logging out of the desktop.")

### Terminating or Restarting FastX

You can also terminate -- or restart -- a session from the "My Sessions" tab.  To terminate, click the `x` in the upper right of the session, or use the menu.

To restart instead of terminating, click the arrow for "run".

![](img/FastX_kill_session.png "Terminating or restarting a session.")
