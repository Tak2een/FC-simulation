%Calculating Enthalpy of liquid and vapor mixure
u=400 %internal energy
u_f=334.86 %liquid internal energy
u_g=2482.2 %gas internal energyg
h_f=334.91 %liquid enthalpy
h_g=2643.7 %gas enthalpy
x=(u-u_f)/(u_g-u) 
h=((1-x)*h_f)+(x*h_g) %enthalpy

%Input
T=353;
T_ref=298;
T_av=(T+T_ref)/2;
m_H2=2.016;
m_H2O=
