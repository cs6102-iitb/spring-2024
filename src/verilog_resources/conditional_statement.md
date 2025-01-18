<center>
    <h1>Conditional Statements</h1>
</center>

---
The conditional statements are used to determine whether particular statement should be executed or not. Control statements in Verilog is similar to control statements in C.

### if-else

If the expression in if condition is true then the statements inside the if condition will be executed or if it is false the statements inside the else condition will be executed.

Syntax:

```C
if (expression)
    [statement]
else
    [statement]
```

`if-else` for multiple statements should be

```C
if (expression) begin
    [multiple statements]
end

else begin
  [multiple statements]
end
```

Example:
<center>
    <iframe
        src="https://carbon.now.sh/embed?bg=rgba%28171%2C+184%2C+195%2C+1%29&t=seti&wt=none&l=verilog&width=680&ds=true&dsyoff=0px&dsblur=0px&wc=false&wa=true&pv=9px&ph=9px&ln=false&fl=1&fm=Hack&fs=14px&lh=133%25&si=false&es=2x&wm=false&code=always%2520%2540%28posedge%2520clock%29%2520begin%250A%2520%2520%2520if%2520%28reset%29%2520state%2520%253C%253D%2520IDLE%253B%250A%2520%2520%2520else%2520state%2520%253C%253D%2520next_state%253B%250Aend%250A"
        style="width: 305px; height: 140px; border:0; transform: scale(1); overflow:hidden;"
        sandbox="allow-scripts allow-same-origin">
    </iframe>
</center>
<!-- ```c
   always @(posedge clock) begin
       if (reset) state <= IDLE;
       else state <= next_state;
   end
``` -->

Similar to C, it is possible to have nested if statements in Verilog.

### Conditional Operator

You can assign a value based on a condition by using the conditional operator.

Syntax:

```c
variable = <condition> ? <expression1> : <expression2>
```

If the condition is true expression1 is assigned to the variable or else expression2 is assigned to the variable.