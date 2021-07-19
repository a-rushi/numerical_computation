%{ 
QNS 2
%}
syms fnc(x) deriv(x)  
fnc(x) = x.^4 - 16*(x.^3) + 89*(x.^2) - 194*x + 120;
x_not = 1.5;
acc = exp(-10);
deriv(x) = (fnc(x+fnc(x)) - fnc(x))/fnc(x);
i = 1;
while deriv(x_not) ~= 0 && abs(fnc(x_not)) >= acc 
x_iter = double(x_not - fnc(x_not)/deriv(x_not));
e(i) = abs(x_iter - x_not);
if i >= 3
    p = log(e(i)/e(i-1))/log(e(i-1)/e(i-2));
    format long;
    disp(double(p));
end
x_not = x_iter;
i = i + 1;
end
disp(double(x_not));
