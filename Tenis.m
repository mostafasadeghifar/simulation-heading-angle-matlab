 clear 
 close all
 disp('Welcome to the Projectile Motion Plotter');
 disp('This projects the motion for a tennis ball with and without air resistance');
%  Vx = input('Please input the horizontal velocity [m/s]: ');            
%  Vy = input('Please input the vertical velocity [m/s]: '); 
%
v=30;
angle=45;
 Vx=v*cosd(angle);
 Vy=v*sind(angle);
 %Sets up intial conditions
  V = sqrt(Vx^2 + Vy^2);   %Determines V by combining v of both axes 
  G = 9.80665;             %m/s^2 Acceleration due to Gravity       
  DC = 0.8;                %Drag coefficient
  Area = 0.0033;           %m^2 cross section area of a tennis ball
  Mass = 0.057;            %Kg mass of tennis ball
  x(1) = 0;                %intial x postion
  y(1) = 0;                %inital y postion
  xf(1) = 0;               %inital xf postion
  yf(1) = 0;               %intial yf postion
  AP = 1.2;                %kg/m^3 Air Density @ Sea  Level
  D = AP*DC*Area/2;        %constant needed for drag calculations created    
  t(1) = 0;                %sets intial time
  dt = 0.01;               %s set the intervals at which time will be evalutated
  i = 1;                   %sets counter/index
 %Starts a loop for Projectile Motion with Drag    
    while min(y)> -0.01;                                          
       t = t + dt;                                               
       i = i + 1;                                                
       xf(i) = xf(i-1)+ Vx.*dt;                                  
       AxD = - ( D / Mass ) * V * Vx;                            
       AyD = -G - ( D / Mass ) * V * Vy;                         
       Vx = Vx + AxD * dt;                                       
       Vy = Vy + AyD * dt;                                       
       x(i) = x(i-1) + Vx * dt + 0.5 * AxD * dt^2;               
       y(i) = y(i-1) + Vy * dt + 0.5 * AyD * dt^2;               
   end;
 plot(x,y,'b'), hold on;               %plots the Projectile Motion with Drag
 plot(xf,y,'r'), hold off;             %plots the Projectile Motion without Drag
 xlabel('Horizontal Distance (m)');    %labels the x axis "Horizontal Distance (m)"
 ylabel('Vertical Distance (m)');      %Labels the y axis "Vertical Distance (m)"
 title('Projectile Motion Paths');     %Gives a Title "Projectile Motion Paths"