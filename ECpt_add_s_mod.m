%
% Erich Kroneberger
%


function R_add=ECpt_add(pntP,pntQ,p)

if pntP(1)~=pntQ(1)
    %Calc slope for addition
    s_add = (pntP(2)-pntQ(2))/(pntP(1)-pntQ(1));
    s_add_mod = mod(s_add,p);

    %Calc R for addition
    Rx = (s_add_mod^2-(pntP(1)+pntQ(1)));
    Rx_mod = mod(Rx,p);
    Ry = (s_add_mod*(pntP(1) - Rx_mod) - pntP(2));
    Ry_mod = mod(Ry,p);
    R_add = [Rx_mod Ry_mod];

elseif pntP(1)==pntQ(1)
    R_add = Inf;
end