<center>
    <h1>Building Blocks</h1>
</center>

---

### Verilog Module
   A Verilog module is a self-contained unit that defines a specific functionality. It serves as a blueprint for creating instances of that functionality in your design. Modules encapsulate a set of logic, inputs, outputs, and potentially internal signals.
    <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520Adder%2520%28%250A%2520%2520%2520%2520input%2520%255B3%253A0%255D%2520A%252C%250A%2520%2520%2520%2520input%2520%255B3%253A0%255D%2520B%252C%250A%2520%2520%2520%2520output%2520%255B4%253A0%255D%2520Sum%250A%29%253B%250A%250A%252F%252F%2520Logic%2520to%2520implement%2520addition%250A%250Aendmodule%250A"
            style="width: 320px; height: 233px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>
   <!-- ```c
   module Adder (
       input [3:0] A,
       input [3:0] B,
       output [4:0] Sum
   );
       // Logic to implement addition
   endmodule
   ``` -->

### Verilog Port
   Ports are the communication interfaces of a Verilog module. They define how information flows in and out of the module. Ports can be inputs, outputs, or bidirectional.
   <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520Decoder%2520%28%250A%2520%2520%2520%2520input%2520%255B2%253A0%255D%2520Input%252C%250A%2520%2520%2520%2520output%2520reg%2520%255B7%253A0%255D%2520Output%250A%29%253B%250A%250A%252F%252F%2520Logic%2520to%2520decode%2520the%2520input%2520signals%250A%250Aendmodule%250A"
            style="width: 360px; height: 213px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>
   <!-- ```c
   module Decoder (
       input [2:0] Input,
       output reg [7:0] Output
   );
       // Logic to decode the input signals
   endmodule
   ``` -->

### Verilog Module Instantiations
   Module instantiations are instances of a module created within another module. They allow you to use the functionality defined in one module within another.
   <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520TopModule%253B%250A%2520%2520%2520%2520Adder%2520A1%2520%28.A%28inA%29%252C%2520.B%28inB%29%252C%2520.Sum%28sum%29%29%253B%250A%2520%2520%2520%2520Decoder%2520D1%2520%28.Input%28selector%29%252C%2520.Output%28decodedOutput%29%29%253B%250Aendmodule%250A"
            style="width: 770px; height: 140px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>
   <!-- ```c
   module TopModule;
       Adder A1 (.A(inA), .B(inB), .Sum(sum));
       Decoder D1 (.Input(selector), .Output(decodedOutput));
   endmodule
   ``` -->

### Verilog Assign Statements
   The `assign` statement connects a source to a destination, creating a continuous assignment. It's used to connect wires or signals directly without using a procedural block.
   <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=assign%2520Sum%2520%253D%2520A%2520%252B%2520B%253B%250A"
            style="width: 216px; height: 83px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>
   <!-- ```c
   assign Sum = A + B;
   ``` -->

### Verilog Always Block
   The `always` block defines procedural logic that executes whenever the conditions specified within it are met. It's often used for sequential logic and state machines.
   <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=always%2520%2540%28posedge%2520clock%29%2520begin%250A%2520%2520%2520%2520if%2520%28reset%29%2520state%2520%253C%253D%2520IDLE%253B%250A%2520%2520%2520%2520else%2520state%2520%253C%253D%2520next_state%253B%250Aend%250A"
            style="width: 310px; height: 139px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>
   <!-- ```c
   always @(posedge clock) begin
       if (reset) state <= IDLE;
       else state <= next_state;
   end
   ``` -->

   In the above always block the logic statements will be executed at each positive edge of the clock signal.

### Verilog Initial Block
   The `initial` block contains procedural code that's executed only once at the start of simulation. It's used for setting initial values or performing setup tasks.
   <center>
        <iframe
            src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=initial%2520begin%250A%2520%2520%2520%2520clk%2520%253D%25200%253B%250A%2520%2520%2520%2520reset%2520%253D%25201%253B%250A%2520%2520%2520%2520%252F%252F%2520Other%2520initialization%2520tasks%250Aend%250A"
            style="width: 334px; height: 158px; border:0; transform: scale(1); overflow:hidden;"
            sandbox="allow-scripts allow-same-origin">
        </iframe>
    </center>
   <!-- ```c
   initial begin
       clk = 0;
       reset = 1;
       // Other initialization tasks
   end
   ``` -->

These building blocks collectively allow you to create complex digital designs by defining the structure, behavior, and interactions of different components in your Verilog code.