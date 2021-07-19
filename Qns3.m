%{ 
QNS 3
%}
syms f(x)
f(x) = x.^4 - 16*(x.^3) + 89*(x.^2) - 194*x + 120;  % f(x) is same as previous question
k = 1;
u(k) = 0; % change u(0) here
v(k) = 2; % change v(0) here
while k <= 10 && f(v(k)) ~= f(u(k)) 
   w(k) = (u(k)*f(v(k)) - v(k)*f(u(k)))/(f(v(k))-f(u(k))); 
   if f(w(k))*f(u(k)) > 0
       u(k+1) = w(k);
       v(k+1) = v(k);
   else 
       u(k+1) = u(k);
       v(k+1) = w(k);
   end
   k  = k +1;
end
disp("Array containing the value of f(u(k))");
disp(double(f(u)));
disp("Array containing the value of f(v(k))");
disp(double(f(v)));
