
syms p(x) q(x) f(x) 
p(x) = @(x) (2*x*x - 7*x + 11);
q(x) = @(x) (x);
f(x) = @(x) (4*x + 9);
a = 0;
bb = 1;
u_a = 0;
u_b = 1;
n = 10;
disp('Boundary Value Problem');
disp('Values of u:');
U = boundary(p,q,f,a,bb,u_a,u_b,n);
disp(U);

function X  = seidel(A,b,X_not)
n = size(A,1);
for i = 1:n
   temp = A(i,i);
   b(i) = b(i)/temp;
   for j = 1:n
       if i==j
           A(i,j) = 0;
       else 
           A(i,j) = double(-A(i,j)/temp);
       end
   end
end
max_err = 1;
X = X_not;
while max_err > 10.^(-7)
    for i = 1:n
        X(i) = A(i,:)*(X_not)+b(i);
        err = abs(X - X_not);
        X_not(i) = X(i);
    end 
    max_err = max(err);
end
end

function U = boundary(p,q,f,a,bb,u_a,u_b,n)
A = zeros(3,n-1);
b = zeros(n-1,1);
h = (bb-a)/n;
for i = 2:(n-1)
    x_i = a + i*h;
    p_i = p(x_i);
    A(i,i-1) = double(-(1 + (p_i*h/2)));
end
for i = 1:(n-1)
    x_i = a + i*h;
    q_i = q(x_i);
    A(i,i) = double(2 + q_i*(h.^2));
end
for i = 1:(n-2)
    x_i = a + i*h;
    p_i = p(x_i);
    A(i,i+1) = double(-(1 - (p_i*h/2)));
end
x_i = a + 1*h;
b(1) = double((1 + (p(x_i)*h/2))*(u_a) + (h.^2)*f(x_i));
for i = 2:(n-2)
    x_i = a + i*h;
    b(i) = (h.^2)*f(x_i);
end
x_i = a + (n-1)*h;
b(n-1) = double((1 - (p(x_i)*h/2))*(u_b) + (h.^2)*f(x_i));
X_not = zeros(n-1,1);
U = seidel(A,b,X_not);
end

