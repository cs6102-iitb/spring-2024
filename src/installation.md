
<center>
    <h1>Installation instructions</h1>
</center>

---

Here, we will install two software required for the course:

- **Iverilog**
- **GTKwave**

We recommend using **Ubuntu 22.04** as your operating system. For **Windows 10/11**, you may use **WSL** (Windows Subsystem for Linux) and install Ubuntu 22.04.

---

## Installing Icarus Verilog (iverilog)

Icarus Verilog or iverilog comprises of the compiler and simulation runtime engine.

### Prerequisites

Before installing Icarus Verilog, ensure that your system has the following:

- `gcc` (GNU Compiler Collection)
- `make`
- `git`

You can install these dependencies using your package manager if they are not already available:

```bash
sudo apt update
sudo apt install build-essential git
```

### Installation Steps

#### Method 1: Install from Package Manager

1. Run the following command in Terminal:

    ```bash
    sudo apt update
    sudo apt install iverilog
    ```

2. Verify the installation:

    ```bash
    iverilog -V
    ```

    You should see the version information for Icarus Verilog. It should be `12.0 (stable)`.

#### Method 2: Build from Source

1. Clone the Icarus Verilog repository:

    ```bash
    git clone https://github.com/steveicarus/iverilog.git
    cd iverilog
    ```

2. Build and install:

    ```bash
    sh autoconf.sh
    ./configure
    make
    sudo make install
    ```

3. Verify the installation:

    ```bash
    iverilog -V
    ```

---

## Installing GTKWave

GTKWave is a waveform viewer used to analyze simulation results.

### Prerequisites

Ensure the following packages are installed:

- `tcl`
- `tk`
- `libx11-dev`
- `libxft-dev`

Install them using:

```bash
sudo apt update
sudo apt install tcl tk libx11-dev libxft-dev
```

### Installation Steps

#### Method 1: Install from Package Manager

1. Run the following command in Terminal:

    ```bash
    sudo apt install gtkwave
    ```

2. Verify the installation:

    ```bash
    gtkwave --version
    ```

    You should see the version information for GTKWave. It should be `3.3.116`.

#### Method 2: Build from Source

1. Download the source code:

    ```bash
    git clone https://github.com/gtkwave/gtkwave.git
    cd gtkwave
    ```

2. Build and install:

    ```bash
    ./configure
    make
    sudo make install
    ```

3. Verify the installation:

    ```bash
    gtkwave --version
    ```

---

## Testing the Installation

### Running a Verilog Simulation

1. Create a simple Verilog file (e.g., `test.v`):

    <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520test%253B%250A%250Ainitial%2520begin%250A%2509%2524display%28%2522Hello%252C%2520Icarus%2520Verilog%21%2522%29%253B%250Aend%250Aendmodule%250A"
            style="width: 384px; height: 178px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>

2. Compile and run the file using Icarus Verilog:

    ```bash
    iverilog test.v -o test
    vvp test
    ```

    The output should display:

    ```
    Hello, Icarus Verilog!
    ```

### Viewing Waveforms with GTKWave

1. Create two Verilog files.

    - `counter.v`
    <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520counter%2520%28out%252C%2520clk%252C%2520rst%29%253B%250A%250Ainput%2520clk%252C%2520rst%253B%250Aoutput%2520%255B2%253A0%255D%2520out%253B%250A%2520%2520%250Areg%2520%255B2%253A0%255D%2520out%253B%250Awire%2520clk%252C%2520rst%253B%250A%250Aalways%2520%2540%28posedge%2520clk%2520or%2520posedge%2520rst%29%250A%2520%2520if%2520%28rst%29%250A%2520%2520%2520%2520out%2520%253C%253D%25200%253B%250A%2520%2520else%250A%2520%2520%2520%2520out%2520%253C%253D%2520out%2520%252B%25201%27b1%253B%250A%250Aendmodule%250A"
            style="width: 359px; height: 350px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>

    - `tb_counter.v`
    <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520tb_counter%253B%250A%250Areg%2520clk%252C%2520rst%253B%250Awire%2520%255B2%253A0%255D%2520out%253B%250A%250Ainitial%2520begin%250A%2520%2520%2520%2524monitor%28%2522At%2520time%2520%2525t%252C%2520counter%2520%253D%2520%2525h%2520%28%25250d%29%2522%252C%2520%2524time%252C%2520out%252C%2520out%29%253B%250A%2520%2520%2520rst%2520%253D%25200%253B%2520clk%2520%253D%25200%253B%250A%2520%2520%2520%2523%252017%2520rst%2520%253D%25201%253B%250A%2520%2520%2520%2523%252011%2520rst%2520%253D%25200%253B%250A%2520%2520%2520%2523%252031%2520rst%2520%253D%25201%253B%250A%2520%2520%2520%2523%252011%2520rst%2520%253D%25200%253B%250A%2520%2520%2520%2523%2520100%2520%2524finish%253B%250Aend%250A%250Aalways%2520begin%250A%2520%2520%25235%2520clk%2520%253D%2520%7Eclk%253B%250Aend%250A%250A%2520%2520counter%2520c1%2520%28out%252C%2520clk%252C%2520rst%29%253B%250A%250Ainitial%2520begin%250A%2520%2520%2524dumpfile%2520%28%2522counter_dump.vcd%2522%29%253B%250A%2520%2520%2524dumpvars%2520%281%252C%2520tb_counter%29%253B%250Aend%250A%250Aendmodule%250A"
            style="width: 557px; height: 585px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>

2. Compile and run:

    ```bash
    iverilog counter.v tb_counter.v -o counter
    vvp counter
    ```

    This will generate the `counter_dump.vcd` file.

3. Open the waveform file with GTKWave:

    ```bash
    gtkwave counter_dump.vcd
    ```

    A window will be opened with the testbench name, `tb_counter` in the SST pane. Click on it to view the signals inside the testbench.

    Select all the signals and click on Insert. This will insert all the testbench signals in the waveform pane. You will see the simulation output as below.

    <div align="center">
        <img src="https://raw.githubusercontent.com/kalindkaria/mdbook-assets/master/cs6102_spring2024-25/installation/gtkwave_test_counter_sim_output.png">
    </div>
    <br>

---
