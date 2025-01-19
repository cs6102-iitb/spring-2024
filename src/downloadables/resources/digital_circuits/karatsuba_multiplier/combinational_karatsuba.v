// 16-bit recursive karatsuba multiplier
module combinational_karatsuba (X, Y, Z);

input [16-1:0] X;
input [16-1:0] Y;
output [(2*16 -1):0] Z;

wire [(16/2)-1:0] X_h;
wire [(16/2)-1:0] X_l;

wire [(16/2)-1:0] Y_h;
wire [(16/2)-1:0] Y_l;

wire [16-1:0] t0;
wire [16-1:0] t2;

wire [16:0] t1;
wire [16-1:0] t11;
wire [16:0] t12;

wire [(16/2)-1:0] Xh_P_Xl;
wire [(16/2)-1:0] Yh_P_Yl;

wire [(16/2)-1:0] Xh_P_Xl_tmp;
wire [(16/2)-1:0] Yh_P_Yl_tmp;

wire [(16/2)-1:0] comp_Xh_P_Xl;
wire [(16/2)-1:0] comp_Yh_P_Yl;

wire [16-1:0] comp_t11;
wire [16-1:0] t11_tmp;

wire cin1;
wire cin2;

wire ov1;
wire ob2;

wire cout_sub1;
wire cout_sub2;

assign X_h = X[16-1:(16/2)];
assign X_l = X[(16/2)-1:0];

assign Y_h = Y[16-1:(16/2)];
assign Y_l = Y[(16/2)-1:0];

recursive_karatsuba_8 mult1 (.X(X_h), .Y(Y_h), .Z(t2));
recursive_karatsuba_8 mult2 (.X(X_l), .Y(Y_l), .Z(t0));

//Calculate z_m = x_h*y_l + x_l*y_h using Karatsuba's trick (the subtraction trick is used to use the N/2 bit multipliers only)

assign cin1 = 0;
assign cin2 = 0;
subtract_Nbit #(.N(16/2)) sub1 (.a(X_l), .b(X_h), .cin(cin1), .S(Xh_P_Xl_tmp), .ov(ov1), .cout_sub(cout_sub1));  // N/2-bit subtractor with (N/2)-bit result
subtract_Nbit #(.N(16/2)) sub2 (.a(Y_h), .b(Y_l), .cin(cin2), .S(Yh_P_Yl_tmp), .ov(ov2), .cout_sub(cout_sub2));  // N/2-bit subtractor with (N/2)-bit result

// Take the absolute values for multiplication
Complement2_Nbit #(.N(16/2)) comp1 (.a(Xh_P_Xl_tmp), .c(comp_Xh_P_Xl), .cout_comp());
Complement2_Nbit #(.N(16/2)) comp2 (.a(Yh_P_Yl_tmp), .c(comp_Yh_P_Yl), .cout_comp());
assign Xh_P_Xl = cout_sub1 ? Xh_P_Xl_tmp: comp_Xh_P_Xl;
assign Yh_P_Yl = cout_sub2 ? Yh_P_Yl_tmp: comp_Yh_P_Yl;

recursive_karatsuba_8 mult3 (.X(Xh_P_Xl), .Y(Yh_P_Yl), .Z(t11_tmp));

assign t12 = t0 + t2;    // N-bit addition with N+1 bit output

// Now determine the sign of the multiplied value. Depending on this sign we perfrom addition or subtraction (with carry)
wire select;
assign select = cout_sub1 ^ cout_sub2;
assign t1 = select? (t12 - t11_tmp) : (t12 + t11_tmp);

assign Z = (t2 << 16) + (t1 << (16/2)) + t0;

endmodule


// 8-bit recursive karatsuba multiplier
module recursive_karatsuba_8 (X, Y, Z);

input [8-1:0] X;
input [8-1:0] Y;
output [(2*8 -1):0] Z;

wire [(8/2)-1:0] X_h;
wire [(8/2)-1:0] X_l;

wire [(8/2)-1:0] Y_h;
wire [(8/2)-1:0] Y_l;

wire [8-1:0] t0;
wire [8-1:0] t2;

wire [8:0] t1;
wire [8-1:0] t11;
wire [8:0] t12;

wire [(8/2)-1:0] Xh_P_Xl;
wire [(8/2)-1:0] Yh_P_Yl;

wire [(8/2)-1:0] Xh_P_Xl_tmp;
wire [(8/2)-1:0] Yh_P_Yl_tmp;

wire [(8/2)-1:0] comp_Xh_P_Xl;
wire [(8/2)-1:0] comp_Yh_P_Yl;

wire [8-1:0] comp_t11;
wire [8-1:0] t11_tmp;

wire cin1;
wire cin2;

wire ov1;
wire ob2;

wire cout_sub1;
wire cout_sub2;

assign X_h = X[8-1:(8/2)];
assign X_l = X[(8/2)-1:0];

assign Y_h = Y[8-1:(8/2)];
assign Y_l = Y[(8/2)-1:0];

recursive_karatsuba_4 mult1 (.X(X_h), .Y(Y_h), .Z(t2));
recursive_karatsuba_4 mult2 (.X(X_l), .Y(Y_l), .Z(t0));

//Calculate z_m = x_h*y_l + x_l*y_h using Karatsuba's trick (the subtraction trick is used to use the N/2 bit multipliers only)

assign cin1 = 0;
assign cin2 = 0;
subtract_Nbit #(.N(8/2)) sub1 (.a(X_l), .b(X_h), .cin(cin1), .S(Xh_P_Xl_tmp), .ov(ov1), .cout_sub(cout_sub1));  // N/2-bit subtractor with (N/2)-bit result
subtract_Nbit #(.N(8/2)) sub2 (.a(Y_h), .b(Y_l), .cin(cin2), .S(Yh_P_Yl_tmp), .ov(ov2), .cout_sub(cout_sub2));  // N/2-bit subtractor with (N/2)-bit result

// Take the absolute values for multiplication
Complement2_Nbit #(.N(8/2)) comp1 (.a(Xh_P_Xl_tmp), .c(comp_Xh_P_Xl), .cout_comp());
Complement2_Nbit #(.N(8/2)) comp2 (.a(Yh_P_Yl_tmp), .c(comp_Yh_P_Yl), .cout_comp());
assign Xh_P_Xl = cout_sub1 ? Xh_P_Xl_tmp: comp_Xh_P_Xl;
assign Yh_P_Yl = cout_sub2 ? Yh_P_Yl_tmp: comp_Yh_P_Yl;

recursive_karatsuba_4 mult3 (.X(Xh_P_Xl), .Y(Yh_P_Yl), .Z(t11_tmp));

assign t12 = t0 + t2;    // N-bit addition with N+1 bit output

// Now determine the sign of the multiplied value. Depending on this sign we perfrom addition or subtraction (with carry)
wire select;
assign select = cout_sub1 ^ cout_sub2;
assign t1 = select? (t12 - t11_tmp) : (t12 + t11_tmp);

assign Z = (t2 << 8) + (t1 << (8/2)) + t0;

endmodule


// 4-bit recursive karatsuba multiplier
module recursive_karatsuba_4 (X, Y, Z);

input [4-1:0] X;
input [4-1:0] Y;
output [(2*4 -1):0] Z;

wire [(4/2)-1:0] X_h;
wire [(4/2)-1:0] X_l;

wire [(4/2)-1:0] Y_h;
wire [(4/2)-1:0] Y_l;

wire [4-1:0] t0;
wire [4-1:0] t2;

wire [4:0] t1;
wire [4-1:0] t11;
wire [4:0] t12;

wire [(4/2)-1:0] Xh_P_Xl;
wire [(4/2)-1:0] Yh_P_Yl;

wire [(4/2)-1:0] Xh_P_Xl_tmp;
wire [(4/2)-1:0] Yh_P_Yl_tmp;

wire [(4/2)-1:0] comp_Xh_P_Xl;
wire [(4/2)-1:0] comp_Yh_P_Yl;

wire [4-1:0] comp_t11;
wire [4-1:0] t11_tmp;

wire cin1;
wire cin2;

wire ov1;
wire ob2;

wire cout_sub1;
wire cout_sub2;

assign X_h = X[4-1:(4/2)];
assign X_l = X[(4/2)-1:0];

assign Y_h = Y[4-1:(4/2)];
assign Y_l = Y[(4/2)-1:0];

recursive_karatsuba_2 mult1 (.X(X_h), .Y(Y_h), .Z(t2));
recursive_karatsuba_2 mult2 (.X(X_l), .Y(Y_l), .Z(t0));

//Calculate z_m = x_h*y_l + x_l*y_h using Karatsuba's trick (the subtraction trick is used to use the N/2 bit multipliers only)

assign cin1 = 0;
assign cin2 = 0;
subtract_Nbit #(.N(4/2)) sub1 (.a(X_l), .b(X_h), .cin(cin1), .S(Xh_P_Xl_tmp), .ov(ov1), .cout_sub(cout_sub1));  // N/2-bit subtractor with (N/2)-bit result
subtract_Nbit #(.N(4/2)) sub2 (.a(Y_h), .b(Y_l), .cin(cin2), .S(Yh_P_Yl_tmp), .ov(ov2), .cout_sub(cout_sub2));  // N/2-bit subtractor with (N/2)-bit result

// Take the absolute values for multiplication
Complement2_Nbit #(.N(4/2)) comp1 (.a(Xh_P_Xl_tmp), .c(comp_Xh_P_Xl), .cout_comp());
Complement2_Nbit #(.N(4/2)) comp2 (.a(Yh_P_Yl_tmp), .c(comp_Yh_P_Yl), .cout_comp());
assign Xh_P_Xl = cout_sub1 ? Xh_P_Xl_tmp: comp_Xh_P_Xl;
assign Yh_P_Yl = cout_sub2 ? Yh_P_Yl_tmp: comp_Yh_P_Yl;


recursive_karatsuba_2 mult3 (.X(Xh_P_Xl), .Y(Yh_P_Yl), .Z(t11_tmp));

assign t12 = t0 + t2;    // N-bit addition with N+1 bit output

// Now determine the sign of the multiplied value. Depending on this sign we perfrom addition or subtraction (with carry)
wire select;
assign select = cout_sub1 ^ cout_sub2;
assign t1 = select? (t12 - t11_tmp) : (t12 + t11_tmp);

assign Z = (t2 << 4) + (t1 << (4/2)) + t0;

endmodule


// 2-bit karatsuba multiplier
module recursive_karatsuba_2 (X, Y, Z);

input [2-1:0] X;
input [2-1:0] Y;
output [(2*2 -1):0] Z;

wire [(2/2)-1:0] X_h;
wire [(2/2)-1:0] X_l;

wire [(2/2)-1:0] Y_h;
wire [(2/2)-1:0] Y_l;

wire [2-1:0] t0;
wire [2-1:0] t2;


wire [2:0] t1;
wire [2-1:0] t11;
wire [2:0] t12;

wire [(2/2)-1:0] Xh_P_Xl;
wire [(2/2)-1:0] Yh_P_Yl;

wire [(2/2)-1:0] Xh_P_Xl_tmp;
wire [(2/2)-1:0] Yh_P_Yl_tmp;

wire [(2/2)-1:0] comp_Xh_P_Xl;
wire [(2/2)-1:0] comp_Yh_P_Yl;


wire [2-1:0] comp_t11;
wire [2-1:0] t11_tmp;

wire cin1;
wire cin2;

wire ov1;
wire ob2;

wire cout_sub1;
wire cout_sub2;

assign X_h = X[2-1:(2/2)];
assign X_l = X[(2/2)-1:0];

assign Y_h = Y[2-1:(2/2)];
assign Y_l = Y[(2/2)-1:0];

assign t2 = X_h & Y_h;
assign t0 = X_l & Y_l;


//Calculate z_m = x_h*y_l + x_l*y_h using Karatsuba's trick (the subtraction trick is used to use the N/2 bit multipliers only)

assign cin1 = 0;
assign cin2 = 0;
subtract_Nbit #(.N(2/2)) sub1 (.a(X_l), .b(X_h), .cin(cin1), .S(Xh_P_Xl_tmp), .ov(ov1), .cout_sub(cout_sub1));  // N/2-bit subtractor with (N/2)-bit result
subtract_Nbit #(.N(2/2)) sub2 (.a(Y_h), .b(Y_l), .cin(cin2), .S(Yh_P_Yl_tmp), .ov(ov2), .cout_sub(cout_sub2));  // N/2-bit subtractor with (N/2)-bit result

// Take the absolute values for multiplication
Complement2_Nbit #(.N(2/2)) comp1 (.a(Xh_P_Xl_tmp), .c(comp_Xh_P_Xl), .cout_comp());
Complement2_Nbit #(.N(2/2)) comp2 (.a(Yh_P_Yl_tmp), .c(comp_Yh_P_Yl), .cout_comp());
assign Xh_P_Xl = cout_sub1 ? Xh_P_Xl_tmp: comp_Xh_P_Xl;
assign Yh_P_Yl = cout_sub2 ? Yh_P_Yl_tmp: comp_Yh_P_Yl;

assign t11_tmp = Xh_P_Xl & Yh_P_Yl;

assign t12 = t0 + t2;    // N-bit addition with N+1 bit output

// Now determine the sign of the multiplied value. Depending on this sign we perfrom addition or subtraction (with carry)
wire select;
assign select = cout_sub1 ^ cout_sub2;
assign t1 = select? (t12 - t11_tmp) : (t12 + t11_tmp);

assign Z = (t2 << 2) + (t1 << (2/2)) + t0;

endmodule


/*-------------------Supporting Modules--------------------*/

// Full adder
module full_adder (a, b, cin, S, cout);

input a;
input b;
input cin;
output S;
output cout;

assign S = a ^ b ^ cin;
assign cout = (a&b) ^ (b&cin) ^ (a&cin);

endmodule

// N-bit RCA adder (Unsigned)
module adder_Nbit #(parameter N = 32) (a, b, cin, S, cout);

input [N-1:0] a;
input [N-1:0] b;
input cin;
output [N-1:0] S;
output cout;

wire [N:0] cr;
assign cr[0] = cin;

generate
    genvar i;
    for (i = 0; i < N; i = i + 1) begin : gen_nbit_rca_adder
        full_adder addi (.a(a[i]), .b(b[i]), .cin(cr[i]), .S(S[i]), .cout(cr[i+1]));
    end
endgenerate

assign cout = cr[N];

endmodule

// N-bit complement
module Not_Nbit #(parameter N = 32) (a,c);

input [N-1:0] a;
output [N-1:0] c;

generate
genvar i;
for (i = 0; i < N; i = i+1) begin : gen_not_nbit
    assign c[i] = ~a[i];
end
endgenerate

endmodule

// N-bit 2's complement
module Complement2_Nbit #(parameter N = 32) (a, c, cout_comp);

input [N-1:0] a;
output [N-1:0] c;
output cout_comp;

wire [N-1:0] b;
wire ccomp;

Not_Nbit #(.N(N)) compl(.a(a),.c(b));
adder_Nbit #(.N(N)) addc(.a(b), .b({ {N-1{1'b0}} ,1'b1 }), .cin(1'b0), .S(c), .cout(ccomp));

assign cout_comp = ccomp;

endmodule

// N-bit subtract (Unsigned)
module subtract_Nbit #(parameter N = 32) (a, b, cin, S, ov, cout_sub);

input [N-1:0] a;
input [N-1:0] b;
input cin;
output [N-1:0] S;
output ov;
output cout_sub;

wire [N-1:0] minusb;
wire cout;
wire ccomp;

Complement2_Nbit #(.N(N)) compl(.a(b),.c(minusb), .cout_comp(ccomp));
adder_Nbit #(.N(N)) addc(.a(a), .b(minusb), .cin(1'b0), .S(S), .cout(cout));

assign ov = (~(a[N-1] ^ minusb[N-1])) & (a[N-1] ^ S[N-1]);
assign cout_sub = cout | ccomp;

endmodule
