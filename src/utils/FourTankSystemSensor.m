function y = FourTankSystemSensor(x,p)
% Syntax: y = FourTankSystemSensor(x,p)
% Extract states and parameters
m = x;
A = p(5:8,1);
rho = p(12,1);
% Compute level in each tank
rhoA = rho*A;
y = m./rhoA;