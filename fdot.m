function dy = fdot(t,y)
global k m
dy = zeros(4,1);
dy(1) = y(3);
dy(2) = y(4);
dy(3) = -k*y(3)*sqrt(y(3)*y(3)+y(4)*y(4))/m;
dy(4) = -k*y(4)*sqrt(y(3)*y(3)+y(4)*y(4))/m-9.8;