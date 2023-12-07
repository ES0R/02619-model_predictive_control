function [ theta ] = parametersMFTS()
%--------------------------------------------------------------------------
%   Author(s):
%       Morten Ryberg Wahlgreen
%       Marcus Krogh Nielsen
%
%   Email:
%       morwa@dtu.dk, mkrni@dtu.dk
%
%--------------------------------------------------------------------------
%   Call:
%       [ theta ] = parametersMFTS()
%
%   Description:
%       parameter function for the modified four-tank system (MFTS).
%
%   Inputs:
%
%   Outputs:
%       theta  	:   parameters
%
%--------------------------------------------------------------------------

%% Define parameters

% Size Defintions
% ...
%
% ...
% size(s)
theta.nx = 4;
theta.nu = 2;
theta.nd = 2;
theta.nw = 0;
theta.ny = 2;
theta.nz = 2;
% ...


% Parameters for the Four Tank System
% ...
%
% ...
% cross-sectional area of drain pipes
a1 = 1.2272;
a2 = 1.2272;
a3 = 1.2272;
a4 = 1.2272;
theta.a = [ a1; a2; a3; a4 ];
% cross-sectional area of tanks
A1 = 380.1327;
A2 = 380.1327;
A3 = 380.1327;
A4 = 380.1327;
theta.A = [ A1; A2; A3; A4 ];
% split-values of input flows
gamma1 = 0.65;
gamma2 = 0.55;
theta.gamma = [ gamma1; gamma2 ];
% gravitational accelration
theta.g   = 981;
% density of liquid
theta.rho = 1.0;
% ...



end