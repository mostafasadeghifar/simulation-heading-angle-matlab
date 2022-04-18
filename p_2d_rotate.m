clc
clear
close all

% sample data
h =18;
vt=20;
x0t=120;
vp=75;
g=9.8;   %m/s^2


syms t landa
eq1 = vp*cos(landa)*t == -vt*t+x0t;
eq2 = -0.5*(g)*(t^2)+(vp*sin(landa)*t)==h;
[landa,tfal]=vpasolve(eq2,eq1);
landa = mod(rad2deg(double(landa)),360);
tfal = double(tfal);

t = 0:0.1:tfal;
h = h*ones(1,length(t));
xt = -vt*t+x0t;
teta = rad2deg(atan(h./xt));

x_p = vp*cosd(landa)*t;
y_p = -0.5*(g)*(t.^2)+(vp*sind(landa)*t);

% plot(xt,h,x_p,y_p)
%%

a = zeros(2,1);
c = zeros(2,1);

for i=1:length(t)
%     X = [0,0;xt(i),h(i)];
%     e = pdist(X,'euclidean')
    b = [cosd(teta(i)) sind(teta(i));-sind(teta(i)) cosd(teta(i))]*[xt(i);h(i)];
    a = [a,b];
    
    
    
    d =  [cosd(teta(i)) sind(teta(i));-sind(teta(i)) cosd(teta(i))]*[x_p(i);y_p(i)];
    c = [c,d];
    
end

a(:,1) = [];
x_hat_t = a(1,:);
y_hat_t = a(2,:);
% y_hat_t = y_hat_t*0;


c(:,1) = [];
x_hat_p = c(1,:);
y_hat_p = c(2,:);
plot(x_hat_t,y_hat_t,x_hat_p,y_hat_p)
















