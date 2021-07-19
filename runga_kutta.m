syms func(x,y)
func(x,y) = (y/x) - (y/x).^2;
a = 1;
b = 2;
h = 0.01;
y_a = 1;
y_b = runge_kutta(a,b,h,y_a,func);
disp('Value at x=2:');
disp(y_b);

function y_b = runge_kutta(a,b,h,y_a,func)
i = 1;
iter = (b-a)/h;
x = zeros(size(iter+1));
y = zeros(size(iter+1));
x(i) = a;
y(i) = y_a;
while i < iter+1
K_1 = h*func(x(i),y(i));
K_2 = h*func(x(i)+(h/2),y(i)+(K_1/2));
K_3 = h*func(x(i)+(h/2),y(i)+(K_2/2));
K_4 = h*func(x(i)+h,y(i)+K_3);
y(i+1) = double(y(i) + (K_1 + 2*K_2 + 2*K_3 + K_4)/6);
x(i+1) = x(i) + h;
i = i+1;
end
y_b = y(i);
plot(x,y);
end