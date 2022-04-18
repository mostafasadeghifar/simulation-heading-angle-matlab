clc
clear all
close all

%all the units used are in SI
%change g in the myfunctiony.m to 32.2 to change the units to FPS 
global vx0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Parameters of the projectile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%initial time
t0=0;
%final time
tf=3;
%Initial x
x0=0;
%Initial y
y0=0;
%Initial velocity
v0=50;
% Initial angle of the projectile in radians
alpha=pi/3;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%End parameters of the projectile
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Projection of initial velocity on the x axis
vx0=v0*cos(alpha)
%Projection of initial velocity on the y axis
vy0=15*sin(alpha)
%Time steps
steps=t0:0.01:tf;
%Solving for x
[t,x]=ode45(@myfunctionx,steps,x0)
%Solving for y
[t,y]=ode45(@myfunctiony,steps,[y0;vy0])
figure
subplot(3,1,1)
plot(x,y(:,1))
xlabel('x [m]')
ylabel('y [m]')
subplot(3,1,2)
plot(t,x)
xlabel('Time [sec]')
ylabel('x [m]')
subplot(3,1,3)
plot(t,y(:,1))
xlabel('Time [sec]')
ylabel('y [m]')
figure
subplot(2,1,1)
plot(t,t.*0+vx0)
xlabel('Time [sec]')
ylabel('vx [m/s]')
subplot(2,1,2)
plot(t,y(:,2))
xlabel('Time [sec]')
ylabel('vy [m/s]')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%animate the projectile:
figure
plot(x,y(1))
xlim([min(x) max(x)])
ylim([min(y(:,1)) max(y(:,1))])
XProjectile=0;
YProjectile=0;
hold on
h=plot(XProjectile,YProjectile,'LineWidth',4,'Marker','o','XDataSource','XProjectile','YDataSource','YProjectile');
hold on
% plot([0 0 -50 -50 0],[0 -150 -150 0 0],'LineWidth',4)
%  rectangle('Position',[-50,-150,50,150],'FaceColor',[0 .5 .5],'EdgeColor','b',...
%      'LineWidth',3)
axis equal
for i=1:length(x)
      XProjectile=x(i);
      YProjectile=y(i,1);
     
      refreshdata(h,'caller') 
      
      drawnow
      title('Animation of the projectile motion')
      xlim([min(x) max(x)])
      ylim([min(y(:,1)) max(y(:,1))])
     pause(.001)
end


