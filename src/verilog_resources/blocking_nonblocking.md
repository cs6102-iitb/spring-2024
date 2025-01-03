<center>
    <h1>Blocking & Non-blocking assignment</h1>
</center>

---

Blocking and Non-blocking assignments controls the execution order within initial and always block statements. Blocking assignments are assigned using **`=`** and Non-blocking assignments using **`<=`**. Both these assignments are used to generate combination or sequential logic.

### Blocking assignment

In the always block below, the Blocking Assignment is used. In this example, the value `1` will immediately propagate to `r_Test_3`. The Blocking assignment immediately takes the value in the right-hand-side and assigns it to the left hand side.

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fm=hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=always%2520%2540%28posedge%2520i_clock%29%2520begin%250A%2520%2520%2520%2520r_Test_1%2520%253D%25201%27b1%253B%250A%2520%2520%2520%2520r_Test_2%2520%253D%2520r_Test_1%253B%250A%2520%2520%2520%2520r_Test_3%2520%253D%2520r_Test_2%253B%250Aend%250A"
        style="width: 325px; height: 158px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>

<!-- ```c
always @(posedge i_clock) begin
    r_Test_1 = 1'b1;
    r_Test_2 = r_Test_1;
    r_Test_3 = r_Test_2;
end
``` -->
Blocking assignments literally block the execution of the next statement until the current statement is executed.

### Non-blocking assignment

The always block in the Verilog code below uses the Non-blocking Assignment. It will take three clock cycles for the value `1` to propagate from `r_Test_1` to `r_Test_3`. Now consider this code:

<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=always%2520%2540%28posedge%2520i_clock%29%2520begin%250A%2520%2520%2520%2520r_Test_1%2520%253C%253D%25201%27b1%253B%250A%2520%2520%2520%2520r_Test_2%2520%253C%253D%2520r_Test_1%253B%250A%2520%2520%2520%2520r_Test_3%2520%253C%253D%2520r_Test_2%253B%250Aend%250A"
        style="width: 325px; height: 158px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>

<!-- ```c
always @(posedge i_clock) begin
    r_Test_1 <= 1'b1;
    r_Test_2 <= r_Test_1;
    r_Test_3 <= r_Test_2;
end
``` -->

It results in simultaneous or parallel statements execution. You can schedule assignments using non-blocking statements so that the procedural flow is not interrupted. Anytime you want to assign many registers in the same time step without respect to their order or dependence on one another, you can use the non-blocking procedural statement.