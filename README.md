# Problem Set 3 (PS3): Estimate the Feasible Measurement Set for a System of Linear Algebraic Equations
The objective of `PS3` is to estimate a feasible measurement set for a system of linear algebraic equations that describe the species mole balances for the steady-state reactor problem explored in `Lab 8b`. The steady-state open species mole balances for a well-mixed system with species set $\mathcal{M}$, reaction set $\mathcal{R}$, and stream set $\mathcal{S}$ is described by:

$$
\dot{\mathbf{N}}\cdot{\mathbf{d}} + \mathbf{S}\cdot\dot{\mathbf{\epsilon}} = \mathbf{0}
$$

The matrix $\dot{\mathbf{N}}\in\mathbb{R}^{\mathcal{M}\times\mathcal{S}}$ is the species flow matrix, 
$\mathbf{d}\in\mathbb{R}^{\mathcal{S}\times{1}}$ is the stream direction vector,
$\mathbf{S}\in\mathbb{R}^{\mathcal{M}\times\mathcal{R}}$ is the stoichiometric matrix, and $\dot{\mathbf{\epsilon}}\in\mathbb{R}^{\mathcal{R}\times{1}}$ is the open reaction extent vector.

## Problem Description
* The system has three streams: stream 1, stream 2, and stream 3. All chemical species can be transported in all streams, and no reaction occurs in them. Streams 1 and 2 enter the reactor and stream 3 exits it. The [Toy.net](data/Toy.net) reaction file describes the reaction set that occurs in the reactor.
* We measured all species mole flow rates in streams 1 and 2 and some of the species mole flow rates in stream 3. In particular, in stream 3, we measured $\dot{n}_{A_{1},3}$, $\dot{n}_{A_{2},3}$ and $\dot{n}_{B,3}$. However, the instrument used to measure the species mole flow rates for $A_{1}$ and $A_{2}$ in stream 3 was inaccurate. Therefore, we need to estimate a feasible measurement set using the system of linear algebraic equations, i.e., possible species mole flow rates for $A_{1}$ and $A_{2}$ in stream 3 that produce a feasible (non-negative) steady-state solution.
* We have the following measurement bounds: $3.0\leq\dot{n}_{A_{1},3}\leq{10.0}$, $0.0\leq\dot{n}_{A_{2},3}\leq{6.0}$ and $\dot{n}_{B,3} = 0$. Assume we can sample the species mole flow rates in stream 3 in steps of `0.005`.

## Task
Complete the implementation of the `runme()` function in the `runme_task_1.jl` script to estimate feasible measurements for 
$\dot{n}_{A_{1},3}$ and $\dot{n}_{A_{2},3}$ such that the system of linear algebraic equations emits feasible (non-negative) steady-state solutions. 

* The `runme()` function calls the `_my_system_setup()` function to set up the system of linear algebraic equations and then tests different combinations of $\dot{n}_{A_{1},3}$ and $\dot{n}_{A_{2},3}$ by solving the system of linear algebraic equations.
    * The `_my_system_setup()` function returns the system matrix in the $\mathbf{A}$ variable and the columns of the system matrix that correspond to the measured species mole flow the $\mathbf{B}$ variable. Finally, the function returns the measurement vector in the $\dot{\mathbf{n}}$ variable. 
    * You can use whatever solution method you want to test different combinations of $\dot{n}_{A_{1},3}$ and $\dot{n}_{A_{2},3}$. However, the system matrix is __not__ diagonally dominant. 

* The `runme()` function takes no arguments. It returns a binary array `frame::Array{Int64,2}` of size `1401`$\times$`1201` where `frame[i,j] = 1` if the measurement set produced a feasible steady-state solution, i.e., all values in the solution are non-negative, and `frame[i,j] = 0` otherwise.

* After implementing the `runme()` function, execute the `runme_task_1.jl` script to estimate the feasible measurement set for the system of linear algebraic equations. The script will save an image of the `frame` array to the `myimages` directory. 
* Once you have generated your test image, you can verify its correctness using the `testme_task_1.jl` script. This script compares the image you generated with the correct image and performs a few other checks. If the test script passes all tests, you have successfully completed the problem.
