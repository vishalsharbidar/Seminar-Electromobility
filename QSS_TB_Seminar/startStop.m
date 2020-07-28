function state_CE = startStop(input)

%------------------------------------------------------------------------------------------------------------------------------------------------------------
% Input and other variable declaration
%------------------------------------------------------------------------------------------------------------------------------------------------------------

%w_MGB = input(1);            % get flywheel angular velocity
%dw_MGB = input(2);           % get flywheel angular acceleration
%T_MGB = input(3);            % get flywheel torque
%i = input (4);               % Gear number
u = input(1);



if(u == 1)
    state_CE = 0;
else
    state_CE = 1;
end;
       
    
    