---
title: Turnpike and Linear Systems Theory
author: 
- Jan Heiland
date: CSC Seminar -- 7 April 2020 
# institute: GAMM-CSE Workshop G&uuml;zburg, 2019
bibliography: 
- example.bib
---

# Introduction

## {data-background-image="optistatenolog.svg"}

. . .

What is turnpike?


## The Finite Time LQR Problem
$$
\DeclareMathOperator{\inva}{d}
\newcommand\mxp[1]{e^{\{#1\}}}
$$

For $t_1>0$, 
$$\frac 12 \int_{0}^{t_1} \|Cx(s)-y_c\|^2+ \|u(s)\|^2 \inva{s} + \frac 12 \|F x(t_1)-y_e\|^2 \to \min_u$$
subject to $$\dot x(t) = Ax(t) + Bu(t), \quad x(0)=x_0.$$

## The Solution

Without conditions on $A$, $B$, $C$, $F$, the finite time problem is solved[^1] by

$$
\dot x = (A-BB^ * P(t))x - BB^ * w(t), \quad x(0)=x_0,
$$

. . .

where $P$ solves the differential Riccati equation
$$
-\dot P = A^ * P + PA -PBB^ * P+C^ * C, \quad P(t _ 1)=F^ * F
$$
and feedforward $w$ solves
$$
-\dot w = (A^ * -P(t)BB^ * )w + C^ * y _ c, \quad w(t _ 1)=-F^ * y _ e.
$$

[^1]: see, e.g., Locatelli

## Theorem: Callier&Willems&Winkin'93

> Let there exist a unique stabilizing solution $P _ +$ to $$A^ * X+XA-XBB^ * X+C^ * C=0 .$$

 * If $P(t) \to P _ +$ as $t_1\to \infty$, then, for some $\sigma>0$, 
  $$\|x _ h(t) - \mxp{t(A-BB^ * P _ +)}x_0\| \leq Ce^{\{-(t_1-t)\sigma \}},$$
  where $x _ h$ is the solution with $y _ e$, $y _ c=0$.

 * The solution to the differential Riccati equation $P$ converges to $P _ +$
  as $t_1\to \infty$ **if, and only if**, the nullspace of $F^ * F$ and the
  undetectable subspace of $(C,A)$ have no intersection.
   
## What is a Benchmark

> Basically, everything that would motivate a fellow researchers to use the
provided setup and data to *benchmark* their code.


## Fluid Structure Interaction

![Example of a cylinder with a tail](pics/fsi2.gif)

 * Changing domain.
 * Coupling of Models (and scales).


# The model

## Verbose

 * A fluid flows through a channel with a sphere that can rotate freely.
 * The stresses at the sphere/fluid interface induce rotation.
 * The *no-slip* condition induces motion of the flow at the interface.

---


### The flow

\begin{equation*}
		\rho_f\left(\partial_t v + (v \cdot\nabla)v \right) - \nabla \cdot \sigma(v ,p) = 0, \quad \nabla\cdot v  = 0,
\end{equation*}
with the stress-tensor
\begin{equation*}
	\sigma (v,p) = \rho _ f\nu\left( \nabla v+\nabla v^T \right) - p I
\end{equation*} 
and with standard boundary conditions and in particular
\begin{equation*}
    v = v_s, \quad \text{on } \mathcal I,
\end{equation*}
where $v_s$ is the solid's velocity at the fluid-solid interface.


# Implementation

## Code Base

There were 5 independent implementations using established libraries:

 * [Netgen/NGSolve](https://ngsolve.org/)
 * [FEniCS/dolfin](https://fenicsproject.org/download/)
 * Gascoigne
 * [SciPy](https://www.scipy.org)


## Code Availability

Full data sets for the results as well as all implementations can be found at

> [DOI: 10.5281/zenodo.3253455](https://doi.org/10.5281/zenodo.3253455)

# Conclusion

## References

---
nocite: |
    @WahRLHM19
...
