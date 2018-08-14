function len2 = sq_norm(x)
% SQ NORM(x) calculates the squared norm of a vector x
n=length(x);
len2=0;
for i=1:n
len2=len2+x(i)*x(i);
end