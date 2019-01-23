% Enter Public Information
% disp('Enter generator point G:')
% disp(' ')
% pntG=input(' [x y] ');
% disp('Enter point P:')
% disp(' ')
% pntP=input(' [x y] ');
% disp('Enter point Q:')
% disp(' ')
% pntQ=input(' [x y] ');
% disp('Enter EC information:')
% disp(' ')
% ECparam=input(' EC parameters [abcd] ');
% disp (' ')
% p=input(' Prime number p = ');
%Calc slope for addition

function R=ECCpt_add(pntP,pntQ)

s_add=(pntP(2)-pntQ(2))/(pntP(1)-pntQ(1));
%disp(' ')
%disp(s)

%Calc R for addition
Rx=(s_add^2-(pntP(1)+pntQ(1)));
Ry=(s_add*(pntP(1)-Rx) -pntP(2));
R=[Rx Ry;

%point doubling
%s_dupe=(3*pntP(1)+ECparam(1) / 2*pntP(2));


