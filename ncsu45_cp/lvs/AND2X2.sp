* SPICE NETLIST
***************************************

.SUBCKT AND2X2 A B gnd vdd Y
** N=7 EP=5 IP=0 FDC=6
M0 7 A 2 gnd NMOS_VTL L=5e-08 W=5e-07 AD=7e-14 AS=5.25e-14 PD=1.28e-06 PS=1.21e-06 $X=335 $Y=395 $D=1
M1 gnd B 7 gnd NMOS_VTL L=5e-08 W=5e-07 AD=1.175e-13 AS=7e-14 PD=1.47e-06 PS=1.28e-06 $X=715 $Y=395 $D=1
M2 Y 2 gnd gnd NMOS_VTL L=5e-08 W=5e-07 AD=5.25e-14 AS=1.175e-13 PD=1.21e-06 PS=1.47e-06 $X=1285 $Y=395 $D=1
M3 2 A vdd vdd PMOS_VTL L=5e-08 W=5e-07 AD=7e-14 AS=5.25e-14 PD=1.28e-06 PS=1.21e-06 $X=335 $Y=2580 $D=0
M4 vdd B 2 vdd PMOS_VTL L=5e-08 W=5e-07 AD=1.575e-13 AS=7e-14 PD=2.49e-06 PS=1.28e-06 $X=715 $Y=2580 $D=0
M5 Y 2 vdd vdd PMOS_VTL L=5e-08 W=1e-06 AD=1.05e-13 AS=1.575e-13 PD=2.21e-06 PS=2.49e-06 $X=1305 $Y=2580 $D=0
.ENDS
***************************************
