---
title: Turnpike and Linear Systems Theory
author: 
- Jan Heiland (MPI Magdeburg)
date: CSC Seminar -- 7 April 2020 
bibliography: 
- tpr.bib
---

# Introduction

## {data-background-image="pics/optistatenolog.svg"}

$$
\DeclareMathOperator{\inva}{d}
\newcommand\mxp[1]{e^{\{#1\}}}
\def\AP{A _ +}
\def\bAP{\bar{A} _ +}
\def\APs{A _ +^ * }
\def\APms{A _ +^{- * }}
\def\bAPms{\bar{A} _ +^{- * }}
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

Without conditions on $A$, $B$, $C$, $F$, the finite time problem is solved by

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

 * The ARE has a unique stabilizing solution $P _ +$. 

 * $A _ + := A - BB^ * P _ +$.


## Lemma

  Let the ARE have a unique stabilizing solution $P _ +$.
  Then the fundamental solution matrix $U$ to
  $$
    \dot U(t) = (A-BB^*P(t))U(t), \quad U(t_1)=I,
  $$
  where $P$ solves the DRE with $P(t_1)=F^ * F$, is given as
  $$
    U(t) =
    \mxp{-(t_1-t)\AP}\bigl(I-[W-\mxp{(t_1-t)\AP}W\mxp{(t_1-t)\APs}](\PP-F^ * F)\bigr),
  $$
  where $W:=\int_0^\infty \mxp{sA _ +}BB^ * \mxp{sA _ +^ * }\inva s$.

$$\square$$

Proof: See, e.g., Behr&Benner&H'19, proof of Theorem 3.4.

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
\|G(t,t_1)\| \leq c\mxp{-(t_1 - t)\sigma}.
$$

## Theorem

> Let the ARE have a unique stabilizing solution. <br>
> Then the affine finite time LQR problem enjoys the turnpike property, **if, and
only if**, the nullspace of $F^ * F$ and the undetectable subspace of $(C,A)$
have no intersection.

### Remark

 * *The* turnpike is $\AP ^{-1} BB^ * \APms C^ * y_c$, which is the solution to the
   steady state optimal control problem
   $$
   \frac 12 \|Cx - y _ c\|^2 + \frac 12 \|u\|^2 \to \min_u, \quad \text{subject to}\quad 0=Ax+Bu.
   $$

# Some Pictures

## {data-background-image="pics/fiscallvals.svg"}

. . .

<div style="position: absolute; width: 60%; right: 0; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.9); color: #fff; padding: 20px; font-size: 40px; text-align: left;">

## Case 1

$$
    \begin{split}
    A &= 
    \begin{bmatrix}
      2 & 0 \\ 0 & -1 
    \end{bmatrix}\quad
    B = 
    \begin{bmatrix}
      1 \\ 1 
    \end{bmatrix}\\
    C &= 
    \begin{bmatrix}
      0 & 2 
    \end{bmatrix} \\
&\to\text{ not detectable,} \\
&\to\text{ $P _ +$ exists,}\\
    F &= C=
    \begin{bmatrix}
      0 & 2 
    \end{bmatrix}\\
    &\to\text{no turnpike!}
  \end{split}
$$

</div>

## {data-background-image="pics/allvals.svg"}

. . .

<div style="position: absolute; width: 60%; right: 0; box-shadow: 0 1px 4px rgba(0,0,0,0.5), 0 5px 25px rgba(0,0,0,0.2); background-color: rgba(0, 0, 0, 0.9); color: #fff; padding: 20px; font-size: 40px; text-align: left;">

## Case 2

$$
    \begin{split}
    A &= 
    \begin{bmatrix}
      2 & 0 \\ 0 & -1 
    \end{bmatrix}\quad
    B = 
    \begin{bmatrix}
      1 \\ 1 
    \end{bmatrix}\\
    C &= 
    \begin{bmatrix}
      0 & 2 
    \end{bmatrix} \\
&\to\text{ not detectable,} \\
&\to\text{ $P _ +$ exists,}\\
    F &\perp C =
    \begin{bmatrix}
      2 & 0 
    \end{bmatrix}\\
    &\to\text{turnpike!}
  \end{split}
$$

</div>

# Turnpike for DAEs


## The Finite Time LQR Problem

$$
\def\daE{\mathcal E}
\def\daA{\mathcal A}
\def\daF{\mathcal F}
\def\daC{\mathcal C}
\def\daB{\mathcal B}
\def\daP{\mathcal P}
\def\daPP{\mathcal P _ +}
\def\daPs{\mathcal P^ * }
\def\daPD{\mathcal P _ \Delta}
\def\daPDs{\mathcal P _ \Delta^ * }
\def\daAP{\mathcal A _ +}
\def\daAPs{\mathcal A _ +^ * }
\def\ao{A _ {11}}
\def\ato{A _ {21}}
\def\aot{A _ {12}}
\def\at{A _ {22}}
\def\atmo{A _ {22}^{-1}}
\def\atms{A _ {22}^{- * }}
\def\boo{B _ {11}}
\def\bto{B _ {21}}
\def\btos{B _ {21}}
\def\btt{B _ {22}}
\def\daPDii{\ensuremath{P _ {\Delta;1}}}
$$

For $t_1>0$, 
$$\frac 12 \int_{0}^{t_1} \|\daC x(s)-y_c\|^2+ \|u(s)\|^2 \inva{s} + \frac 12 \|\daF x(t_1)-y_e\|^2 \to \min_u$$
subject to $$\daE\dot x(t) = \daA x(t) + \daB u(t), \quad \daE x(0)=\daE x_0.$$

. . .

### Question

What is the associated steady state problem? Certainly not simply $0=\daA x + \daB u$.

## Assumptions

 * The matrix pair $(\daE, \daA)$ is regular, i.e., there exists an $s\in \mathbb
C$ such that $s\daE - \daA$ is invertible.

 * WLOG: the matrix $\daE = \begin{bmatrix} I & 0 \\ 0 & 0 \end{bmatrix}$ is in
   semi-explicit form.

 * The generalized algebraic Riccati equation
 $$ \daA^*X + X^*\daA - X^*\daB\daB^*X + \daC^*\daC = 0, \quad \daE^*X=X^ * \daE $$
 has a *stabilizing* solution $\daPP$.

## Assumptions ctd

 * Here, *stabilizing* means that with
$$\daA-\daB\daB^ * \daPP =:\daAP= \begin{bmatrix} \ao & \aot \\ \ato & \at
\end{bmatrix},$$

 * the pencil $(\daE, \daAP)$ is *finite dynamics stable* and *impulse free*,

which means (because of $\daE$ semi-explicit) that

 * $\at$ is invertible and 

 * $\ao-\aot \at ^{-1} \ato$ is *stable*.

## The Hamiltonian System

With $\daPP$ at hand we can consider the Hamiltonian system
$$
  \begin{bmatrix}
    \daE & 0 \\ 0 & \daE^*
  \end{bmatrix}
  \frac{d}{dt}
  \begin{bmatrix}
  V_{11} \\ V_{12} \\ \tilde V_{21} \\ \tilde V_{22}
  \end{bmatrix}(t)
  =
  \begin{bmatrix}
    \daAP & -\daB\daB^* \\ 0 & -\daAP^*
  \end{bmatrix}
  \begin{bmatrix}
  V_{11} \\ V_{12} \\ \tilde V_{21} \\ \tilde V_{22}
  \end{bmatrix}(t)
$$ 

 * plus initial and terminal conditions, 

 * with, e.g, $V _ {11}(t)\in \mathbb R^{d\times d}$, where $d$ is the rank of
$\daE$.

## Theorem

Under reasonable compatibility assumptions on $\daF$, the partial solution
$V _ {11}(t)$ is invertible, and with
$$
\daPD(t):=
\begin{bmatrix}
  \tilde V_{21}V_{11}^{-1} & 0 \\
  -A_{22}^{-*}A_{12}^ * \tilde V_{21}V_{11}^{-1} & 0
\end{bmatrix},
$$
the matrix function $\daP(t) := \daPP + \daPD(t)$ solves the generalized differential Riccati equation
$$
-\daE^*\dot \daP =  \daA^*\daP + \daP^*\daA - \daP^*\daB\daB^*\daP +
\daC^*\daC, \quad \daE^*\daP=\daP^*\daE.
$$

## Corollary
For $y _ e$, $y _ c=0$ and with 
$$x= \begin{bmatrix} x_1(t) \\ x_2(t) \end{bmatrix} \quad \text{and}\quad
\daB\daB^ *  = \begin{bmatrix} \boo & \bto^ *  \\ \bto & \btt \end{bmatrix}$$
partitioned in accordance with $\daE$, the optimal state reads 

$$
    \begin{bmatrix}
      x_1(t) \\ x_2(t)
    \end{bmatrix}=
    \begin{bmatrix}
      V_{11}(t)V_{11}(t_0)^{-1}x_1(t_0) \\
      A_{22}^{-1} A_{21}x_1(t) - 
      A_{22}^{-1} [B_{21}+B_{22}A_{22}^{-*}A_{12}^*]V_{21}(t)V_{11}(t)^{-1}x_1(t)
    \end{bmatrix}.
$$

and the *Callier/Willems/Winkin result* for $x_1$ is immediate.

## Proof 

 * The Hamiltonian system is j first order necessary condition.

 * Leaving aside the initial condtions, for any $k$ constant, 
    $$\begin{bmatrix}
      x_1(t) \\ x_2(t) \\ \tilde \lambda_1(t) \\ \tilde \lambda_2(t) 
    \end{bmatrix}
    = 
    \begin{bmatrix}
      V_{11}(t) \\ V_{12}(t) \\ \tilde V_{21}(t) \\ \tilde V_{22}(t) 
    \end{bmatrix} k$$
    defines a solution.

 * With the invertibility of $V _ {11}$, we can apply the initial condition:
 $$
 k = V _ {11}(t_0)^{-1}x_0.
 $$

---

 * By the DAE *stability*, we have that
 $$
    \begin{bmatrix}
      V_{12}(t) \\  \tilde V_{22}(t) 
    \end{bmatrix} 
    = 
    \begin{bmatrix}
      s_{11} & s_{12} \\ s_{21} & s_{22}
    \end{bmatrix}
    \begin{bmatrix}
      V_{11}(t) \\  \tilde V_{21}(t) 
    \end{bmatrix} .
 $$

 * Computing the entries $s_{11}$ and $s_{12}$, we obtain
 $$
    \begin{bmatrix}
      x_1(t) \\ x_2(t)
    \end{bmatrix}=
    \begin{bmatrix}
      V_{11}V_{11}(t_0)^{-1}x_1(t_0) \\
      A_{22}^{-1} A_{21}x_1 - 
      A_{22}^{-1} [B_{21}+B_{22}A_{22}^{-*}A_{12}^*]V_{21}V_{11}^{-1}x_1
    \end{bmatrix}.
$$

$$\square$$

## What is the DAE Turnpike then?

For a general $y _ c$, it turns out that
$$
x_1(t) \to \bAP ^{-1} \bar B\bar B^ * \bAPms \bar C^ * y_c 
\quad\text{as}\quad t_1 \to \infty,
$$
where
$$
  \bAP:= \ao-\aot\atmo\ato, \quad \bar B:=B_1-\aot\atmo B_2, \quad 
$$
$$
  \bar C:=C_1-C_2\atmo\ato.
$$

. . .

> The DAE turnpike is defined via the Schur complement of the closed-loop
> "index-1" system.

#  Conclusion

##

### Summary

 * Turnpike for a large class of LQR Problems can be derived from classical
   systems theory results

 * and also extends to DAEs.

### Outlook

 * A DAE example?

 * Formulation for infinite-dimensional systems.

 * Make use of higher convergence rates when treating nonlinear problems.

## Thank You!

 * For your attention.

 * And thanks to Enrique Zuazua and the [ERC DyCon Project](https://cmc.deusto.eus/dycon/) for the support.
  
## References

---
nocite: |
    @CalWW94
    @PorZ13
    @BehBH19a
...
