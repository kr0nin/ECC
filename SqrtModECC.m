function X=SqrtModECC(a, p)

%Check conditions on p
%Check that prime is greater than 2
if p<=2
error('p must be greater than 2: p>2')
end

%Check relative primality of a and p
if gcd(a,p)~=1
  X='E'; %a and p not relatively prime
  return
end

%Check Euler's Criterion
Eu=modexp(a, (p-1)/2, p);
if Eu==(p-1)
  X='E'; %Square root does not exist
  return
elseif Eu~=1
  error('Eu does not equal 1 or negative 1')
end

%Factorise Prime Number
s=0;
e=0;
while rem(s,2)~=1
  e=e+1;
  s=(p-1)/(2^e);
end

%Find suitable n value
n=1;
nres=0;
while nres~=(p-1)
  n=n+1;
  nres=modexp(n, (p-1)/2, p);
end

%Perform Variable Initialization
x=modexp(a,(s+1)/2, p);
b=modexp(a,s,p);
g=modexp(n,s,p);
r=e;

%Primary Calculations
m=1; %Initialise m
while m~=0
  m=0; %Reset m
  bres=b; %Find m
  while bres~=1
    bres=mod(bres^(2),p);
    m=m+1;
  end
  
  %Replace Variables
  xtemp=modexp(2, (r-m-1), p);
  x=mod(x*(modexp(g, xtemp, p)), p);
  temp=modexp(2, (r-m), p);
  gtemp=modexp(g, temp, p);
  b=mod(b*gtemp, p);
  g=gtemp;
  r=mod (m, p) ;
end

X=x;
return