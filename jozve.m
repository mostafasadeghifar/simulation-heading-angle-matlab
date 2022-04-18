clc
clear 
close all

vt=30;
x0t=120;
fi_t=140;
vp=150;
g=9.8;

fi_t=180-fi_t;
syms t fi_m
eq1 = (vp*cos(fi_m)*t)==-(vt*cosd(fi_t)*t)+x0t;
eq2 = -0.5*(g)*(t^2)+(vp*sin(fi_m)*t)==-0.5*(g)*(t^2)+(vt*sind(fi_t)*t);
[landa,tfal]=vpasolve(eq2,eq1);

if isempty(landa) || double(landa)>1.6
    disp('input data faild');
    return ;
end

tfal = double(tfal);
teta = mod(rad2deg(double(landa)),360);

hight = double(-0.5*(g)*(tfal^2)+(vp*sin(landa)*tfal));

t=linspace(0,tfal,1000);
xt=-vt*cosd(fi_t)*t+x0t;
yt=-0.5*(g)*(t.^2)+(vt*sind(fi_t)*t);

pp=plot(xt,yt);
ylim([0 hight*2])
xlim([0 x0t*2])
hold on
xp=vp*cosd(teta)*t;
yp=-0.5*(g)*(t.^2)+(vp*sind(teta)*t);
plot(xp,yp);
legend('target','projectile');
figure

xprojectile=0;
yprojectile=0;
xtarget=x0t;

h=plot(xprojectile,yprojectile,'LineWidth',7,'Marker','o');
xlabel('x (m)');
ylabel('y (m)');
hold on
hq=plot(xprojectile,yprojectile,'r');


h2=plot(xtarget,0,'LineWidth',3,'Marker','o');
h2q=plot(xtarget,0,'b');

axis equal
for i=1:length(t)
      h.XData=xt(i);
      h.YData=yt(i);
      hq.XData=xt(1:i);
      hq.YData=yt(1:i);
      
      h2.XData=xp(i);
      h2.YData=yp(i);
      h2q.XData=xp(1:i);
      h2q.YData=yp(1:i);
      refreshdata(h,'caller')
      drawnow

      ylim([0 hight*1.8])
      xlim([0 x0t*1.5])
      pause(0.0001)
end
grid on














