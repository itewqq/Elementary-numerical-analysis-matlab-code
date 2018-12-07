function odeRK4(f,a,b,y0,n)

h=0.1;
x=a:h:b;
y=y0*ones(1,n+1);
for j=2:n+1
    k1=f(x(j-1),y(j-1));
    k2=f(x(j-1)+h/2,y(j-1)+h/2*k1);
    k3=f(x(j-1)+h/2,y(j-1)+h/2*k2);
    k4=f(x(j-1)+h,y(j-1)+h*k3);
    y(j)=y(j-1)+h/6*(k1+k4)+h/3*(k2+k3);
end

for k=1:n+1
    fprintf('x[%d]= %f    y[%d]=  %f\n',k-1,x(k),k-1,y(k));
end

end

