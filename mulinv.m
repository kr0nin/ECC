
function y=mulinv(x,p)

if ~isprime(p)
    disp('The field order is not a prime number');
    return
elseif sum(x>=p)
    disp('All or some of the numbers do not belong to the field');
    return
elseif sum(~x)
    y = 0; %disp('0 does not have a multiplicative inverse');
    return 
end

k=zeros(size(x));   %set the counter array
m=mod(k*p+1,x);     %find reminders
while sum(m)        %are all reminders zero?
    k=k+sign(m);    %update the counter array
    m=mod(k*p+1,x); %caculate new reminders 
end
y=(k*p+1)./x;       %find the multiplicative inverses of X

