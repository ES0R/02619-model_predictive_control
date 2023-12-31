function z = FourTankSystemOutput(x,p)
% Syntax: z = FourTankSystemOutput(x,p)
% Extract states and parameters
m = x(1:2,1);
A = p(5:6,1);
rho = p(12,1);
% Compute level in each tank
rhoA = rho*A;
z = m./rhoA;