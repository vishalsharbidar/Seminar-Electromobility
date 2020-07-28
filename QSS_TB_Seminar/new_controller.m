%------------------------------------------------------------------------------------------------------------------------------------------------------------
%                                      Rule Based Energy Management Strategy for Parallel Mild Hybrid Vehicle 
%------------------------------------------------------------------------------------------------------------------------------------------------------------
% Controller design for U function
%------------------------------------------------------------------------------------------------------------------------------------------------------------
function u = new_controller(input)

%------------------------------------------------------------------------------------------------------------------------------------------------------------
% Input and other variable declaration
%------------------------------------------------------------------------------------------------------------------------------------------------------------

w_MGB = input(1);             % get flywheel angular velocity
dw_MGB = input(2);            % get flywheel angular acceleration
T_MGB = input(3);             % get flywheel torque
Q_BT = input(4);              % State of charge (SoC)   
i = input (5);                % Gear

global w_EM_max;              % define maximum motor angular velocity (global) 
global T_EM_max;              % define maximum motor torque (global)
Q_BT_IC = 18000;              % define initial SoC (global)
theta_EM = 0.1;               % define motor inertia
epsilon = 0.0158;             % define epsilon 
              
% ------------------------------------------------------------------------------------------------------------------------------------------------------------
% Code for selecting driving cycles : NEDC or FTP-75
% ------------------------------------------------------------------------------------------------------------------------------------------------------------

system_type = get_param(0, 'CurrentSystem');
stop_time = get_param(system_type, 'StopTime');
system_time = str2double(stop_time);

if system_time == 1220
    u_Gen_max = -0.27;                                                                      % define maximum torque-split factor for Generator mode NEDC
    u_Mot_max = 0.22;                                                                       % define maximum torque-split factor for Motor mode NEDC
    T_MGB_th = 28;                                                                          % define torque threshold for NEDC (cf. Slide 3-8
    
else
    u_Gen_max = -0.12;                                                                      % define maximum torque-split factor for Generator mode FTP-75
    u_Mot_max = 0.01;                                                                       % define maximum torque-split factor for Motor mode FTP-75
    T_MGB_th = 27;                                                                          % define torque threshold for FTP-75 (cf. Slide 3-8)    
end

% ------------------------------------------------------------------------------------------------------------------------------------------------------------
% Main code for selecting modes of operation for better fuel efficiency
% ------------------------------------------------------------------------------------------------------------------------------------------------------------

if (T_MGB >= 0) && (T_MGB <= T_MGB_th) && (Q_BT >= 0.2 * Q_BT_IC)
    u = 1;                                                                                                      % Electric Drive
elseif (T_MGB >= 0) && (T_MGB <= T_MGB_th) && (Q_BT < 0.2 * Q_BT_IC)
	u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);                  % LPS Gen
elseif (T_MGB >T_MGB_th) && (T_MGB <= 100) 
    if (Q_BT <= .8 * Q_BT_IC)
        u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);              % LPS Gen
    else 
        u = 0;                                                                                                  % Engine only
    end
elseif (T_MGB > 100) && (Q_BT >= 0.5 * Q_BT_IC)
    u = min((interp1(w_EM_max,T_EM_max,w_MGB)-abs(theta_EM*dw_MGB)-epsilon)/T_MGB,u_Mot_max);                   % LPS Motor
elseif (T_MGB > 100) && (Q_BT < 0.5 * Q_BT_IC)
	u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);                  % LPS Gen
else 
    u = min((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,1);                          % Regeneration  
end





                                                                                         

                                                                                          

