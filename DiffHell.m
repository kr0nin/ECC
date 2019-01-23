
%Enter Public Information
disp('Enter public key information:')
disp(' ')
ECp=input(' EC parameters [abcd] ');
disp (' ')
p=input(' Prime number p = ');


%Check Primality
if isprime(p)==0
  error('Input is not prime')
end

disp(' ')
P=input(' Point P [Px Py] = ');
Px=P(1);
Py=P(2);


%Verify that point P is on the EC
PECflag=isecptmod(Px, Py, ECp(1), ECp(2), ECp(3), ECp(4), p);
if PECflag==O
  error('Point P does not lie on the specified Elliptic Curve')
end

disp(' ')
disp('Enter Private Information:')
a=input(' Natural Number a=');

%Perform A=aP calculations
[Ax, Ay]=elcmultmod(a, Px, Py, ECp(1), ECp(2), ECp(3), ECp(4), p);
A=[Ax, Ay];
disp('Send the following EC point to counterpart')
fprintf(' A = [%3d %3d ]\n\n', Ax, Ay)

%Enter Recieved data
disp('Enter EC point recieved from counterpart')
B=input(' Point B = [Bx By] = ');
Bx=B(1);
By=B(2);

%Verify that point B is on the EC
BECflag=isecptmod(Bx, By, ECp(1), ECp(2), ECp(3), ECp(4), p);
while ~BECflag
  disp ('Point B does not lie on the specified EC;')
  disp ('Enter new Point B value:')
  B=input ('Point B = [Bx By] = ');
  Bx=B(1);
  By=B(2);
  BECflag=isecptmod(Bx, By, ECp(1), ECp(2), ECp(3), ECp(4), p);
end

%Calculate Key K
[Kx, Ky]=elcmultmod(a, Bx, By, ECp(1), ECp(2), ECp(3), ECp(4), p);
K=[Kx, Ky];

%Output Key K
fprintf('The key is K = [%3d %3d ]\n\n', Kx, Ky)