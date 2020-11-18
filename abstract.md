# Turnpike and Linear Systems Theory -- Old Formulas and New Results

It is often observed, that the solution to an optimal control problem on a
finite but large time horizon stays close to an associated steady state optimal
solution most of the time. This phenomenon is called turnpike property. It has
been addressed in the research of economics since the 60s and has become a
popular topic in systems and control in the last 20 years.

The turnpike property is intimately related to the exponential decay of the
solution to a differential Riccati equation towards the stabilizing solution of
the associated algebraic Riccati equation (ARE). 

In this talk, I will show how the basic result on turnpike (namely that the
linear quadratic regulator (LQR) problem enjoys the turnpike property) follows
from classical system theory results by Callier, Willems, and Winkin[^1]. With
these results, we can also directly address borderline cases like that of
undetectable systems.  By means of an explicit formula for the state transition
matrix of the forward and backward closed loop system, we extend the classical
results to the affine case, i.e., the case with nonzero control targets.

In the second part of the talk, we discuss the turnpike property of LQR problems
with DAE constraints. Under standard assumptions, we establish existence of
solutions to the generalized (nonsymmetric) differential Riccati equation and
conditions for their convergence to a solution of the generalized ARE. With
these results, we can characterize the turnpike property for DAE control
problems.

The slides are available at [`janheiland.de/20-talk-turnpike-dae`](http://janheiland.de/20-talk-turnpike-dae/).

[^1]: Callier, F. M.; Winkin, J. & Willems, J. L. *Convergence of the time-invariant Riccati differential equation and LQ-problem: mechanisms of attraction.* International Journal of Control, Taylor & Francis, 1994, 59, 983-1000
