%{ 
QNS 1 

The following code uses newton's method for calculating the reciprocal for
all a ~= 0. Since, finding the reciprocal is equivalent to finding the zero
of the fucntion 1/x - a, we apply newton's method of the mentioned
function. 

Justifying why newton's method will give us the zero:
x(i+1) = x(i) - f(x)/f'(x) = x(i)(x(i) - 2*(x(i)^2)) = x(i)(2 - a* x(i))

Now since newton-ralphson's method requires us to take the intial x_not, a
value close to actual zero of the function, as otherwise the function won't
converge, I have taken it to be x_not = 0.000001 as I am taking my a to be
67 and it's reciprocal will lie in (0,0.1)

%}
syms fnc(x) deriv(x)
a = 67;                 % CHANGE THE VALUE OF a HERE %
fnc(x) = 1/x - a;
h = 0.001;
x_not = 0.0000001;      % CHANGE THE VALUE OF x_not HERE, BASED ON a %
acc = 10.^(-10);
deriv(x) = (fnc(x+h) - fnc(x))/h;
while deriv(x_not) ~= 0 && abs(fnc(x_not)) >= acc 
x_iter = double(x_not - fnc(x_not)/deriv(x_not));
x_not = x_iter;
end
format long;
disp(double(x_not));
