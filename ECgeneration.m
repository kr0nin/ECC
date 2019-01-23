%
% Erich Kroneberger
%
% y^2 = x^3 +2x +2 mod(17)
%
% function R_add=ECpt_add(pntP,pntQ,p)
% function R_dupe=ECpt_dupe(pntG,ECparam,p)
% function y=mulinv(x,p)
%

%Enter Public Information
disp('Enter public key information:')
disp(' ')
ECparam=input(' EC parameters [a b] ');
disp (' ')
p=input(' Prime number p = ');
disp(' ')
%Check Primality
if isprime(p)==0
  error('Input is not prime')
end
disp('Enter generator point G:')
disp(' ')
pntG=input(' [x y] ');
disp(' ')

pntG1 = pntG;
n=1;
MSG=['G ',num2str(n),' = ',num2str(pntG1)];
disp(MSG)
pntG = ECpt_dupe(pntG,ECparam,p);
n=n+1;
MSG=['G ',num2str(n),' = ',num2str(pntG)];
disp(MSG)

while pntG ~= Inf
    pntG = ECpt_add(pntG,pntG1,p);
    n=n+1;
    MSG=['G ',num2str(n),' = ',num2str(pntG)];
    disp(MSG)
end