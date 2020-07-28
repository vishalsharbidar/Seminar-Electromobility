% if (T_MGB >= 0) && (T_MGB < T_MGB_th) && (Q_BT >= 0.2 * Q_BT_IC)
%     u = 1;                                                                                                      % ED
% elseif (T_MGB > T_MGB_th) && (T_MGB < 90) 
%     if (Q_BT <= .8 * Q_BT_IC)
%         u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);              % LPS Gen
%     else 
%         u = 0;                                                                                                  % Engine only
%     end;
% elseif (T_MGB > 90) && (Q_BT > 0.5 * Q_BT_IC)
%     u = min((interp1(w_EM_max,T_EM_max,w_MGB)-abs(theta_EM*dw_MGB)-epsilon)/T_MGB,u_Mot_max);                   % LPS Motor
% else 
%     u = min((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,1);                          % Regeneration  
% end;

% if (T_MGB >= 0)    
%     if (Q_BT >= batteryFactor * Q_BT_IC)
%         if ((w_MGB >= 0) && (w_MGB <=160) && (T_MGB<=27))
%             u = 1;                                                                                      %ED
%         elseif (((w_MGB > 160) && (w_MGB <= 229)) && ((T_MGB>27) && (T_MGB<T_MGB_th)) && (Q_BT < 0.7 * Q_BT_IC))
%             u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);  %LPS Gen
%         elseif (T_MGB < 27) %if (((w_MGB > 160) && (w_MGB <= 229)) && (T_MGB > 50))            
%             u = min((interp1(w_EM_max,T_EM_max,w_MGB)-abs(theta_EM*dw_MGB)-epsilon)/T_MGB,u_Mot_max);   %LPS Motor
%         else
%             u = 0;            
%         end                    
%     else
%         if ((w_MGB >= 0) && (w_MGB <=160) && (T_MGB<=27))                                               %ED
%             u = 1;
%         else
%             u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);  %LPS Gen                                                                                     %CD
%         end
%     end    
% else
%     u = min((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,1);                  %Regeneration
% end
% 
% if (T_MGB >= 0)    
%      if (Q_BT >= batteryFactor * Q_BT_IC)
%          if (T_MGB < 45)
%               u = 1;                                                                                                 %ED
%         elseif ((T_MGB>45) && (T_MGB < T_MGB_th)) && (Q_BT < 0.7 * Q_BT_IC)
%             u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);               %LPS Gen
%         elseif  (T_MGB > T_MGB_th)             
%             u = min((interp1(w_EM_max,T_EM_max,w_MGB)-abs(theta_EM*dw_MGB)-epsilon)/T_MGB,u_Mot_max);                %LPS Motor
%         else
%             u = 0;
%          end
%      else
%             u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);  %LPS Gen                                                                                     %CD
%       end    
% else
%     u = min((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,1);                  %Regeneration
% end

%  if (T_MGB >= 0) && (T_MGB <= T_MGB_th) && (Q_BT >= 0.2 * Q_BT_IC)
%     u = 1;                                                                                                      % ED
% elseif (T_MGB >= 0) && (T_MGB <= T_MGB_th) && (Q_BT < 0.2 * Q_BT_IC)
% 	u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);
% elseif (T_MGB >T_MGB_th) && (T_MGB < 90) 
%     if (Q_BT <= .8 * Q_BT_IC)
%         u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);              % LPS Gen
%     else 
%         u = 0;                                                                                                  % Engine only
%     end
% elseif (T_MGB >= 90) && (Q_BT >= 0.5 * Q_BT_IC)
%     u = min((interp1(w_EM_max,T_EM_max,w_MGB)-abs(theta_EM*dw_MGB)-epsilon)/T_MGB,u_Mot_max);                   % LPS Motor
% elseif (T_MGB >= 90) && (Q_BT < 0.5 * Q_BT_IC)
% 	u = max((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,u_Gen_max);
% else 
%     u = min((interp1(w_EM_max,-T_EM_max,w_MGB)+abs(theta_EM*dw_MGB)+epsilon)/T_MGB,1);                          % Regeneration  
%  end
