---
date: "2022-10-01"
title: "Overview of UVA HPC"
weight: 4
---

## Terminology

* Node
    * A _node_ is the basic building block of a cluster.
    * Nodes are a type of computer called a _server_.
        - They generally have more power than a typical computer.
        - They may have specialty hardware like graphical processing units.

    * Two types of nodes
        * <span style="color:#0000FF">Head Node </span> – a server used for logging in and submitting jobs.
        * <span style="color:#0000FF">Compute Node </span> \-\-  a server that carries out the computational work.

* Core – an individual processor on a computer
    * The cluster's nodes have many cores (typically 40 each)

* Memory
    * The random-access memory on a node

* Storage
    * Disk storage visible from a node 

## Allocations and Accounts

Time on the HPC cluster is _allocated_.

* An allocation refers to a block of CPU time that you can use to run your computations.
* Only faculty may request an allocation. Research staff may apply for an exception.
    * Students must be sponsored by a faculty or research staff.
    * All individuals on a given allocation share the service units.
* Allocations may be requested at [https://www\.rc\.virginia\.edu/userinfo/rivanna/allocations/](https://www.rc.virginia.edu/userinfo/rivanna/allocations/)
* Allocations are measured in service units (SUs), where __1 SU = 1 core\-hour__ in most cases.  Nodes equipped with GPUs may charge more than one SU per core-hour.

### Getting an Allocation

![](img/allocation_schematic.png "Requesting an Allocation")

## Login Accounts 

* Allocations and Groups
    * An allocation is associated with a _group_.  Currently this is a [Grouper](https://groups.identity.virginia.edu/) group.
    * Members (but not administrators) of the allocation group automatically receive an account on the system.
    * RC staff do not manage allocation groups.  The PI is responsible for adding and removing group members.
    * The PI may designate administrators and delegate the task of managing the group to them.

## System Specifications

Currently the supercomputer is made up of two systems, Rivanna and Afton, and between the two has 626 nodes with over 20448 cores and 8PB of various storage.

Several queues (or “partitions”) are available to users for different types of jobs. One queue is restricted to single-node (serial or threaded) jobs; another for multi-node parallel programs, and others are for access to specialty hardware such as large-memory nodes or nodes offering GPUs.

More information on queueing policies and hardware configurations can be found on our [website](https://www.rc.virginia.edu/userinfo/rivanna/overview/).

## Storage

Active users can access free storage for active work.  Research groups that need more permanent storage, or wish to share storage space, can also lease storage.

## No-Cost Storage

Each user has access to a _home directory_ and a _scratch directory_.

### Home Directory

When you log in, you will be in your home directory, e.g. /home/mst3k.  Each home directory on has 50GB of storage capacity.  The home directory is for individual use and is not shareable with other users.

### Scratch Directory

You have access to 10 TB of  <span style="color:#0070C0"> __temporary__ </span> storage. It is located in a subdirectory under `/scratch`, followed by your userID,  e.g.,  `/scratch/mst3k`

The `/scratch` directory is for individual use and is not shareable with other users.

{{< warning  >}}
/scratch is __NOT__ permanent storage and files that have not been accessed for more than 90 days will be marked for deletion.
{{< /warning >}}

## Leased Storage

We offer two tiers of leased storage. For rates and offerings see our [website](https://www.rc.virginia.edu/userinfo/storage/).

### Research Standard Storage

Standard storage is inexpensive but is not backed up, and access can be slow.

### Research Project Storage

Research project storage provides _snapshots_.  Snapshots are not backups, but are a "snapshot" of the files over a time interval in the past, currently one week.
