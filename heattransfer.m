v_H2_in=0.000000017; % Volumetric flow rate (m3/2)
r=0.001;        %Channel radius (m)
A=0.5*pi*r^2;   %Area of flow channel
u_m=v_H2_in/A;  %Mean velocity (m/s)
H=0.002;        %Channel height (m)
T_i=-295;       %Input gas temperature (K)
rho=0.08988;    %Density (kg/m^3)
mu=8.6e-6;      %Viscosity (Pa-s)
k=0.1805;       %Conductivity (W/mK)
c=14304;        %Secific Heat Capacity
T_s=352;        %Plate temperature
L=0.00635;      %Length of channel (m)
W=0.00635;      %Unit Length (depth) (m)
N=6;
Dy=H/N;

for i=1:N
    y(i)=Dy*(i-1/2);
end

%Velocity
for i=1:N
    u(1)=6*u_m*(y(i)/H-(y(i)/H)^2);
end
OPTIONS=odeset('RelTol',1e-6);
[x,T]=ode45(@(x,T) dTdx_functionv(x,T,Dy,k,rho,c,u,T_s),[0,L],T_in*ones(N,1),OPTIONS);
[M,g]=size(T);
T_mean(j)=sum(T(j,:).*u)*Dy/(H*u_m);
qf(j)=k*(T_s-T(j,1))/(Dy/2);
htc(j)=qf(j)/(T_s-T_mean(j));
for j=1:M
     Nusselt(j)=htc(j)*2*H/k;
end

%Plot heat distribution in the channel
Plot(y,T);
xlabel('Axial Position (m)');
ylabel('Temperature (K)');
function[dTdx]=dTdx_functionv(x,T,Dy,k,rho,c,u,T_s)
[N,g]=size(T);                    %Determine number of nodes
dTdx=zeros(N,1);                   %Initailize dTdx
dTdx(1)=k*(T(2)+2*T_s-3*T(1))/(rho*c*Dy^2*u(1));
for i=2:(N-1)
    dTdx(i)=k*(T(i+1)+T(i-1)-2*T(i))/(rho*c*Dy^2*u(i));
end
dTdx(N)=k*(T(N-1)+2*T_s-3*T(N))/(rho*c*Dy^2*u(N));
end
