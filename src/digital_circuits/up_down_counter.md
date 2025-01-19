<center>
  <h1>Up Down Counter</h1>
</center>

---

**Problem Statement:** Design and simulate a four-bit Up Down Counter.

---

**What is Counter?**

<div align="justify">
A counter is a sequential circuit that keeps on counting specific event. It is used in digital electronics for counting purpose.<br>
The counter has a defined width <code>N</code>, which means that it can count maximum up to <code>2<sup>N</sup>-1</code> and then rolls back to <code>0</code>.

Here, we will design a 4-bit Up Down counter. Based on a control signal named `up_down`, the counter will either count `up` or `down` from the current state of the counter.
</div>

## Implementing a 4-bit up down counter

1. Create a new Verilog file named `up_down_counter.v`, and copy-paste the below design of 4-bit up down counter.

    <center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520up_down_counter%2520%28clk%252C%2520rst%252C%2520up_down%252C%2520out%29%253B%250A%250Ainput%2520clk%252C%2520rst%252C%2520up_down%253B%250Aoutput%2520%255B3%253A0%255D%2520out%253B%250A%250Areg%2520%255B3%253A0%255D%2520out%253B%250A%250Aalways%2520%2540%28posedge%2520clk%29%2520begin%250A%2520%2520if%2520%28rst%29%250A%2520%2520%2509out%2520%253C%253D%25204%27b0%253B%250A%2520%2520else%2520if%2520%28up_down%29%250A%2520%2520%2509out%2520%253C%253D%2520out%2520%252B%25201%27b1%253B%250A%2520%2520else%250A%2520%2520%2509out%2520%253C%253D%2520out%2520-%25201%27b1%253B%250Aend%250A%250Aendmodule"
        style="width: 460px; height: 369px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
    </center>

2. Create a new Verilog file and type the below testbench code provided below. Save the file with the same name as the module name.

    <center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%2560timescale%25201ns%252F1ps%250Amodule%2520tb_up_down_counter%253B%250A%250Areg%2520clk%252C%2520rst%252C%2520up_down%253B%250Awire%2520%255B3%253A0%255D%2520count%253B%250A%250Ainitial%2520begin%250A%2520%2520%2524display%2520%28%2522time%255Ct%252C%2520clk%255Ct%252C%2520rst%255Ct%252C%2520up_down%255Ct%252C%2520count%2522%29%253B%250A%2520%2520%2524monitor%2520%28%2522%2525g%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525b%255Ct%2520%2525d%2522%252C%2520%2524time%252C%2520clk%252C%2520rst%252C%2520up_down%252C%2520count%29%253B%250A%250A%2520%2520clk%2520%253D%25201%253B%250A%2520%2520rst%2520%253D%25200%253B%250A%250A%2520%2520%252310%2520rst%2520%253D%25201%253B%2520up_down%2520%253D%25201%253B%250A%2520%2520%252310%2520rst%2520%253D%25200%253B%250A%2520%2520%252370%2520up_down%2520%253D%25200%253B%250A%2520%2520%252350%2520up_down%2520%253D%25201%253B%250A%2520%2520%252360%2520up_down%2520%253D%25200%253B%250A%250A%2520%2520%252320%253B%250A%2520%2520%25235%2520%2524finish%253B%250Aend%250A%250Aalways%2520begin%250A%2520%2520%25235%2520clk%2520%253D%2520%7Eclk%253B%250Aend%250A%250Aup_down_counter%2520dut%2520%28.clk%28clk%29%252C%2520.rst%28rst%29%252C%2520.up_down%28up_down%29%252C%2520.out%28count%29%29%253B%250A%250Ainitial%2520begin%250A%2520%2520%2524dumpfile%2520%28%2522up_down_counter.vcd%2522%29%253B%250A%2520%2520%2524dumpvars%2520%281%252C%2520tb_up_down_counter%29%253B%250Aend%250A%250Aendmodule"
        style="width: 769px; height: 704px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
    </center>

3. Compile the code and check for any syntax errors using the below command.
    ```bash
    iverilog up_down_counter.v tb_up_down_counter.v -o up_down_counter
    ```

4. If there are no errors, use the below command for running the simulation.
    ```bash
    vvp up_down_counter
    ```
    You will see the values of signals being monitored across each clocktick.

5. If all looks well, use the below command for viewing the waveform. Add the signals from `tb_up_down_counter` design to the window to view the simulation output as shown in below image.
    ```bash
    gtkwave up_down_counter.vcd
    ```

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/up_down_counter/up_down_counter_sim_output.png">
    </div>

---
