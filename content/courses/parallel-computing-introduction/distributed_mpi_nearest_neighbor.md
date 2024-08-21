---
date: "2020-11-17"
title: "Nearest Neighbor Send and Receive"
weight: 80
---

One of the most common patterns in MPI programming is nearest-neighbor exchanges.  In this case, a process sends to its neighbor and receives from its neighbor. The definition of "neighbor" may depend on the _topology_ of the layout of ranks.  For a simple one-dimensional organization the neighbor to the left is `rank-` and the neighbor to the right is `rank+1`. 

![](img/nearest_neighbor.png "Schematic of nearest-neighbor exchange by rank")

Any blocking point-to-point communications can potentially deadlock, but we must be especially careful with nearest-neighbor communications.  Each process must be in an appropriate state when a message is sent to it.  How do we accomplish this?

As an example, let us consider an exchange in which each process sends its rank to its neighbor and receives the neighbor's rank.  Even-number processes send to their right and odd-numbered processes send to their left.

### Deadlock

We might first think all processes should be in the Receive state, then Send the message.  

**Examples**

{{< spoiler text=C++ >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_deadlock.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Fortran >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_deadlock.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Python >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_deadlock.py)
{{</ code >}}
{{< /spoiler >}}

However, this pattern is guaranteed to deadlock because the MPI_Recv is blocking.  It will wait indefinitely for a message, so the process never has a chance to send anything.

### Unsafe

Perhaps we can swap the MPI_Send and MPI_Recv. The Send will pack up the message into the buffer and return.  The process then proceeds to Receive, which accepts the message.

{{< spoiler text=C++ >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_unsafe.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Fortran >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_unsafe.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Python >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_unsafe.py)
{{</ code >}}
{{< /spoiler >}}

This pattern is _unsafe_ because the buffer may not be able to contain all the messages to be sent. On most modern systems, however, it will very often work, especially with short messages. For that reason it is a good idea to use built-in MPI tools as much as possible, such as [MPI_Sendrecv](distributed_mpi_sendrecv).

### Safe

For a safe exchange, we split the ranks by even and odd.  One set sends first, while the other is waiting to receive; the reverse is true for the other set.  Note that we have restricted the example to run only on an even number of ranks to avoid the need for special handling of the rightmost process. In general we would have to add conditionals for that case, but we are keeping the example as simple as possible.

{{< spoiler text=C++ >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_safe.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Fortran >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_safe.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Python >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/code/exchange_safe.py)
{{</ code >}}
{{< /spoiler >}}

**Exercise**

Download the three codes for your language and try them.  The first example will have to be canceled manually.

