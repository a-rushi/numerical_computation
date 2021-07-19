%{
    QNS 2: To find the conditional number
%}

%{
    To observe:
        1) Classifying A to be ill or well conditioned.
        2) Commenting whether using the particular A used in a set of
        linear equations will cause a small error in b to propogate to a
        relatively huge error in X.
    
   Observations:
        Starting from n = 3 to 6, as all the conditional numbers, using any of the three norms, are huge,
          1) this implies all of these H are ill conditioned.
          2) since, the conditional number is not close to 1, if used in a system of linear eqns, a small 
             error in b will be an amplified error in X.
%}

for i = 3:6  %change range of n here
   H = create_M(i);
   disp('For n = '); disp(i);
   for j = 1:3
       con_no = cond_num(H,j);
       if j ==1 
           disp('The conditional number using column-norm is:');
       elseif j == 2
           disp('The conditional number using Euclidean-norm is:');
       else
           disp('The conditional number using row-norm is:');
       end
       disp(con_no);
   end
end


function maxx = rownorm(A)
n = size(A,1);
c = size(A,2);
maxx = -1;
for i = 1:n
    s = 0;
    for j = 1:c
        s = s + abs(A(i,j));
    end
    if s > maxx
        maxx = s;
    end
end
end

function maxx = colnorm(A)
n = size(A,1);
c = size(A,2);
maxx = -1;
for i = 1:c
    s = 0;
    for j = 1:n
        s = s + abs(A(j,i));
    end
    if s > maxx
        maxx = s;
    end
end
end

function ans = eucnorm(A)
n = size(A,1);
c = size(A,2);
s = 0;
for i = 1:c
    for j = 1:n
        s = s + A(j,i)*A(j,i);
    end
end
ans  = sqrt(s);
end

function con_no = cond_num(A,i)
inv_A = inv(A);
if i ==1 
    nor = colnorm(A);
    in_nor = colnorm(inv_A); 
    con_no = nor*in_nor;
elseif i == 2
    nor = eucnorm(A);
    in_nor = eucnorm(inv_A);
    con_no = nor*in_nor;
else
    nor = rownorm(A);
    in_nor = rownorm(inv_A);
    con_no = nor*in_nor;
end
end

function H = create_M(n)
    H = zeros(n,n);
    for i = 1:n
       for j = 1:n
           H(i,j) = 1/(i+j-1);
       end
    end
end