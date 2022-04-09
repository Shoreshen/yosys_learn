[TOC]

# cells

## $mux

### Gate wire

<img src="./pic/mux.drawio.png">

### ports & Truth Table

yosys provide the following ports for $mux cell:
1. Input port: `\A=A`, `\B=B`
2. Signal port: `\S=sel`, this is a simple bit port
3. Output port: `\Y=Y`

The corresponding truth table for 1 bit are:

| A   | B   | sel | Y   |
| --- | --- | --- | --- |
| 1   | 0   | 0   | 1   |
| 1   | 1   | 0   | 1   |
| 0   | 0   | 0   | 0   |
| 0   | 1   | 0   | 0   |
| 1   | 0   | 1   | 0   |
| 1   | 1   | 1   | 1   |
| 0   | 0   | 1   | 0   |
| 0   | 1   | 1   | 1   |

Or a more readable form:

| sel | Y   |
| --- | --- |
| 0   | A   |
| 1   | B   |

### parameters

1. `\WIDTH`: The width of inputs `\A` and `\B` and output `\Y` ports

## $pmux

### Gate wire

The following is an example of 2 bit selection with one bit input and output wire graph.

There may be different and more complex designs with increasing bits

<img src="./pic/pmux.drawio.png">

### ports & Truth Table

yosys provide the following ports for $pmux cell:
1. Input port: `\A=A` with width of `\WIDTH`, `\B=B` with width of `\WIDTH` multiply `\S_WIDTH`
2. Signal port: `\S=sel` with width of `\S_WIDTH`
3. Output port: `\Y=Y` with width of `\WIDTH`

With the width expansion in signal port it provide the ability to select n'th piece of input data:
1. when `sel=0` the output will be `A` 
2. when `sel>0` separate `B` into `\S_WIDTH` parts with each part have a width of `\WIDTH` 
   then set output to be `sel`'th part of `B` 

The following is a truth table for 2 bit selection with one bit input and output wire graph:

| sel | Y       |
| --- | ------- |
| 00  | A       |
| 01  | B<sub>1 |
| 10  | B<sub>2 |
| 11  | B<sub>3 |

### parameters

1. `\WIDTH`: The width of inputs `\A` and output `\Y` ports
2. `\S_WIDTH`: The width of selection signal `\S`
3. The width of `\B=B` is the multiplication of `\WIDTH` and `\S_WIDTH`

## $sr

### Gate wire

<img src="./pic/sr.drawio.png">

### ports & Truth Table

yosys provide the following ports for $sr type latch:
1. Input ports: `\SET=S` and `\CLR=R` 
2. Output ports: `\Q=Q`

The corresponding truth table for 1 bit are:

| S   | R   | Q   | <span style="text-decoration:overline">Q</span> |
| --- | --- | --- | ----------------------------------------------- |
| 1   | 0   | 1   | 0                                               |
| 0   | 1   | 0   | 1                                               |
| 0   | 0   | Q   | <span style="text-decoration:overline">Q</span> |
| 1   | 1   | X   | X                                               |

Note:
1. `\SET` and `\CLR` have separate bits for every output bit 
2. If `\SET=1` and `\CLR=1` then `Q=0`

### parameters

1. `\WIDTH`: The width of inputs `\SET` and `\CLR` and output `\Q` ports
2. `\SET_POLARITY`: The set input bits are active-high if this parameter has the value `1’b1` and active-low if this parameter is `1’b0`
3. `\CLR_POLARITY`: The reset input bits are active-high if this parameter has the value `1’b1` and active-low if this parameter is `1’b0`

## $dff

### Gate wire

The following graph are equivalent, while the RS latch is replaced by a black box in the second graph.

<img src="./pic/dff.drawio.png">

### ports & Truth Table

yosys provide the following ports for $dff cell:
1. Clock port: `\CLK=clk`
2. Input port: `\D=D`
3. Output port: `\Q=Q`

The corresponding truth table for 1 bit are:

| D   | clk    | Q   | <span style="text-decoration:overline">Q</span> |
| --- | ------ | --- | ----------------------------------------------- |
| 1   | &uarr; | 1   | 0                                               |
| 0   | &uarr; | 0   | 1                                               |
| X   | 0      | Q   | <span style="text-decoration:overline">Q</span> |
| X   | 1      | Q   | <span style="text-decoration:overline">Q</span> |

### parameters

1. `\WIDTH`: The width of inputs `\D` and output `\Q` ports
2. `\CLK_POLARITY`: Clock is active on the positive edge if this parameter has the value 1’b1 and on the negative edge if this parameter is 1’b0

## $adff

### Gate wire

<img src="./pic/adff.drawio.png">

### ports & Truth Table

yosys provide the following ports for $adff cell:
1. Clock port: `\CLK=clk`
2. Input port: `\D=D`
3. Reset port: `\ARST=R`, this is a single bit port
4. Output port: `\Q=Q`

The corresponding truth table for 1 bit are:

| R   | D   | clk    | Q   | <span style="text-decoration:overline">Q</span> |
| --- | --- | ------ | --- | ----------------------------------------------- |
| 0   | X   | X      | 0   | 1                                               |
| 1   | 0   | &uarr; | 0   | 1                                               |
| 1   | 1   | &uarr; | 1   | 0                                               |
| 1   | X   | 0      | Q   | <span style="text-decoration:overline">Q</span> |
| 1   | X   | 1      | Q   | <span style="text-decoration:overline">Q</span> |

### parameters

1. `\WIDTH`: The width of inputs `\D` and output `\Q` ports
2. `\CLK_POLARITY`: Clock is active on the positive edge if this parameter has the value 1’b1 and on the negative edge if this parameter is 1’b0
3. `\ARST_POLARITY`: The asynchronous reset is active-high if this parameter has the value 1’b1 and active-low if this parameter is 1’b0
4. `\ARST_VALUE`: The state of \Q will be set to this value when the reset is active
