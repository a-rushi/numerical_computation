%{
On evaluating the integral provided, the value comes out to be 2*arctan(4)
= 2.6516. This is closest to the numerical integral obtained from
composite trapezoidal rule  and then composite simpson's rule. The value
evaluated by trapezoidal rule is  too small and one obtained by simpson's
rule is to big,to be of any use. 

Guassian quadrature is a method that works well for polynomials. More precisely, 
the two point guassian-legendre quadrature is exact for all polynomials of
degree <=5. Since, the given function is not a polynomial, the ans obtained
is off. Trapezoidal rule does not give good approximations when (b-a) is
large or f(x) is not linear.
%}
syms func(x)
func(x) = 1/(1+(x.^2));
a = -4;
b = 4;
n = 10;
disp('PART: A'); 
disp('Trapezoidal rule');
A = trape(a,b,func);
disp(A);

disp('PART: B');
disp('Simpson’s rule');
B = simp(a,b,func);
disp(B);

disp('PART: C');
disp('a) Composite trapezoidal rule');
C = comp_trape(a,b,func,n);
disp(C);

disp('b) Composite simpson’s rule');
D = comp_simp(a,b,func,n);
disp(D);

disp('PART: D');
disp('Gauss-Legendre quadrature');
E = guass(a,b,func);
disp(E);


disp('Comparing values with above parts:');
disp('a)');
disp(E-A);
disp('b)');
disp(E-B);
disp('c)');
disp(E-C);
disp(E-D);

function intg = trape(a,b,func)
x = (b-a)/2;
intg = x*(double(func(a) + func(b)));
end

function intg = comp_trape(a,b,func,n)
h = (b-a)/n;
s = double(func(a)/2);
for i = 1:(n-1)
    x  = a + i*h;
    s = s + double(func(x));
end
s = s + double(func(b)/2);
intg = h*(s);
end

function intg = simp(a,b,func)
h = (b-a)/2;
s = double(func(a) + 4*func((a+b)/2) + func(b));
intg = (h/3)*(s);
end

function intg = comp_simp(a,b,func,n)
h = (b-a)/n;
s = double(func(a));
for i = 1:2:(n-1)
    x  = a + i*h;
    s = s + double(4*func(x));
end
for i = 2:2:(n-2)
    x  = a + i*h;
    s = s + double(2*func(x));
end
s = s + double(func(b));
intg = (h/3)*(s);
end

function intg = guass(a,b,func)
x = (b-a)/(2*(3^(1/2)));
y = (a+b)/2;
intg = double(((b-a)/2)*(func(x+y) + func(y-x)));
end