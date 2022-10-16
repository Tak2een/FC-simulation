F=96485; %Faraday's constant
R=8.314; %Universal gas constant
T_in=333.15; %Inlet Temperature (K)
P_in=101325; %Inlet Pressure (Pa)
psi=1; %Relative Humidty
P_sat=19944; %saturation Pressure (Pa)
N_cell=1; %Number of cells in stack
wc=0.1; %channel width (cm)
dc=0.1; %channel depth (cm)
A_cell=100; %Active cell area(cm^2)
N_ch=1:50; %Number of parallel channels
wl=0.1; %Space between channels
be=4; %Number of bends
n=4; %Cathode
i=0.7; %Cell current (A/cm^2)
I=i*A_cell; %Stack current (A/cm^2)
S_O2=1; %Stoichiometric ration for O2
x_O2=0.21; %O2 constant in the air
A_ch=wc*dc; %channel area
M_air=29; %MOlecular weight of air
M_H2O=18; %Molecular weight of water
u=0.0002; %Viscosity (g/cms)

%Calcuate Pressure Drop in flow channels 
%Hydraulic diameter
%Dh=(4.Ac)./P_cs; %circular flowfield
Dh=(6.19)./(wc+0.986) %rectanggular flowfield

%Channel length
Lc=A_cell./(N_ch.*(wc+wl));

%Flow rate at the fuel cell stack entrance (anode)
Q_stack=(I./(n*F)).*(S_O2./x_O2).*((R.*T_in)./(P_in-(psi.*P_sat))).*N_cell; %m^3/s
Q_stack1=Q_stack.*1000000; %convert to cm^3/s

%Velocity in a fuel cell channel at the channel enterance
v=Q_stack1./((N_cell).*N_ch.*A_ch); %cm/s

%Reynold's number at the channel entrance
R1=8314;
den=(((P_in-P_sat)*M_air)+(P_sat*M_H2O))./(R1*T_in); %kgm^3
den1=den./1000; %convert to gcm^3
Re=(den1.*v.*Dh)./u;

%Frictopn Factor
f=56./Re; %for rectanglar fields

%Pressure Drop
Lc1=Lc./100;
Dh1=Dh./00;
v1=v./100;
kl=be.*30.*f;
P=(f.*(Lc1./Dh1).*den.*((v1.^2)./2))+(kl.*den.*((v1.^2)./2));
P_atm=P.*9.86923e-1; %Convert from Pa to atm

