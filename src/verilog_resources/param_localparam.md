<center>
    <h1>Parameters</h1>
</center>

---

## Parameter

parameters in verilog is nothing but a way to instantiate constants in the digital design.

`parameter` is local to a module. but it can change value when the module is instantiated. It is used to define a property of the module.

**Syntax**<br>
`parameter <parameter_name> = <constant_expression>;`

**Example**<br>
- `parameter size = 4;`
- `parameter clk = freq / 2;`

This property can be left to default, or can be modified at instantiation of the module. For example

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520adder%2520%28a%252C%2520b%252C%2520sum%29%253B%250A%2520%2520%2520%2520%2520%2520%2520%2520parameter%2520width%2520%253D%25208%253B%250A%2520%2520%2520%2520%2520%2520%2520%2520input%2520%255Bwidth-1%253A0%255D%2520a%253B%250A%2520%2520%2520%2520%2520%2520%2520%2520input%2520%255Bwidth-1%253A0%255D%2520b%253B%250A%2520%2520%2520%2520%2520%2520%2520%2520output%2520%255Bwidth-1%253A0%255D%2520sum%253B%250A%250A%2520%2520%2520%2520%2520%2520%2520%2520assign%2520sum%2520%253D%2520a%2520%252B%2520b%253B%250A%250Aendmodule"
        style="width: 320px; height: 216px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>
<!-- ```c
module adder (a, b, sum);
        parameter width = 8;
        input [width-1:0] a;
        input [width-1:0] b;
        output [width-1:0] sum;
        assign sum = a + b;
endmodule
``` -->

By default, the adder is 8-bit (the width parameter use the default assigned value of 8). However, the instantiator module can change parameter value.

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520top%253B%250A%2520%2520%2520%2520reg%2520%255B15%253A0%255D%2520a%253B%250A%2520%2520%2520%2520reg%2520%255B15%253A0%255D%2520b%253B%250A%2520%2520%2520%2520wire%2520%255B15%253A0%255D%2520sum1%253B%250A%2520%2520%2520%2520wire%2520%255B15%253A0%255D%2520sum2%253B%250A%250A%2520%2520%2520%2520adder%2520add1%2520%28a%252C%2520b%252C%2520sum1%29%253B%250A%2520%2520%2520%2520defparam%2520add1.width%2520%253D%252016%253B%250A%250A%2520%2520%2520%2520adder%2520%2523%2816%29%2520add2%2520%28a%252C%2520b%252C%2520sum2%29%253B%250A%250Aendmodule%250A"
        style="width: 344px; height: 292px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>
<!-- ```c
module top;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum1;
    wire [15:0] sum2;
    adder add1 (a, b, sum1);
    defparam add1.width = 16;
    adder #(16) add2 (a, b, sum2);
endmodule
``` -->

---

## Local Parameter

local parameter `localparam` is also used to store the constant in the digital design but the constant defined inside the module cannot be changed. (i.e from where the module is instantiated).

**Syntax**<br>
`localparam name = value;`

**Example**<br>
- `localparam len = width/12;`
- `localparam size = 16;`

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=module%2520adder%2520%28a%252C%2520b%252C%2520sum%29%253B%250A%2520%2520%2520%2520parameter%2520height%2520%253D%25208%253B%250A%2520%2520%2520%2520parameter%2520width%2520%253D%252010%253B%250A%2520%2520%2520%2520localparam%2520length%2520%253D%25204%253B%250A%250A%2520%2520%2520%2520input%2520%255Bwidth-1%253A0%255D%2520a%253B%250A%2520%2520%2520%2520input%2520%255Bheight-1%253A0%255D%2520b%253B%250A%2520%2520%2520%2520input%2520%255Blength-1%253A0%255D%2520c%253B%250A%2520%2520%2520%2520output%2520%255Bwidth-1%253A0%255D%2520sum%253B%250A%250A%2520%2520%2520%2520assign%2520sum%2520%253D%2520a%2520%252B%2520b%2520%252B%2520c%253B%250Aendmodule%250A%250Amodule%2520top%253B%250A%2520%2520%2520%2520reg%2520%255B15%253A0%255D%2520a%253B%250A%2520%2520%2520%2520reg%2520%255B15%253A0%255D%2520b%253B%250A%2520%2520%2520%2520wire%2520%255B15%253A0%255D%2520sum1%253B%250A%250A%2520%2520%2520%2520%252F%252Ferror%2520as%2520length%2520is%2520not%2520accessible%2520outside%2520the%2520module%2520adder%250A%2520%2520%2520%2520adder%2520%2523%28.width%2816%29%252C%2520.height%284%29%252C%2520.length%285%29%2520add_0%2520%28a%252C%2520b%252C%2520sum2%29%29%253B%250A%250Aendmodule"
        style="width: 621px; height: 492px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>

<!-- ```c
module adder (a, b, sum);
    parameter height = 8;
    parameter width = 10;
    localparam length = 4;

    input [width-1:0] a;
    input [height-1:0] b;
    input [length-1:0] c;
    output [width-1:0] sum;

    assign sum = a + b + c;
endmodule

module top;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum1;

    //error as length is not accessible outside the module adder
    adder #(.width(16), .height(4), .length(5) add_0 (a, b, sum2));

endmodule
``` -->

---