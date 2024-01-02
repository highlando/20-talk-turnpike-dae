### Old Results

Consider, for $t_1>0$,
$$\int_{0}^{t_1} \|Cx(s)-y_c\|^2+ \|u(s)\|^2\inva s + \|F x(t_1)-y_e\|^2
  \to \min$$ subject to $$\dot x(t) = Ax(t) + Bu(t), \quad x(0)=x_0.$$

Let $(A,B)$ be stabilizable and let $$A^*X+XA-XBB^*X+C^*C=0 \tag{ARE}$$
have a unique stabilizing solution $\PP$. Then:

-   If $P(t) \to \PP$ as $t_1\to \infty$, then, for some $\lambda>0$,
    $$\|x(t) - \mxp{t(A-BB^*\PP)}x_0\| \leq C\mxp{-(t_1-t)\lambda}.$$

-   The solution to the differential Riccati equation $P$ converges to
    $\PP$ as $t_1\to \infty$ **if, and only if**, the nullspace of
    $F^*F$ and the undetectable subspace of $(C,A)$ have no
    intersection.

### Numerical Example

-   System $$\begin{split}
        A &= 
        \begin{bmatrix}
          2 & 0 \\ 0 & -1 
        \end{bmatrix}\\
        B &= 
        \begin{bmatrix}
          1 \\ 1 
        \end{bmatrix}\\
        C &= 
        \begin{bmatrix}
          0 & 2 
        \end{bmatrix}
      \end{split}$$

-   Not detectable but

-   (ARE) has a stabilizing solution.

-   Simulations with $$\begin{split}
        x_0=
        \begin{bmatrix}
          1 \\ 1 
        \end{bmatrix}, \\y_c=0, \quad y_e=1.
      \end{split}$$

### New Formulas for $y_e$ and $y_c$ not zero

Main tool: an explicit formula[^1] for $U$ that solves
$$\dot U(t) = (A-BB^*P(t))U(t), \quad U(t_1)=I,$$ and that defines the
state transition like $$\begin{aligned}
  x(t) &= U(t)U(t_0)^{-1}x_0 + \int_0^t U(t)U(s)^{-1}w(s)\inva s,\end{aligned}$$
where $w$ is the feedforward (the affine) part that satisfies
$$-\dot w(t) = (A^*-P(t)BB^*)w(t), \quad w(t_1)=-F^*y_e,$$ or
$$w(t):=-U(t)^{-*}U(t_1)^*F^*y_e + \int_{t_1}^tU(t)^{-*}U(s)^*C^*y_c.$$

### New Formulas for $y_e$ and $y_c$ not zero

With this $U$, we find that $$\begin{aligned}
  x(t) &= U(t)U(t_0)^{-1}x_0 + \int_0^T U(t)U(s)^{-1}w(s)\inva s \\
       &= \quad \quad ...\\
       &= U(t)U(t_0)^{-1}x_0 + \AP^{-1}BB^*\AP^{-*}C^*y_c + G(t,t_1),\end{aligned}$$

-   where $U(t)U(t_0)^{-1}x_0$ is the solution to the problem with
    $y_c$, $y_e=0$,

-   where
    $$\AP^{-1}BB^*\AP^{-*}C^*y_c = (A-BB^*\PP)^{-1}BB^*(A-BB^*\PP)^{-*}C^*y_c$$
    is the steady state optimal solution,

-   and where, for some constant $M$ independent of $t_1$,
    $$\|G(t,t_1)\| \leq
        M\mxp{-(t_1-t)\lambda}+M\mxp{-(t_1-t)2\lambda}+M\mxp{-(t_1-t)3\lambda} .$$

### Next steps and discussion

-   The transition maps also cover the time-dependent case...

-   Transition maps (and turnpike) for LQR Problems with DAE constraints
    $$E \dot x = Ax + Bu, \quad Ex(0)=Ex_0.$$

    -   $E$ is nonsingular $\leftarrow$ singular control.

    -   Nonsymmetric Riccati equations.

-   Transition maps (and turnpike) for $\infty$-dimensional systems.

### References

Behr, M.; Benner, P. & Heiland, J. *Invariant Galerkin Ansatz Spaces and
Davison-Maki Methods for the Numerical Solution of differential Riccati
Equations* arXiv e-prints, 2019, arXiv:1910.13362

Callier, F. M.; Winkin, J. & Willems, J. L. *Convergence of the
time-invariant Riccati differential equation and LQ-problem: mechanisms
of attraction* International Journal of Control, 1994, 59, 983-1000

THANK YOU FOR YOUR ATTENTION!

[^1]: Not unknown before, but explicitly derived in
    Behr/Benner/Heiland’19
