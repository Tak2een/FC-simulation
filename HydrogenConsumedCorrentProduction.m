%Inputs
R=0.082; %ideal gas constant (Latm/molK)
T=333.15; %Temperature
dV_dt=5; %Volumetric flow rate (L/min)
P=3; %atm
n=2; %mol e- per mole fuel
F=96487; %Faraday's constant
t=120*3600 %Convert to seconds

%Convert volumetric flow rate to molar flow rate
dN_dt=P*dV_dt/(R*T);

%Calculate the total current
i=n*F*dN_dt*(1/60)

%Total amount of electricity produced
Q=i*t

%The total number of moles of hydrogen
N_H2=Q/(n*F)
