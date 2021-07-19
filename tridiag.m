%{
    QNS 3: Guassian elimination method for tridiagonal system
%}
a =  [0;5;3;2;1]; %input a here
b =  [1;3;4;6;9]; %input b here
c =  [1;1;1;2;0]; %input c here
d =  [3;4;1;1;2]; %input d here

A = [a,b,c]; 
[X,C,D] = tri_dia(A,d); 

disp(' The vector X satisfying the tridiagonal system is: ');
disp(X);

function [X,C,D] = tri_dia(A,d)
n = size(A,1);
disp(n);
C = zeros(n-1,1);
D = zeros(n,1);
X = zeros(n,1);
for i = 1:(n-1)
    if i == 1
        C(i) = A(i,3)/A(i,2);
        D(i) = d(i)/A(i,2);
    else
        C(i) = A(i,3)/(A(i,2) - (A(i,1)*C(i-1)));
        D(i) = (d(i) - (A(i,1)*D(i-1)))/(A(i,2) - (A(i,1)*C(i-1)));
    end
end
i = i +1;
D(i) = (d(i) - (A(i,1)*D(i-1)))/(A(i,2) - (A(i,1)*C(i-1)));

X(n) = D(n);
for i = (n-1):-1:1
   X(i) = D(i) - C(i)*X(i+1); 
end
end