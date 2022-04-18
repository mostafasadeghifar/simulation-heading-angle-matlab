clc
clear
close all
% sample data
yt =18;
vt=20;
x0t=120;
v0p=75;
g=9.8;   %m/s^2 

% yt =input('height of target or yt0 (m)=');
% vt=input('velocity of target(m//s)= ');
% x0t=input('width(x0) (m)= ');
% v0p=input('initial apeed of projectile (m/s)= ');

syms l;
teta=vpasolve(0.5*(-g)*(x0t/(v0p*cos(l)+vt))^2+v0p*sin(l)*(x0t/(v0p*cos(l)+vt))-yt==0,l);
if isempty(teta) || double(teta)>1.6
    disp('input data faild');
    return ;
end
teta = double(teta);     %fire angle with horizon (rad)
tetaDegree = rad2deg(double(teta));  %fire angle with horizon (degree)
row = atan(yt/x0t);                  %los angle (rad)
disp(['heading angle= ',num2str(rad2deg(teta-row)),'degree']);   %Heading angle
tfal=x0t/(v0p*cos(teta)+vt);         % time accident
disp(['t accident= ',num2str(tfal),'second']);

v0x=v0p*cos(teta);
v0y=v0p*sin(teta);

t=linspace(0,tfal,1000);
x=v0x*t;
y=-1/2*g*t.^2+v0y*t;
pp=plot(x,y);
ylim([0 x0t+60])
xlim([0 yt+40])

xt=-vt*t+x0t;
hold on
z = yt * ones(1, length(t));

plot(xt,z);
legend('projectile','target');
grid on
figure

xprojectile=0;
yprojectile=0;
xtarget=x0t;
ytarget=yt;

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

      xlim([0 x0t+30])
       ylim([0 yt+20])
      pause(0.0001)
end
grid on


