<center>
  <h1>FIFO</h1>
</center>

---

**Problem Statement:** Design and simulate behavioral model of a FIFO.

---

**What is FIFO?**

<div align="justify">
It is a data structure that organizes and processes data in the order it was received. Its a queue-type data structure, where the oldest element is at the front of the queue and is processed first.
</div>

FIFO is similar to a supermarket checkout line, where the first person in line is served first.

## Implementing a behavioral model of FIFO

- Some important points to note
    - Two input signals `push` and `pop` are used to insert and delete data from the data structure. While asserting `push`, we must also provide some data to insert in the FIFO.
    - Two pointers, `Rptr` (for read) and `Wptr` (for write) will be used to maintain the FIFO. `Rptr` is incremented upon a read, and the `Wptr` is incremented upon a write.
    - Two flags, `full` and `empty` can be used to check and display the status of the FIFO.
        - While `full = 1`, no data shall be inserted in the FIFO, even if provided with the `push` signal.
        - Similarly, while `empty = 1`, no data shall be deleted and/or output should not change, even if `pop` signal tries to delete.

1. Create a new Verilog file named `fifo.v`, and copy-paste the below design.

    <center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520fifo%2520%2523%28parameter%2520DATAWIDTH%2520%253D%252032%252C%2520ADDWIDTH%2520%253D%25204%252C%2520DEPTH%2520%253D%252016%29%250A%2520%2520%2509%2509%2509%2509%28clk%252C%2520rst%252C%2520in%252C%2520out%252C%2520push%252C%2520pop%252C%2520full%252C%2520empty%29%253B%250A%250Ainput%2520clk%253B%250Ainput%2520rst%253B%250A%250Ainput%2520push%253B%250Ainput%2520pop%253B%250A%250Ainput%2520%255BDATAWIDTH-1%253A0%255D%2520in%253B%250Aoutput%2520reg%2520%255BDATAWIDTH-1%253A0%255D%2520out%253B%250A%250Aoutput%2520full%253B%250Aoutput%2520empty%253B%250A%250Awire%2520WrVld%253B%250Awire%2520RdVld%253B%250A%250Areg%2520%255BADDWIDTH-1%253A0%255D%2520Wptr%253B%250Areg%2520%255BADDWIDTH-1%253A0%255D%2520Rptr%253B%250Areg%2520%255BDATAWIDTH-1%253A0%255D%2520fifo%2520%255BDEPTH-1%253A0%255D%253B%250A%250Aassign%2520WrVld%2520%253D%2520%28%28%7Efull%29%2520%2526%2520push%29%253B%250Aassign%2520RdVld%2520%253D%2520%28%28%7Eempty%29%2520%2526%2520pop%29%253B%250A%250Aalways%2520%2540%28posedge%2520clk%29%2520begin%250A%2520%2520if%2520%28rst%29%2520begin%250A%2520%2520%2520%2520Wptr%2520%253C%253D%25200%253B%250A%2520%2520%2520%2520Rptr%2520%253C%253D%25200%253B%250A%2520%2520%2520%2520out%2520%2520%253C%253D%25200%253B%250A%2520%2520end%250Aend%250A%250A%252F%252F%2520To%2520write%2520data%2520to%2520FIFO%250Aalways%2520%2540%28posedge%2520clk%29%2520begin%250A%2520%2520if%2520%28WrVld%29begin%250A%2520%2520%2520%2520fifo%255BWptr%255D%2520%253C%253D%2520in%253B%250A%2520%2520%2520%2520Wptr%2520%253C%253D%2520Wptr%2520%252B%25201%253B%250A%2520%2520end%250Aend%250A%250A%252F%252F%2520To%2520read%2520data%2520from%2520FIFO%250Aalways%2520%2540%28posedge%2520clk%29%2520begin%250A%2520%2520if%2520%28RdVld%29%2520begin%250A%2520%2520%2520%2520out%2520%253C%253D%2520fifo%255BRptr%255D%253B%250A%2520%2520%2520%2520Rptr%2520%253C%253D%2520Rptr%2520%252B%25201%253B%250A%2520%2520end%250Aend%250A%250Aassign%2520full%2520%253D%2520%28%28Wptr%2520%252B%25201%27b1%29%2520%253D%253D%2520Rptr%29%253B%250Aassign%2520empty%2520%253D%2520%28Wptr%2520%253D%253D%2520Rptr%29%253B%250A%250Aendmodule"
        style="width: 769px; height: 1039px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
    </center>

2. Create a new Verilog file and type the below testbench code provided below. Save the file with the same name as the module name.

    <center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=%2560timescale%25201ns%252F1ps%250Amodule%2520tb_fifo%253B%250A%250Aparameter%2520DATAWIDTH%2520%253D%252032%253B%250Aparameter%2520ADDWIDTH%2520%253D%25204%253B%250Aparameter%2520DEPTH%2520%253D%252016%253B%250A%250Areg%2520clk%253B%250Areg%2520rst%253B%250A%250Areg%2520push%253B%250Areg%2520pop%253B%250A%250Awire%2520full%253B%250Awire%2520empty%253B%250A%250Areg%2520%255BDATAWIDTH-1%253A0%255D%2520in%253B%250Awire%2520%255BDATAWIDTH-1%253A0%255D%2520out%253B%250A%250Ainitial%2520begin%250A%2520%2520%2520%2520%2524display%28%2522time%255Ct%252C%2520clk%255Ct%2520rst%255Ct%252C%2520in%255Ct%252C%2520out%255Ct%2520%2522%29%253B%250A%2520%2520%2520%2520%2524monitor%2520%28%2522%2525g%255Ct%2520%2525b%255Ct%2520%2520%2520%2525b%255Ct%2520%2520%2520%2520%2525d%255Ct%2520%2520%2520%2520%2520%2520%2525d%255Ct%2520%2520%2520%2522%252C%250A%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2520%2524time%252C%2520clk%252C%2520rst%252C%2520in%252C%2520out%29%253B%250A%250A%2520%2520%2520%2520clk%2520%253D%25201%253B%250A%2520%2520%2520%2520rst%2520%253D%25200%253B%250A%250A%2520%2520%2520%2520%252310%2520rst%2520%253D%25201%253B%250A%2520%2520%2520%2520%252310%2520rst%2520%253D%25200%253B%250A%2520%2520%2520%2520%252310%2520pop%2520%253D%25200%253B%250A%2520%2520%2520%2520%252310%2520push%2520%253D%25200%253B%250A%250A%2520%2520%2520%2520%252310%2520in%2520%253D%25205%253B%250A%2520%2520%2520%2520push%2520%253D%25201%253B%250A%250A%2520%2520%2520%2520%252310%2520push%2520%253D%25200%253B%250A%2520%2520%2520%2520pop%2520%253D%25201%253B%250A%2520%2520%2520%2520%252310%2520pop%2520%253D%25200%253B%250A%250A%2520%2520%2520%2520%252310%2520in%2520%253D%25206%253B%250A%2520%2520%2520%2520push%2520%253D%25201%253B%250A%250A%2520%2520%2520%2520%252310%2520in%2520%253D%25207%253B%250A%2520%2520%2520%2520push%2520%253D%25201%253B%250A%250A%2520%2520%2520%2520%252310%2520in%2520%253D%25208%253B%250A%2520%2520%2520%2520push%2520%253D%25201%253B%250A%250A%2520%2520%2520%2520%252310%2520push%2520%253D%25200%253B%250A%250A%2520%2520%2520%2520%252310%2520push%2520%253D%25200%253B%250A%2520%2520%2520%2520%252310%2520pop%2520%253D%25201%253B%250A%2520%2520%2520%2520%252310%2520pop%2520%253D%25201%253B%250A%2520%2520%2520%2520%252310%2520pop%2520%253D%25201%253B%250A%250A%2520%2520%2520%2520%252310%250A%2520%2520%2520%2520%25235%2520%2524finish%253B%250Aend%250A%250Aalways%2520begin%250A%2520%2520%2520%2520%25235%2520clk%2520%253D%2520%7Eclk%253B%250Aend%250A%250Afifo%2520%2523%28.DATAWIDTH%28DATAWIDTH%29%252C%2520.ADDWIDTH%28ADDWIDTH%29%252C%2520.DEPTH%28DEPTH%29%29%250A%2520%2520%2509%2509dut%2520%28.clk%28clk%29%252C%2520.rst%28rst%29%252C%2520.in%28in%29%252C%2520.out%28out%29%252C%2520.push%28push%29%252C%250A%2520%2520%2520%2520%2520%2520%2520%2509%2509%2509.pop%28pop%29%252C%2520.full%28full%29%252C%2520.empty%28empty%29%29%253B%250A%250Ainitial%2520begin%250A%2520%2520%2520%2520%2524dumpfile%2520%28%2522fifo.vcd%2522%29%253B%250A%2520%2520%2520%2520%2524dumpvars%2520%281%252C%2520tb_fifo%29%253B%250Aend%250A%250Aendmodule"
        style="width: 769px; height: 1412px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
    </center>

3. Compile the code and check for any syntax errors using the below command.
    ```bash
    iverilog fifo.v tb_fifo.v -o fifo
    ```

4. If there are no errors, use the below command for running the simulation.
    ```bash
    vvp fifo
    ```
    You will see the values of signals being monitored across each clocktick.

5. If all looks well, use the below command for viewing the waveform. Add the signals from `tb_fifo` design to the window to view the simulation output as shown in below image.
    ```bash
    gtkwave fifo.vcd
    ```

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/main/cs6102_spring2024-25/resources/digital_circuits/fifo/fifo_sim_output.png">
    </div>
    <br>

    - At time, t = 100 ns, `push = 1` and `in = 32'h00000008`, the data is being saved in the FIFO and thus it is neither `full` nor `empty`.
    - Eventually when the `pop = 1`, the data stored in FIFO is available at the `out` port, one at a time.
    - And as soon as the last data is popped out, the FIFO becomes empty, thus `empty = 1`.

---
