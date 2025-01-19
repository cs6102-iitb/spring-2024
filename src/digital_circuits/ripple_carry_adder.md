<center>
  <h1>Ripple Carry Adder</h1>
</center>

---

**Problem Statement:** Design and simulate a four-bit Ripple Carry Adder (RCA).

---

**What is Ripple Carry Adder?**

<div align="justify">
A four-bit ripple carry adder is a basic digital circuit that performs binary addition for two four-bit numbers. It's constructed by cascading four full-adders in a way that the carry-out from the first full-adder serves as the carry-in for the second full-adder and so on.</div><br/>

**How can we use our full adder to build RCA?**

<div align="justify">Multiple full adder circuits can be cascaded in parallel to add an N-bit number. For an N-bit parallel adder, there must be N number of full adder circuits.</div>

<br>
<div align="center">
  <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/ripple_carry_adder/nbit_rca_block_diag.png" width = 80%>
</div>
<br>

## Implementing a 4-bit ripple carry adder

1. Create a new Verilog file named `adder_4bit.v`, and copy-paste the below structural design of 4-bit ripple carry adder.

    <center>
      <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%252F%252F%25204-bit%2520ripple%2520carry%2520adder%250Amodule%2520adder_4bit%2520%28a%252C%2520b%252C%2520cin%252C%2520s%252C%2520cout%29%253B%250Ainput%2520%255B3%253A0%255D%2520a%252C%2520b%253B%2520input%2520cin%253B%250Aoutput%2520%255B3%253A0%255D%2520s%253B%2520output%2520cout%253B%250A%250Awire%2520c1%252C%2520c2%252C%2520c3%253B%250A%250Afull_adder%2520fa1%2520%28.a%28a%255B0%255D%29%252C%2520.b%28b%255B0%255D%29%252C%2520.cin%28cin%29%252C%2520.s%28s%255B0%255D%29%252C%2520.cout%28c1%29%29%253B%250Afull_adder%2520fa2%2520%28.a%28a%255B1%255D%29%252C%2520.b%28b%255B1%255D%29%252C%2520.cin%28c1%29%252C%2520.s%28s%255B1%255D%29%252C%2520.cout%28c2%29%29%253B%250Afull_adder%2520fa3%2520%28.a%28a%255B2%255D%29%252C%2520.b%28b%255B2%255D%29%252C%2520.cin%28c2%29%252C%2520.s%28s%255B2%255D%29%252C%2520.cout%28c3%29%29%253B%250Afull_adder%2520fa4%2520%28.a%28a%255B3%255D%29%252C%2520.b%28b%255B3%255D%29%252C%2520.cin%28c3%29%252C%2520.s%28s%255B3%255D%29%252C%2520.cout%28cout%29%29%253B%250A%250Aendmodule%250A%250A%252F%252F%2520full%2520adder%250Amodule%2520full_adder%2520%28a%252C%2520b%252C%2520cin%252C%2520s%252C%2520cout%29%253B%250Ainput%2520a%252C%2520b%252C%2520cin%253B%250Aoutput%2520s%252C%2520cout%253B%250A%250Aassign%2520s%2520%253D%2520a%2520%255E%2520b%2520%255E%2520cin%253B%250Aassign%2520cout%2520%253D%2520%28a%2520%2526%2520b%29%2520%252B%2520%28b%2520%2526%2520cin%29%2520%252B%2520%28a%2520%2526%2520cin%29%253B%250A%250Aendmodule"
        style="width: 770px; height: 480px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
      </iframe>
    </center>

2. Create a new Verilog file and type the below testbench code provided below. Save the file with the same name as the module name.

    <center>
    <iframe
      src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%2560timescale%25201ns%252F1ps%250Amodule%2520tb_adder_4bit%253B%250A%250Areg%2520clk%253B%250Areg%2520rst%253B%250A%250Areg%2520%255B3%253A0%255D%2520A%253B%250Areg%2520%255B3%253A0%255D%2520B%253B%250Areg%2520Cin%253B%250Awire%2520%255B3%253A0%255D%2520S%253B%250Awire%2520Cout%253B%250A%250Ainitial%2520begin%250A%2520%2520%2524display%2520%28%2522time%255Ct%252C%2520clk%255Ct%252C%2520rst%255Ct%252C%2520A%255Ct%252C%2520B%255Ct%252C%2520Cin%255Ct%252C%2520S%255Ct%252C%2520Cout%2522%29%253B%250A%2520%2520%2524monitor%2520%28%2522%2525g%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525d%255Ct%2520%2525d%255Ct%2520%2525b%255Ct%2520%2525d%255Ct%2520%2525b%255Ct%2522%252C%250A%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2524time%252C%2520clk%252C%2520rst%252C%2520A%252C%2520B%252C%2520Cin%252C%2520S%252C%2520Cout%29%253B%250A%250A%2520%2520clk%2520%253D%25201%253B%250A%2520%2520rst%2520%253D%25200%253B%250A%2520%2520%252310%2520rst%2520%253D%25201%253B%250A%2520%2520%252310%2520rst%2520%253D%25200%253B%250A%250A%2520%2520%252310%2520A%2520%253D%252015%253B%250A%2520%2520%252310%2520B%2520%253D%252015%253B%250A%2520%2520Cin%2520%253D%25200%253B%250A%2520%2520%252310%2520A%2520%253D%252014%253B%250A%2520%2520%252310%2520B%2520%253D%252014%253B%250A%250A%2520%2520%252320%253B%250A%2520%2520%25235%2520%2524finish%253B%250Aend%250A%250Aalways%2520begin%250A%2520%2520%25235%2520clk%2520%253D%2520%7Eclk%253B%250Aend%250A%250Aadder_4bit%2520dut%2520%28.a%28A%29%252C%2520.b%28B%29%252C%2520.cin%28Cin%29%252C%2520.s%28S%29%252C%2520.cout%28Cout%29%29%253B%250A%250Ainitial%2520begin%250A%2520%2520%2524dumpfile%2520%28%2522adder_4bit.vcd%2522%29%253B%250A%2520%2520%2524dumpvars%2520%281%252C%2520tb_adder_4bit%29%253B%250Aend%250A%250Aendmodule"
      style="width: 769px; height: 876px; border:0; transform: scale(1); overflow:hidden;"
      sandbox="allow-scripts allow-same-origin">
    </iframe>
    </center>

3. Compile the code and check for any syntax errors using the below command.
    ```bash
    iverilog adder_4bit.v tb_adder_4bit.v -o adder_4bit
    ```

4. If there are no errors, use the below command for running the simulation.
    ```bash
    vvp adder_4bit
    ```
    You will see the values of signals being monitored across each clocktick.

5. If all looks well, use the below command for viewing the waveform. Add the signals from `tb_adder_4bit` design to the window to view the simulation output as shown in below image.
    ```bash
    gtkwave adder_4bit.vcd
    ```

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/ripple_carry_adder/adder_4bit_sim_output.png">
    </div>

---
