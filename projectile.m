clc
clear all
close all

m=300;
A=pi*(.21)^2;
C=.12;
p0= 1.225;
g=9.81;
%Initial Conditions
dt= .001;
x=0;
y=0;
v=30; 
angle=45 ;
vx=v*cosd(angle);
vy=v*sind(angle);
t=0 ;
y0 = 1000;
i=1;
% Half step
p = p0*exp(-y/y0);
D = C*(p*v^2)/2*A;
ax = -D/m;
ay = -g;
while y(i) >= 0
    i = i+1;
    vx(i) = vx(i-1)+ax(i-1)*dt;
    vy(i) = vy(i-1)+ay(i-1)*dt;
    
    x(i) = x(i-1)+(vx(i-1)+vx(i))/2*dt;
    y(i) = y(i-1)+(vy(i-1)+vy(i))/2*dt;
    
    p = p0*exp(-y(i)/y0);
    v = sqrt(vx(i)^2+vy(i)^2);
    D = C*(p*v^2)/2*A;
    ax(i) = -D/m;
    ay(i) = -g;
end
figure;
plot(x,y,'r')
xlabel('x distance (m)')
ylabel('y distance (m)')

% 
hold on

x0 = 100;
y0=20;
v=20;
for ia=1:10
  xa(ia) = -v*ia+x0;
  ya(ia) = y0;
  if xa(ia)==0
     break;
  end
   
end
plot(xa,ya);
