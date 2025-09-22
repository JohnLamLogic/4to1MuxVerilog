# MUX(1) — Verilog Multiplexer Modules

## NAME
**mux2to1_df**, **mux2to1_st**, **mux4to1** — 2-to-1 and 4-to-1 multiplexer implementations in Verilog

## SYNOPSIS
```verilog
module mux2to1_df(
    input In0,
    input In1,
    input S,
    output Out
    );
    
    assign Out = (S) ? In1 : In0;
    
endmodule
````

```verilog
module mux2to1_st(
    input [1:0] In,
    input S,
    output Out
    );
    
    wire x, y, z;
    and(x, In[1], S);
    not(z, S);
    and(y, In[0], z);
    or(Out, x, y);

endmodule
```

```verilog
// 4-to-1 Multiplexer
module mux4to1(
    input [3:0] In,
    input [1:0] S,
    output Out
    );
    
    
    wire w0, w1;       // Intermediate outputs

    // First stage: two structural 2:1 muxes
    mux2to1_st m0 (
        .In({In[1], In[0]}),
        .S(S[0]),
        .Out(w0)
    );

    mux2to1_st m1 (
        .In({In[3], In[2]}),
        .S(S[0]),
        .Out(w1)
    );

    // Second stage: one dataflow 2:1 mux
    mux2to1_df m2 (
        .In0(w0),
        .In1(w1),
        .S(S[1]),
        .Out(Out)
    );
    
endmodule
```

## DESCRIPTION

The **mux2to1\_df** and **mux2to1\_st** modules implement the same 2-to-1 multiplexer functionality using two distinct styles:

* **mux2to1\_df** uses *dataflow modeling* (`assign` statement).
* **mux2to1\_st** uses *structural modeling*, explicitly instantiating logic gates.

The **mux4to1** module extends this concept to a 4-to-1 multiplexer, selecting one of four inputs based on a 2-bit `sel` signal.

A multiplexer ("mux") is a combinational circuit that forwards one of several input signals to a single output, based on control signals.

## OPTIONS

None — the modules are parameter-free and operate purely on their inputs.


## FILES

* **mux2to1\_df.v** — Dataflow 2-to-1 multiplexer
* **mux2to1\_st.v** — Structural 2-to-1 multiplexer
* **mux4to1.v** — 4-to-1 multiplexer

## AUTHOR

Written by *Johnathon Lamoreaux* as part of Verilog learning and digital design practice.

## BUGS

No known bugs. Behavior is fully combinational and synthesizable.

```

Would you like me to include **truth tables** for the muxes (like in a real man page’s “DESCRIPTION” section) so readers can quickly verify expected output for each select input?
```
