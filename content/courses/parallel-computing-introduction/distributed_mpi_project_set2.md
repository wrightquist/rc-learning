---
date: "2020-11-17"
title: "MPI Project Set 2"
weight: 89
---

## Project 4

A "token ring" is a circular messaging system.  Think of a relay, with a message or "baton" being passed from one runner to the next, but around a circle so that the last "runner" passes it back to the first. Write a program that implements this with MPI.  Hint: separate the ranks into root and everybody else. You may wish to use MPI_ANY_TAG and MPI_ANY_SOURCE.

#### Example Solutions
{{< spoiler text="C++" >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/solns/ring.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Fortran" >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/solns/ring.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Python" >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/solns/ring.py)
{{</ code >}}
{{< /spoiler >}}

## Project 5

Write a program in which each process determines a unique partner to exchange messages.  One way to do this is to use
```no-highlight
if rank < npes//2:
partner=npes//2 + rank
else
partner=rank-npes//2
```
where the `//` indicates integer division (no fractional part).

Each tasks sends its rank to its partner.  Each task receives the partner's rank.  Print the message received when done.  You may assume that the number of processes is even, but check that this is the case before proceeding.

Hints: do not overwrite the receiver's rank.  As always, Python programmers should take care that NumPy arrays are declared with the correct type.

#### Example Solutions

{{< spoiler text="C++" >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/solns/send_recv_rank.cxx)
{{</ code >}}
{{< /spoiler >}}

{{< spoiler text="Fortran" >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/solns/send_recv_rank.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Python" >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/solns/send_recv_rank.py)
{{</ code >}}
{{< /spoiler >}}

## Project 6

A common pattern in parallel programming is the _manager-worker_ structure. A "manager" process distributes work to "worker" processes.  Sometimes manager code is separated by `if rank==0` (the manager should nearly always be rank 0) statements, while the other ranks execute the "worker" code. Sometimes the manager spawns distinct worker processes, but that requires using the more advanced MPI `spawn` capability.  In this project we will use a single code.  Usually the manager distributes work to the workers, which return results; the manager then hands more work to those processes that are ready, until all is completed. For this example the workers will do only one round of work.

Starting from the stub for your language, complete the send and receive calls.

#### Starting Codes
{{< spoiler text="C++" >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/code/manager_worker_stub.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Fortran" >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/code/manager_worker_stub.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Python" >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/solns/manager_worker.py)
{{</ code >}}
{{< /spoiler >}}

#### Example Solutions
{{< spoiler text="C++" >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/solns/manager_worker.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Fortran" >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/solns/manager_worker.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text="Python" >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/solns/manager_worker.py)
{{</ code >}}
{{< /spoiler >}}
