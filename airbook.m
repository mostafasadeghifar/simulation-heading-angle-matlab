clc
clear 
close all

global k m
k=0.01;
m=6;
v0=75;

teta_deg = 44;
y0 = [0 0 v0*cos(teta_deg*pi/180) v0*sin(teta_deg*pi/180)];
T= [0 10];

options = odeset('RelTol',1e-4,'AbsTol',1e-5);
[t,y] = ode45(@fdot,T,y0,options);

plot(y(:,1),y(:,2)),grid
axis([0 max(y(:,1)) 0 max(y(:,2))+10]);


hold on

xt0 = 400;
yt0=80;
vt=20;
for i=1:15
    xt(i) = -vt*i+xt0;
    yt(i) = yt0;
    if xt(i)==0
        break;
    end
end
plot(xt,yt);
% 
%   
 
 XProjectile=0;
 YProjectile=0;
 h=plot(XProjectile,YProjectile,'LineWidth',7,'Marker','o');
 
  ht=plot(XProjectile,YProjectile,'r');
 
 axis equal
for i=1:length(y(:,1))
      h.XData=y(i,1);
      h.YData=y(i,2);
      
      ht.XData=y(1:i,1);
      ht.YData=y(1:i,2);

      if y(i,2)==79.205952629473320
          break
      end
      refreshdata(h,'caller')
      drawnow
      title('Animation of the projectile motion')
       xlim([0 500])
       ylim([0 200])
     pause(.1)
end





