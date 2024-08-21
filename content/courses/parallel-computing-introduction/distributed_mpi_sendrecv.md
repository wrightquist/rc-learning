---
date: "2020-11-17"
title: "MPI_Sendrecv"
weight: 85
---

The pattern of sending and receiving we have just seen is so common that the MPI standard provides a built-in function to handle it, `MPI_Sendrecv`.  This function is guaranteed not to deadlock for an exchange between _source_ and _dest_.  In general, sendcount and recvcount, and the sendtype and recvtype, should be the same.  Tags must also match appropriately.

## Sendrecv

The syntax for MPI_Sendrecv is
```c++
int MPI_Sendrecv(&sendbuf, sendcount, sendtype, dest, sendtag,
                 &recvbuf, recvcount, recvtype, source, recvtag, comm, &status)
```
```fortran
call MPI_Send(sendbuf, sendcount, sendtype, dest, sendtag, 
              recvbuf, recvcount, recvtype, source, recvtag, comm, status, ierr)
```
```python
comm.Sendrecv([sendbuf,sendtype], dest, sendtag=0, recvbuf=None, source=ANY_SOURCE, recvtag=ANY_TAG, status=None)
```
Python programmers should observe that the above syntax is taken from the `mpi4py` documentation, and values of variables are the defaults. As usual there is a lower-case form for pickled objects that does not use the list for the buffers.

**Examples**

We will rewrite the previous examples using MPI_Sendrecv. Each process will send its rank to its neighbor on the right and will receive that neighbor's rank.

{{< spoiler text=C++ >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/code/mpi_sendrecv.cxx)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Fortran >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/code/mpi_sendrecv.f90)
{{</ code >}}
{{< /spoiler >}}
{{< spoiler text=Python >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/code/mpi_sendrecv.py)
{{</ code >}}
{{< /spoiler >}}

**Exercise**

Download the three codes for your language and try them. 

