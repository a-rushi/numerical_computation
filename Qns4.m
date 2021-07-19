%{ 
QNS 4 
%}
syms fnc(x) deriv(x)
fnc(x) = tanh(x);
a = -10;
b = 15;
s = 0.1;
h = 0.000001;
x_not = (b+a)/2;
int = b-a;
acc = 10.^(-10);
deriv(x) = (fnc(x+h) - fnc(x))/h;
if fnc(a)*fnc(b) >0
   disp("Zero not possible in the set provided"); 
end
while abs(fnc(x_not)) >= acc && (b-a) > s*(int)
if fnc(x_not)*fnc(a)< 0
    b = x_not;
    x_not = (b+a)/2;
else
    a = x_not;
    x_not = (b+a)/2;
end
end

if abs(fnc(x_not)) > acc && (b-a) <= s*(int)
    while deriv(x_not) ~= 0 && abs(fnc(x_not)) >= acc 
        x_iter = x_not - (fnc(x_not)/deriv(x_not));
        x_not = x_iter;
    end
end
disp(double(x_not));