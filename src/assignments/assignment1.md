
<center>
    <h1>Assignment 1</h1>
</center>

---

## Problem Statement

Implement in Verilog the datapath design of the lightweight block cipher, called PRESENT, a symmetric key encryption technique.

## Given

The plaintext and ciphertext will be of 64 bits or 8 bytes in size and the encryption key length is 80 bits or 10 bytes.

Below is the high-level block diagram of the PRESENT cipher encryption algorithm.

<div align="center">
  <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/master/cs6102_spring2024-25/assignment1/present_cipher_block_diag.png">
</div>
<br>

> **IMPORTANT:** Kindly read the document at this [link](https://docs.google.com/document/d/1mSn4DSswocpQWICLW3UECwfau9wv4tnNMKFrlwPCODQ/edit?usp=sharing) to create a private repository for the assignment. Do not push everything at the last moment. Maintain a proper commit history.

---

## Part A (Deadline: Jan 25, 2025 11:59 PM)

In this part, you will implement the **SBox** or **Substitution Box** design. SBox is a bijection from 4-bits to 4-bits.

The Boolean equation for this design is as follows:

$$y_1 = x_1x_2x_4 \oplus x_1x_3x_4 \oplus x_1 \oplus x_2x_3x_4 \oplus x_2x_3 \oplus x_3 \oplus x_4 \oplus 1$$
$$y_2 = x_1x_2x_4 \oplus x_1x_3x_4 \oplus x_1x_3 \oplus x_1x_4 \oplus x_1 \oplus x_2 \oplus x_3x_4 \oplus 1$$
$$y_3 = x_1x_2x_4 \oplus x_1x_2 \oplus x_1x_3x_4 \oplus x_1x_3 \oplus x_1 \oplus x_2x_3x_4 \oplus x_3$$
$$y_4 = x_1 \oplus x_2x_3 \oplus x_2 \oplus x_4$$

The truth table for this design is as follows:

|  $$x$$     |   0  |   1  |   2  |   3  |   4  |   5  |   6  |   7  |   8  |   9  |   A  |   B  |   C  |   D  |   E  |   F  |
| :--------: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|  $$S[x]$$  |   C  |   5  |   6  |   B  |   9  |   0  |   A  |   D  |   3  |   E  |   F  |   8  |   4  |   7  |   1  |   2  |


You can either use a high level concurrency construct or you can use continuous assignments.

The template code provided to you in file `sbox.v` is as below.

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520sbox%2520%28inp%252C%2520outp%29%253B%250A%250Ainput%2520%255B3%253A0%255D%2520inp%253B%250Aoutput%2520%255B3%253A0%255D%2520outp%253B%250A%250Areg%2520%255B3%253A0%255D%2520outp%253B%250A%250A%252F%252F%2520implement%2520the%2520SBox%2520design%2520based%2520on%2520the%2520Boolean%2520equations%2520provided%250A%252F%252F%2520use%2520the%2520modelling%2520style%2520of%2520your%2520choice%250A%250A%250Aendmodule%250A"
        style="width: 769px; height: 290px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>

After completing the design, write the testbench in the provided file `tb_sbox.v`. Stimulate the input signal of `sbox` design with all possible input values.

Once completed, ensure the correctness by simulating the design. Use the below commands.

```sh
iverilog sbox.v tb_sbox.v -o sbox
vvp sbox
gtkwave sbox_dump.vcd
```

The expected timing diagram is shown below.

<div align="center">
  <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/master/cs6102_spring2024-25/assignment1/parta_sbox_sim_output.png">
</div>
<br>

---

## Part B (Deadline: Feb 01, 2025 11:59 PM)

In this part, you will implement the datapath design of the PRESENT cipher. The datapath will be constructed from `keyschedule`, `permutation` and `sbox` modules as we can see from the block diagram above.

Open the `present_cipher.v` file and carry on reading further.

The top module `present_cipher` which implements the design with separate datapath and controller consists of the below interface signals.

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=input%2520clk%252C%2520rst%253B%250Ainput%2520%255B63%253A0%255D%2520plaintext%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%252064-bit%2520plaintext%250Ainput%2520%255B79%253A0%255D%2520key%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%252080-bit%2520encryption%2520key%250Ainput%2520en%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520enable%2520signal%2520for%2520controller%250Ainput%2520prdy%252C%2520krdy%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520plaintext%2520and%2520key%2520ready%2520or%2520available%250Aoutput%2520start%252C%2520done%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520control%2520signals%250Aoutput%2520%255B63%253A0%255D%2520ciphertext%253B%2520%2520%2520%2520%2520%2520%2520%252F%252F%252064-bit%2520ciphertext%250A"
        style="width: 770px; height: 201px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>

The controller design is implemented in the `present_cipher.v` file. You have to implement the datapath design based on the block diagram shown above.

The signals of interest for the datapath design are `round_counter`, `pstate` and `kstate`. The signals which will be driven by the datapath and necessary for controller are `pstate_nxt`, `kstate_nxt` and `nxt_rkey`.

<center>
    <iframe
    src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%252F%252F%2520controller%2520signals%250Areg%2520%255B4%253A0%255D%2520round_counter%253B%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520counter%2520for%2520encryption%2520round%250Areg%2520%255B63%253A0%255D%2520pstate%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520plaintext%2520state%2520reg%250Areg%2520%255B79%253A0%255D%2520kstate%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520round%2520key%2520state%2520reg%250A%250A%252F%252F%2520datapath%2520signals%250Awire%2520%255B63%253A0%255D%2520pstate_nxt%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520next%2520state%2520for%2520plaintext%250Awire%2520%255B79%253A0%255D%2520kstate_nxt%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520next%2520state%2520for%2520key%2520update%250Awire%2520%255B63%253A0%255D%2520rkey_out%253B%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%252F%252F%2520next%2520round%2520key%250A"
    style="width: 772px; height: 238px; border:0; transform: scale(1); overflow:hidden;"
    sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>

Three modules are defined in the `present_cipher.v` file, namely
- `present_datapath` : Datapath design for PRESENT cipher
- `present_keyschedule`: Key Schedule design
- `perm`: PLayer or bit-permutation design

Have a look at the provided comments in the respective modules and implement the respective designs.

Copy the `sbox.v` file from the `part-a` to `part-b` directory, so that the datapath design can use it.

> **NOTE:** DO NOT make any changes to the top module named `present_cipher`.

> **IMPORTANT:** We recommend you to write individual testbench for checking the correctness of your `present_keyschedule` and `perm` modules. Its a good practice to verify each module before using them with other modules. <br>This is an *optional* step but we highly recommend it.

For ensuring the correctness of your datapath design, we have provided the testbench file `tb_present_cipher.v`. DO NOT make any changes to this testbench.

Use the below commands to simulate your design.

```sh
iverilog present_cipher.v sbox.v tb_present_cipher.v -o present
vvp present
gtkwave present_dump.vcd
```

You shall see the below timing diagram in GTKwave.

<div align="center">
  <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/master/cs6102_spring2024-25/assignment1/partb_present_cipher_sim_output.png">
</div>
<br>

> **NOTE:** In the provided testbench, the `plaintext = 64'hffffffffffffffff` and `key = 80'h10000000000000000000`. Hence the corresponding output for `ciphertext = 64'had7d5befea5c6dea`.

We are providing a C implementation of the PRESENT cipher design in `present_cipher.c` file. Compile the file and provide the plaintext and key input in the hexadecimal format to see the corresponding ciphertext output.

<div align="center">
  <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/master/cs6102_spring2024-25/assignment1/partb_present_cipher_c_output.png">
</div>
<br>

You can then use the respective combination of plaintext and key in the testbench to ensure whether your datapath design is able to produce correct ciphertext.

---

## Submission

### Part A

Rename the `part-a` directory to `<team-name>_a1_parta`. The directory MUST contain these files:
- `sbox.v`
- `tb_sbox.v`

Compress this directory into a `tar.gz` file using the command:

```sh
tar -czvf <team-name>_a1_parta.tar.gz <team-name>_a1_parta
```

Upload this `<team-name>_a1_parta.tar.gz` on the Moodle at the **respective link for Part A**.

### Part B

Rename the `part-b` directory to `<team-name>_a1_partb`. The directory MUST contain these files:
- `present_cipher.v`
- `sbox.v`

Compress this directory into a `tar.gz` file using the command:

```sh
tar -czvf <team-name>_a1_partb.tar.gz <team-name>_a1_partb
```

Upload this `<team-name>_a1_partb.tar.gz` on the Moodle at the **respective link for Part B**.

> **IMPORTANT:** Apart from updating your team's private GitHub repository for this assignment, you also need to upload your submission on Moodle.

---

<br>
<center>
  Best Wishes! 😊
</center>
<br>

---
