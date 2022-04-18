m=94;
A=pi*(.21)^2;
C=.12;
p0= 1.225;
g=9.81;
%Initial Conditions
dt= .001;
x=0;
y=0;
v=10000; 
angle=20 ;
vx=v*cosd(angle);
vy=v*sind(angle);
t=0 ;
y0 = 1000;
i=1;
% Half step
p = p0*exp(-y/y0);
Dx = C*(p*vx^2)/2*A;
Dy = C*(p*vy^2)/2*A;
ax = -Dx/m;
ay = -g-Dy/m;
while y(i) >= 0
    i = i+1;
    vx(i) = vx(i-1)+ax(i-1)*dt;
    vy(i) = vy(i-1)+ay(i-1)*dt;
    
    x(i) = x(i-1)+(vx(i-1)+vx(i))/2*dt;
    y(i) = y(i-1)+(vy(i-1)+vy(i))/2*dt;
    
    p = p0*exp(-y(i)/y0);
    Dx = C*(p*vx(i)^2)/2*A;
    Dy = C*(p*vy(i)^2)/2*A;
    ax(i) = -Dx/m;
    if vy(i)>0
        ay(i) = -g-Dy/m;
    else
        ay(i) = -g+Dy/m;
    end
end
figure;
plot(x,y,'-')
xlabel('x distance (m)')
ylabel('y distance (m)')