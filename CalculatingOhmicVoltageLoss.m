%Inputs
i=0.7; %Current density (A/cm^2)
A=100 %Area (cm^2)
L=0.0050; %Electrolyte thickness (cm)
sigma=0.1; %conductivity (ohms/cm)
R_elec=0.005; %Electrical resistance (ohms)

%Calculate the total current
I=i*A;

%Calculate the total ionic resistance
R_ohmic=L/(sigma*A);

%Calculation the Ohmic Voltage Loss
V_ohm=1.*(R_elec+R_ohmic)
i=0:0.01:1; %Current range
L1=0.0025; %Electrolyte thickness of 25 microns
L2=0.0050; %Electrolyte thickness of 50 microns
L3=0.0100; %Electrolyte thickness of 100 microns
L4=0.0150; %Electrolyte thickness of 150 microns

%Calculate the total current
I=i*A;

%Calculate the ohmic voltage loss
R_ionic1=L1/(sigma*A); V_ohm1=I.*(R_elec+R_ionic1);
R_ionic2=L2/(sigma*A); V_ohm2=I.*(R_elec+R_ionic2);
R_ionic3=L3/(sigma*A); V_ohm3=I.*(R_elec+R_ionic3);
R_ionic4=L4/(sigma*A); V_ohm4=I.*(R_elec+R_ionic4);

%Plot the ohmic loss and as a function of electrolyte thickness
figure1=figure('Color',[1 1 1]);
hdlp=plot(i,V_ohm1,i,V_ohm2,i,V_ohm3,i,V_ohm4);
title('Ohmic Loss ad a Function of Electrolyte Thickness','FontSize',14,'FontWeight','Bold')
xlabel('Current Density (A/cm^2)','FontSize',12,'FontWeight','Bold');
ylable('Ohmic Loss(v)','FontSize',12,'FontWeight','Bold');
legend('L=0.0025','L=0.0050','L=0.01','L=0.015')
set(hdlp,'LineWidth',1.5);
grid on;