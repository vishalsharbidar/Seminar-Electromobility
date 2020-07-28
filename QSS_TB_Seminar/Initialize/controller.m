 
function u = controller(input) 
w_MGB = input(1); dw_MGB = input(2); T_MGB = input(3); % get inputs 
global w_EM_max; global T_EM_max;                      % define global variables 
theta_EM = 0.1;                                        % define motor inertia 
T_MGB_th = 60;                                         % define torque threshold for NEDC (cf. 3-8) 
% T_MGB_th = 39.5;                                     % define torque threshold for FTP-75 (cf. 3-8) 
epsilon = 0.01;                                        % define epsilon (cf. 3-8/3-10) 
u_LPS_max = 0.3;                                       % define max. torque-split factor for LPS (3-8) 
if T_MGB < 0                                           % regeneration (cf. 3-10) 
    u = min((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,1); 
elseif T_MGB >= T_MGB_th                               % load point shifting (cf. 3-8) 
    u = min((interp1(w_EM_max,T_EM_max,w_MGB)-abs(theta_EM*dw_MGB)-epsilon)/T_MGB,u_LPS_max); 
else                                                   % engine only 
    u = 0; 
end; 