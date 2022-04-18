clc
clear 
close all

h=18;
vt=20;
x0t=120;
vp=75;
g=9.8;
k=0.01;
m=6;
row = rad2deg(atan(h/x0t));
syms t landa
eq1 = -0.5*((k*vp*cos(landa)*vp)/m)*(t^2)+(vp*cos(landa)*t)+(vt*t-x0t)==0;
eq2 = -0.5*((k*vp*sin(landa)*vp/m)+g)*(t^2)+(vp*sin(landa)*t)-h==0;
[landa,tfal]=vpasolve(eq2,eq1);
tfal = double(tfal);
teta = mod(rad2deg(double(landa)),360);
heading_angle = teta-row
t=linspace(0,tfal,1000);
x=-0.5*((k*vp*cosd(teta)*vp)/m)*(t.^2)+(vp*cosd(teta)*t);
y=-0.5*((k*vp*sind(teta)*vp/m)+g)*(t.^2)+(vp*sind(teta)*t);
pp=plot(x,y);
ylim([0 h*1.2])
xlim([0 x0t*1.2])

xt=-vt*t+x0t;
hold on
z = h * ones(1, length(t));

plot(xt,z);
legend('projectile','target');
grid on

figure

xprojectile=0;
yprojectile=0;
xtarget=x0t;
ytarget=h;

h=plot(xprojectile,yprojectile,'LineWidth',7,'Marker','o');
xlabel('x (m)');
ylabel('y (m)');
hold on
hq=plot(xprojectile,yprojectile,'r');


h2=plot(xtarget,ytarget,'LineWidth',3,'Marker','o');
h2q=plot(xtarget,ytarget,'b');

axis equal
for i=1:length(t)
      h.XData=x(i);
      h.YData=y(i);
      hq.XData=x(1:i);
      hq.YData=y(1:i);
      
      h2.XData=xt(i);
      h2.YData=z(i);
      h2q.XData=xt(1:i);
      h2q.YData=z(1:i);
      refreshdata(h,'caller')
      drawnow

      ylim([0 ytarget*1.2])
      xlim([0 x0t*1.2])
      pause(0.0001)
end
grid on




