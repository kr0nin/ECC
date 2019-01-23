%
% Erich Kroneberger
%

function R_dupe=ECpt_dupe(pntG,ECparam,p)

if pntG(1) == 0
    R_dupe = Inf;
    
elseif pntG(1) ~= 0 
    % slope numerator
    s_dupe_numerator = (3*pntG(1)^2+ECparam(1));
    s_dupe_numerator_mod = mod(s_dupe_numerator,p);

    % slope denominator external call
    s_dupe_den = mulinv((2*pntG(2)),p); %%external call

    % slope combine
    s_dupe = s_dupe_numerator_mod * s_dupe_den;
    s_dupe_mod = mod(s_dupe,p);

    % x coord
    Rx_dupe = s_dupe_mod^2 - 2*pntG(1);
    Rx_dupe_mod = mod(Rx_dupe,p);

    % y coord
    Ry_dupe = s_dupe_mod*(pntG(1)-Rx_dupe_mod) - pntG(2);
    Ry_dupe_mod = mod(Ry_dupe,p);

    R_dupe = [Rx_dupe_mod Ry_dupe_mod];
end
