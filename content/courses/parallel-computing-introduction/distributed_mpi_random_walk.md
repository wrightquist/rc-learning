---
date: "2020-11-17"
title: "A Random Walk with MPI"
weight: 38
---

We would like to start with a simple example that has a simple work distribution.  To make it even easier, we will use no communications.

## Two-Dimensional Lattice Random Walk

A particle is moving through a two-dimensional finite grid.  At each step, the "walker" can move left, right, up, or down, with equal probability.  We seek the distance from the origin after N steps.  

Theoretically, for N steps the distance is $\sqrt{N}$. We want to test this empirically, but one trial does not give us very good results.  We want to run a lot of trials and average the results.

### Agglomeration and Mapping

This algorithm has the properties that:
  * Each trial is independent of the others
  * There is a fixed number of tasks
  * No communications are needed between tasks to obtain independent results.

### Serial Code 

Download the serial code for your language of choice.  Compile it (if appropriate), then run a test case.

{{< spoiler text="C++" >}}
{{< code lang="c++" >}}
[](/content/courses/parallel-computing-introduction/code/random_walk.cxx)
{{</ code >}}
{{< /spoiler >}}

{{< spoiler text="Fortran" >}}
{{< code lang="fortran" >}}
[](/content/courses/parallel-computing-introduction/code/random_walk.f90)
{{</ code >}}
{{< /spoiler >}}

{{< spoiler text="Python" >}}
{{< code lang="python" >}}
[](/content/courses/parallel-computing-introduction/code/random_walk.py)
{{</ code >}}
{{< /spoiler >}}

Using the mpi1 program in your language as an example, add the lines to run this code with MPI.  In your print statement make the first output value be the rank.

## Run it

```bash
mpicxx -o randc mpirandom_walk.cxx
mpiexec -np 4 ./randc 1000000

0:1000000,1000,898.186
1:1000000,1000,189.589
2:1000000,1000,1235.87
3:1000000,1000,391.479
```
We have to compute the average manually
```
678.781
```

Try with -np 8

```no-highlight
0:1000000,1000,1011.24
5:1000000,1000,1569.2
3:1000000,1000,1753.23
2:1000000,1000,967.042
1:1000000,1000,1212.17
6:1000000,1000,418.708
7:1000000,1000,881.862
4:1000000,1000,744.641
```

Why is the rank order jumbled?

MPI output is _nondeterministic_ unless the programmer forces it to be ordered, using a _barrier_.

