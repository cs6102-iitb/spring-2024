<center>
  <h1>Karatsuba Multiplier</h1>
</center>

---

**Problem Statement:** Design and simulate a 16-bit Karatsuba Multiplier.

---

**What is Karatsuba Multiplier?**

<div align="justify">
It is a purely combinational circuit that computes product of two numbers using Karatsuba algorithm. This is a divide-and-conquer algorithm that reduces the multiplication of two <code>n</code>-digit numbers to three multiplications of <code>n/2</code>-digit numbers.</div>

It performs a repeated or recursive reduction to single-digit multiplications.

Lets understand this algorithm before we start designing its datapath.

Let `x` and `y` be two `n`-digit strings in some base `B`. We can re-write these numbers as follow:

$$x = x_1B^m + x_0,$$
$$y = y_1B^m + y_0,$$

where *x<sub>0</sub>* and *y<sub>0</sub>* are less than *B<sup>m</sup>*. The product is then

$$
\begin{align*}
xy &= (x_1B^m + x_0)(y_1B^m + y_0)\newline
&= x_1y_1B^{2m} + (x_1y_0 + x_0y_1)B^m + x_0y_0\newline
&= t_2B^{2m} + t_1B^m + t_0
\end{align*}
$$

where

$$
\begin{align*}
t_2 &= x_1y_1\newline
t_1 &= x_1y_0 + x_0y_1\newline
t_0 &= x_0y_0
\end{align*}
$$

Now this formulae requires four multiplications.

> As we know multiplier is one of the heavily compute operation in digital logic design. Reducing these operations even by one will improve your circuit's performance and will consume less area.

Karatsuba observed that *xy* can be computed iBn only three multiplications, at the cost of few extra additions. With *t<sub>2</sub>* and *t<sub>0</sub>* as before and *t<sub>3</sub>* = (*x<sub>1</sub>* + *x<sub>0</sub>*) (*y<sub>1</sub>* + *y<sub>0</sub>*), one can observe that

$$
\begin{align*}
t_1 &= x_1y_0 + x_0y_1\newline
&= (x_1 + x_0)(y_1 + y_0) - x_1y_1 - x_0y_0\newline
&= t_3 - t_2 - t_0
\end{align*}
$$

Thus, only three multiplications are required for computing *t<sub>2</sub>*, *t<sub>1</sub>* and *t<sub>0</sub>*.

## Datapath design of Karatsuba multiplier

1. Now we can draw our datapath based on the above equations. We will require the following components:
    - 3 multiplier blocks
    - few adders/subtractors
    - few logical shift blocks to compute final product

2. The datapath design will look like this.

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/karatsuba_mult/datapath_design_karatsuba_mult.png">
    </div>


## Implementing a 16-bit recursive Karatsuba multiplier

1. Download the Verilog design, `combinational_karatsuba.v` from [here](../downloadables/resources/digital_circuits/karatsuba_multiplier/combinational_karatsuba.v).

    You will observe that this is a **recursive** design, meaning the 16-bit multiplier instantiates the 8-bit multiplier, which in turn instantiates a 4-bit multiplier and a 4-bit multiplier instantiates a 2-bit multiplier.

2. Download the testbench design, `tb_combinational_karatsuba.v` from [here](../downloadables/resources/digital_circuits/karatsuba_multiplier/tb_combinational_karatsuba.v).

3. Compile the code and check for any syntax errors using the below command.
    ```bash
    iverilog combinational_karatsuba.v tb_combinational_karatsuba.v -o combinational_karatsuba
    ```

4. If there are no errors, use the below command for running the simulation.
    ```bash
    vvp combinational_karatsuba
    ```
    You will see the values of signals being monitored across each clocktick.

5. If all looks well, use the below command for viewing the waveform. Add the signals from `tb_combinational_karatsuba` design to the window to view the simulation output as shown in below image.
    ```bash
    gtkwave combinational_karatsuba.vcd
    ```

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/karatsuba_mult/karatsuba_mult_sim_output.png">
    </div>


---
