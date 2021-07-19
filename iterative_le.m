
disp('PART: A');
disp('Gauss-Seidel method');
A = [10,1;1,10]; %% input A here
b = [11;11];                %% input b here
X_not = [double(1/2);double(1/2)];
Y = seidel(A,b,X_not);
disp(Y);

disp('PART: B');
disp('Gauss Jacobi method');
A = [4,1,-1;2,7,1;1,-3,12]; %% input A here
b = [3;19;31];                %% input b here
X_not = [0;0;0];
X = jacobi(A,b,X_not);
disp(X);

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
while max_err > 10.^(-4)
    for i = 1:n
        X(i) = A(i,:)*(X_not)+b(i);
        err = abs(X - X_not);
        X_not(i) = X(i);
    end 
    max_err = max(err);
end
end

function X  = jacobi(A,b,X_not)
n = size(A,1);
for i = 1:n
   temp = A(i,i);
   b(i) = b(i)/temp;
   for j = 1:n
       if i==j
           A(i,j) = 0;
       else 
           A(i,j) = -A(i,j)/temp;
       end
   end
end
X = X_not;
for i = 1:100
X = A*(X_not) +b;
X_not = X;
end
end

