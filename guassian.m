
%{
    QNS 1: Guassian elimination method to solve Ax = b
%}
A = [1,1,-1;1,2,-2;-2,1,1]; %% input A here
b = [1;1;1];                %% input b here
[L,U,X] = gua_elim(A,b);

disp('PART: A');
disp('As we can see');
disp(' L*U = ');
disp(L*U);
disp(' is equal to A =');
disp(A);

disp('PART: B');
disp(' The vector X satisfying the linear system of equation is  ');
disp(X);
function [L,U,X] = gua_elim(A,b)
n = size(A,1);
L = zeros(size(A));
U = L;
X = zeros(size(b));
%swap = zeros((n-1),2);
for i = 1:(n-1)
    L(i,i) = 1;
    %[mx,ind] = max(A(i:n,i));
    %ind = ind + (i-1);
    %temp = A(i,:);
    %A(i,:) = A(ind,:);
    %A(ind,:) = temp;
    %temp = b(i);
    %b(i) = b(ind);
    %b(ind) = temp;
    %swap(i,:) = [i,ind];
    for j = (i+1):n
        L(j,i) = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - L(j,i)*A(i,:);
        b(j) = b(j) - L(j,i)*b(i);
    end
end
L(n,n) = 1;
U = A;

X(n) = b(n)/U(n,n);
for i = (n-1):-1:1
    s = 0;
    for j = (i+1):n
        s = s + U(i,j)*X(j);
    end
    X(i) = (b(i) - s)/U(i,i);
end
%{
for i = (n-1):-1:1
    temp = X(swap(i,1));
    X(swap(i,1)) = X(swap(i,2));
    X(swap(i,2)) = temp;
end
%}
end
