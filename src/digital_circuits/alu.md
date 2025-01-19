<center>
    <h1>8-bit Arithmetic Logic Unit</h1>
</center>

---

**Problem Statement:** Design and simulate a 8-bit ALU.

---

### Introduction to ALU

<div align="justify">An arithmetic logic unit (ALU) is a digital circuit used to perform arithmetic and logic operations. It represents the fundamental building block of the central processing unit (CPU) of a computer. Modern CPUs contain very powerful and complex ALUs. In addition to ALUs, modern CPUs contain a control unit (CU).</div><br />

<div align="justify">Most of the operations of a CPU are performed by one or more ALUs, which load data from input registers. A register is a small amount of storage available as part of a CPU. The control unit tells the ALU what operation to perform on that data, and the ALU stores the result in an output register. The control unit moves the data between these registers, the ALU, and memory.</div><br />

<div align="center">
  <img width="400" height="400"
  src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/alu/alu_block_diag.png">
</div>
<!-- <div align="center">Figure 1: Block Diagram of 8bit ALU</div><br /> -->

<div align="justify">Here, we will design an 8-bit ALU which performs different set of arithmetic and logical operations based on the select input <b>s</b>.</div>



### Implementation Table of 8-bit ALU

<div align="justify">The below table indicates the Arithmetic and Logical operations performed based on the select input <b>s</b> and also the output <b>y</b> obtained for for the given set of input <b>a</b> and <b>b</b>. This ALU is designed using arithmetic and logical operations mentioned in the table below.</div><br />

<div align="center">

| Arithmetic Operations |     Logical Operations     |
|:---------------------:|:--------------------------:|
|        Addition       |     Bitwise AND & NAND     |
|      Subtraction      |      Bitwise OR & NOR      |
|     Multiplication    |     Bitwise NOR & XNOR     |
|        Division       |  Shift Right & Shift Left  |
|       Increment       | Rotate Right & Rotate Left |
|       Decrement       |                            |

</div><br />

<div align="center"><b>Table 1: Implementation Table of 8-bit ALU</b></div>
<div align="center">

| s		| operation      | a		  | b		   | y		              | carry| zero|
| ------| ---------------| -----------| -----------| ---------------------| -----| ----|
| 0000  | Addition       | 11101110   | 11101110   |  00000000 11011100   | 1    | 0   |
| 0001  | Subtraction    | 11101110   | 11101110   |  00000000 00000000   | 0	 | 1   |
| 0010  | Increment      | 11101110   | 11101110   |  00000000 11101111   | 0	 | 0   |
| 0011  | Decrement      | 11101110   | 11101110   |  00000000 11101101   | 0    | 0   |
| 0100  | Multiplication | 11101110   | 11101110   |  11011101 01000100   | 0    | 0   |
| 0101  | Division       | 11101110   | 11101110   |  00000000 00000001   | 0    | 0   |
| 0110  | Bitwise AND    | 11101110   | 11101110   |  00000000 11101110   | 0    | 0   |
| 0111  | Bitwise OR     | 11101110   | 11101110   |  00000000 11101110   | 0    | 0   |
| 1000  | Bitwise XOR    | 11101110   | 11101110   |  00000000 00000000   | 0    | 1   |
| 1001  | Bitwise NAND   | 11101110   | 11101110   |  00000000 00010001   | 0    | 0   |
| 1010  | Bitwise NOR    | 11101110   | 11101110   |  00000000 00010001   | 0    | 0   |
| 1011  | Bitwise XNOR   | 11101110   | 11101110   |  00000000 11111111   | 0    | 0   |
| 1100  | Shift Left     | 11101110   | 11101110   |  00000000 11011100   | 1    | 0   |
| 1101  | Shift Right    | 11101110   | 11101110   |  00000000 01110111   | 0    | 0   |
| 1110  | Rotate Right   | 11101110   | 11101110   |  00000000 01110111   | 0    | 0   |
| 1111  | Rotate Left    | 11101110   | 11101110   |  00000000 11011101   | 0    | 0   |

</div><br/>

### Implementation of 8-bit ALU

To implement 8-bit ALU design, follow these steps.

1. Create a new Verilog file and start writing code for 8-bit ALU as given below and save the file. Keep the file name as **ALU**.
    <iframe
      src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%252F%252F%2520Verilog%2520design%2520for%2520a%25208-bit%2520ALU%250A%252F%252F%2520define%2520module%250Amodule%2520ALU%2520%28%250A%2520%2520%2509input%2520clk%252C%2520en%252C%2520%2520%2520%252F%252F%2520define%2520clock%2520and%2520enable%2520%28active%2520low%29%2520signal%250A%2520%2520%2520%2520input%2520%255B7%253A0%255D%2520a%252C%2520b%252C%250A%2520%2520%2509input%2520%255B3%253A0%255D%2520s%252C%2520%2520%2520%252F%252F%2520define%2520inputs%2520a%252C%2520b%2520and%2520select%2520line%2520input%2520s%250A%2520%2520%2509output%2520reg%2520%255B15%253A0%255D%2520y%252C%2520%252F%252F%2520define%252016%2520bit%2520ALU%2520output%250A%2520%2520%2520%2520output%2520reg%2520carry%2520%252C%2520zero%2520%252F%252F%2520define%2520flag%2520output%250A%29%253B%250A%250Areg%2520%255B7%253A0%255D%2520a_in%252C%2520b_in%253B%2520%252F%252F%2520local%2520registers%2520for%2520input%2520%27a%27%2520and%2520%27b%27%250A%250A%252F*%2520local%2520register%2520to%2520store%2520carry%2520bit%2520in%2520flags%2520%255B0%255D%2520%2526%250Azero%2520flag%2520bit%2520in%2520flags%2520%255B1%255D%2520*%252F%250Areg%2520%255B1%253A0%255D%2520flags%253B%250A%250Areg%2520%255B15%253A0%255D%2520out_y%253B%2520%252F%252F%2520local%2520register%2520to%2520store%252016%2520bit%2520output%2520%27y%27%250A%250Ainitial%2520begin%250A%2520%2520%2520%2520y%2520%253D%25200%253B%2520carry%2520%253D%25200%253B%2520zero%2520%253D%25200%253B%250Aend%250A%250A%252F%252F%2520datapath%2520design%250Aalways%2520%2540%28posedge%2520clk%252C%2520posedge%2520en%29%2520begin%250A%2520%2520%2520%2520%252F%252F%2520if%2520en%2520%253D%25201%252C%2520reset%2520all%2520outputs%250A%2520%2520%2520%2520if%2520%28en%29%2520begin%250A%2520%2520%2520%2520%2520%2520%2520%2520a_in%2520%253C%253D%25200%253B%2520b_in%2520%253C%253D%25200%253B%2520y%2520%253C%253D%25200%253B%250A%2520%2520%2520%2520%2520%2520%2520%2520carry%2520%253C%253D%25200%253B%2520zero%2520%253C%253D%25200%253B%250A%2520%2520%2520%2520end%250A%2520%2520%2520%2520else%2520begin%2520%252F%252F%2520if%2520en%2520%253D%25200%252C%2520latch%2520all%2520output%2520flip%2520flops%250A%2520%2520%2520%2520%2520%2520%2520%2520a_in%2520%253C%253D%2520a%253B%2520b_in%2520%253C%253D%2520b%253B%2520y%2520%253C%253D%2520out_y%253B%250A%2520%2520%2520%2520%2520%2520%2520%2520carry%2520%253C%253D%2520flags%2520%255B0%255D%253B%2520zero%2520%253C%253D%2520flags%2520%255B1%255D%253B%250A%2520%2520%2520%2520end%250Aend%250A%250A%252F%252F%2520controller%2520design%250Aalways%2520%2540%28a_in%252C%2520b_in%252C%2520s%29%2520begin%250A%2520%2520flags%2520%253D%25202%27b00%253B%250A%2520%2520case%2520%28s%29%250A%2520%2520%2520%25204%27d0%253A%2520begin%250A%2520%2520%2520%2520%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28%2520a_in%2520%252B%2520b_in%2520%29%257D%253B%2520%252F%252F%2520addition%250A%2520%2520%2520%2520%2520%2520flags%2520%255B0%255D%2520%253D%2520out_y%2520%255B8%255D%2520%253B%2520%252F%252F%2520carry%2520is%2520set%2520if%2520generated%250A%2520%2520%2520%2520end%250A%2520%2520%2520%25204%27d1%253A%2520begin%250A%2520%2520%2520%2520%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28%2520a_in%2520-%2520b_in%2520%29%257D%253B%2520%252F%252F%2520subtraction%250A%2520%2520%2520%2520%2520%2520flags%2520%255B0%255D%2520%253D%2520out_y%255B8%255D%2520%253B%2520%252F%252F%2520carry%2520is%2520set%2520if%2520borrow%2520is%2520taken%250A%2520%2520%2520%2520end%250A%2520%2520%2520%25204%27d2%253A%2520begin%250A%2520%2520%2520%2520%2520%2520out_y%2520%253D%2520%257B8%27d0%2520%252C%28a_in%2520%252B%25201%27b1%29%257D%253B%2520%252F%252F%2520increment%250A%2520%2520%2520%2520%2520%2520flags%2520%255B0%255D%2520%253D%2520out_y%255B8%255D%253B%2520%252F%252F%2520carry%2520is%2520set%2520if%2520generated%250A%2520%2520%2520%2520end%250A%2520%2520%2520%25204%27d3%253A%2520begin%250A%2520%2520%2520%2520%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28a_in%2520-%25201%27b1%29%257D%253B%2520%252F%252F%2520decrement%250A%2520%2520%2520%2520%2520%2520flags%255B0%255D%2520%253D%2520out_y%255B8%255D%253B%2520%252F%252F%2520carry%2520is%2520set%2520if%2520borrow%2520is%2520taken%250A%2520%2520%2520%2520end%250A%2520%2520%2520%25204%27d4%253A%2520%2520out_y%2520%253D%2520%28%2520a_in%2520*%2520b_in%2520%29%253B%2520%252F%252F%2520multiplication%250A%2520%2520%2520%25204%27d5%253A%2520%2520out_y%2520%253D%2520%28%2520a_in%2520%252F%2520b_in%2520%29%253B%2520%252F%252F%2520division%250A%2520%2520%2520%25204%27d6%253A%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28%2520a_in%2520%2526%2520b_in%2520%29%257D%253B%2520%252F%252F%2520bitwise%2520AND%250A%2520%2520%2520%25204%27d7%253A%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28%2520a_in%2520%257C%2520b_in%2520%29%257D%253B%2520%252F%252F%2520bitwise%2520OR%250A%2520%2520%2520%25204%27d8%253A%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28%2520a_in%2520%255E%2520b_in%2520%29%257D%253B%2520%252F%252F%2520bitwise%2520XOR%250A%2520%2520%2520%25204%27d9%253A%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%7E%28%2520a_in%2520%2526%2520b_in%2520%29%257D%253B%2520%252F%252F%2520bitwise%2520NAND%250A%2520%2520%2520%25204%27d10%253A%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%7E%28%2520a_in%2520%257C%2520b_in%2520%29%257D%253B%2520%252F%252F%2520bitwise%2520NOR%250A%2520%2520%2520%25204%27d11%253A%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%7E%28%2520a_in%2520%255E%2520b_in%2520%29%257D%253B%2520%252F%252F%2520bitwise%2520XNOR%250A%2520%2520%2520%25204%27d12%253A%2520begin%250A%2520%2520%2520%2520%2520%2520flags%255B0%255D%2520%253D%2520a_in%255B7%255D%253B%2520%252F%252F%2520update%2520carry%2520flag%250A%2520%2520%2520%2520%2520%2520out_y%2520%253D%2520%257B8%27d0%2520%252C%2520%28a_in%2520%253C%253C%25201%29%257D%253B%2520%252F%252F%2520shift%2520left%250A%2520%2520%2520%2520end%250A%2520%2520%2520%25204%27d13%253A%2520begin%250A%2520%2520%2520%2520%2520%2520flags%255B0%255D%2520%253D%2520a_in%255B0%255D%2520%253B%2520%252F%252F%2520update%2520carry%2520flag%250A%2520%2520%2520%2520%2520%2520out_y%2520%253D%2520%257B8%27d0%252C%2520%28a_in%2520%253E%253E%25201%29%257D%253B%2520%252F%252F%2520shift%2520right%250A%2520%2520%2520%2520end%250A%2520%2520%2520%25204%27d14%253A%2520out_y%2520%253D%2520%257B8%27d0%252C%2520a_in%2520%255B0%255D%252C%2520a_in%2520%255B7%253A1%255D%257D%253B%2520%252F%252F%2520right%2520rotate%250A%2520%2520%2520%25204%27d15%253A%2520out_y%2520%253D%2520%257B8%27d0%252C%2520a_in%2520%255B6%253A0%255D%252C%2520a_in%255B7%255D%257D%253B%2520%252F%252F%2520left%2520rotate%250A%2520%2520%2520%2520default%2520%253A%2520out_y%2520%253D%252016%27d0%253B%250A%2520%2520endcase%2520%252F%252F%2520end%2520of%2520case%2520structure%250A%2520%2520%250A%2520%2520if%28%21out_y%29%2520flags%255B1%255D%2520%253D%25201%253B%2520%252F%252F%2520set%2520zero%2520flag%2520if%2520output%2520is%2520zero%250Aend%250A%250Aendmodule%250A"
      style="width: 850px; height: 1560px; border:0; transform: scale(1); overflow:hidden;"
      sandbox="allow-scripts allow-same-origin">
    </iframe>

2. We will use testbench to verify the output of this design. Create a **new** Verilog file and type the testbench code provided below and **Save** the file with the same name as the module name.
    <iframe
      src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%252F%252F%2520Verilog%2520code%2520for%2520TestBench%2520of%25208-bit%2520ALU%250Amodule%2520tb_ALU%253B%2520%2520%252F%252F%2520define%2520module%250A%250Areg%2520%255B7%253A0%255D%2520a%252C%2520b%253B%2520%252F%252F%2520define%2520I%252FO%2520ports%250Areg%2520%255B3%253A0%255D%2520s%253B%250Areg%2520clk%252C%2520en%253B%250Awire%2520%255B15%253A0%255D%2520y%253B%250Awire%2520carry%252C%2520zero%253B%250A%250A%252F%252F%2520map%2520all%2520the%2520I%252FO%2520ports%2520with%2520dut%2520%28design%2520under%2520test%29%250AALU%2520uut%2520%28.a%28a%29%252C%2520.b%28b%29%252C%2520.s%28s%29%252C%2520.en%28en%29%252C%2520.clk%28clk%29%252C%250A%2520%2520%2520%2520%2520%2520%2520%2520.y%28y%29%252C%2520.carry%28carry%29%2520%252C.zero%2520%28zero%29%29%253B%250A%250A%252F%252F%2520initialize%2520input%2520pins%2520with%25200%250Ainitial%2520begin%250A%2520%2520%2520%2520a%2520%253D%25200%253B%2520b%2520%253D%25200%253B%2520s%2520%253D%25200%253B%2520en%2520%253D%25201%253B%2520clk%2520%253D%25200%253B%250Aend%250A%250Aalways%2520begin%2520%252F%252F%2520generate%2520a%2520clock%2520of%2520period%252010%2520units%250A%2520%2520%2520%2520clk%2520%253D%2520%7Eclk%253B%2520%25235%253B%250Aend%250A%250Ainitial%2520begin%250A%2520%2520%2520%2520%2524display%2520%28%2522time%255Ct%252C%2520clk%255Ct%252C%2520en%255Ct%252C%2520a%255Ct%252C%2520b%255Ct%252C%2520s%255Ct%252C%2520y%255Ct%252C%2520carry%255Ct%252C%2520zero%2522%29%253B%250A%2520%2520%2520%2520%2524monitor%2520%28%2522%2525g%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%2522%252C%2520%2524time%252C%250A%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2509clk%252C%2520en%252C%2520a%252C%2520b%252C%2520s%252C%2520y%252C%2520carry%252C%2520zero%29%253B%250A%2520%2520%2520%2520%252350%253B%250A%2520%2520%2520%2520a%2520%253D%25208%27b11101110%253B%2520%252F%252F%2520initialize%25208-bit%2520input%2520value%2520for%2520a%2520%2526%2520b%250A%2520%2520%2520%2520b%2520%253D%25208%27b11101110%253B%2520%252329%253B%250A%250A%2520%2520%2520%2520%252F%252F%2520initialize%2520%27s%27%2520value%2520to%2520perform%2520different%2520operations%250A%2520%2520%2520%2520s%2520%253D%25204%27b0001%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0010%253B%2520%252330%253B%250A%2520%2520%2520%2520en%2520%253D%25200%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0001%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0010%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0011%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0100%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0101%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0110%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b0111%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1000%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1001%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1010%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1011%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1100%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1101%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1110%253B%2520%252330%253B%250A%2520%2520%2520%2520s%2520%253D%25204%27b1111%253B%2520%252330%253B%250A%2520%2520%2520%2520%252310%253B%2520%2524finish%253B%250Aend%2520%252F%252F%2520end%2520of%2520initial%2520block%250A%250Ainitial%2520begin%250A%2520%2520%2520%2520%2524dumpfile%2520%28%2522alu.vcd%2522%29%253B%250A%2520%2520%2520%2520%2524dumpvars%2520%281%252C%2520tb_ALU%29%253B%250Aend%250A%250Aendmodule%2520%252F%252F%2520end%2520of%2520module%250A"
      style="width: 850px; height: 1148px; border:0; transform: scale(1); overflow:hidden;"
      sandbox="allow-scripts allow-same-origin">
    </iframe>

3. Compile the code and check for any syntax errors using the below command.
    ```bash
    iverilog ALU.v tb_ALU.v -o ALU
    ```

4. If there are no errors, use the below command for running the simulation.
    ```bash
    vvp ALU
    ```
    You will see the values of signals being monitored across each clocktick.

5. If all looks well, use the below command for viewing the waveform. Add the signals from `tb_ALU` design to the window to view the simulation output as shown in below image.
    ```bash
    gtkwave alu.vcd
    ```

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/alu/alu_sim_output.png">
    </div>
    <!-- <div align="center">Figure 2: Simulation Waveform</div><br /> -->

---
