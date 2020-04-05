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

## {data-background-image="pics/optistatenolog.svg"}

$$
\DeclareMathOperator{\inva}{d}
\newcommand\mxp[1]{e^{\{#1\}}}
\def\AP{A _ +}
\def\APs{A _ +^ * }
\def\APms{A _ +^{- * }}
\def\PP{P _ +}
$$

. . .

### What is turnpike?

Let $x$ solve an optimal control problem on a finite time horizon
$[0,t_1]$. Then the *turnpike* property holds, if there is an $x_s$ such
that <br>for $c$, $\lambda >0$ independent of $t_1$ and $0\leq t \leq t_1$,
$$ \| x(t) - x_s \| \leq c(\mxp{-t\lambda} + \mxp{-(t_1-t)\lambda}). $$


## The Finite Time LQR Problem

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
and the feedforward $w$ solves
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

# Explicit Formulas 

## For the affine LQR Problem

$$\frac 12 \int_{0}^{t_1} \|Cx(s)-y_c\|^2+ \|u(s)\|^2 \inva{s} + \frac 12 \|F x(t_1)-y_e\|^2 \to \min_u$$

with $y_e$, $y_c \neq 0$.

### Assumptions

 * the ARE has a unique stabilizing solution $P _ +$ 
 * $A _ + := A - BB^ * P _ +$.


## Lemma

  Let the ARE have a unique stabilizing solution $P _ +$ and let 
  Then the fundamental solution matrix $U$ to
  $$
    \dot U = (A-BB^*P)U, \quad U(t_1)=I,
  $$
  where $P$ solves the DRE with $P(t_1)=F^ * F$, is given as
  $$
    U(t) =
    \mxp{-(t_1-t)\AP}\bigl(I-[W-\mxp{(t_1-t)\AP}W\mxp{(t_1-t)\APs}](\PP-F^ * F)\bigr),
  $$
  where $W:=\int_0^\infty \mxp{sA _ +}BB^ * \mxp{sA _ +^ * }\inva s$.

$$\square$$

Proof: See, e.g., BBH19, proof of Theorem 3.4

## Lemma

  The feedforward $w$ that solves
    $$
    -\dot w = (A^ * -P(t)BB^ * )w + C^ * y _ c, \quad w(t _ 1)=-F^ * y _ e.
    $$
  is given as
  $$
  w(t) =-U(t)^{- * }U(t_1)^ * F^ * y _ e +
  \int_{t_1}^tU(t)^{-*}U(s)^*C^ * y _ c \inva s
  $$
  and can be expressed as
  $$
  w(t) = w_h(t) + \APms C^ * y _ c - \mxp{(t_1-t)\APs}C^ * y _ c + g(t, t_1),
  $$
  where $g$ collects all the remainder integral terms.

## Lemma 

The optimal state $x$ is given as
$$
  x(t) = U(t)U(0)^{-1}x_0 - \int_0^t U(t)U(s)^{-1}BB^ * w(s)\inva s
$$
and, with the help of the formulas for $w$ and $U(t)U(s)^{-1}$, it can be expressed as
$$
 x(t) = x_h(t) + \AP ^{-1} BB^ * \APms C^ * y_c + G(t, t_1),
$$
with a function $G$ that satisfies the estimate
$$
\|G(t,t_1) \leq c\mxp{-(t_1 - t)\sigma}.
$$

## Theorem

> Let the ARE have a unique stabilizing solution. <br>
> Then the affine finite time LQR problem enjoys the turnpike property, **if, and
only if**, the nullspace of $F^ * F$ and the undetectable subspace of $(C,A)$
have no intersection.

### Remark

 * *the* turnpike is $\AP ^{-1} BB^ * \APms C^ * y_c$, which is the solution to the
   steady state optimal control problem
   $$
   \frac 12 \|Cx - y _ c\|^2 + \frac 12 \|u\|^2 \to \min_u, \quad \text{subject to}\quad 0=Ax+Bu.
   $$

# Some Pictures

# Turnpike for DAEs

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
