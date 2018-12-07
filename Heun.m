function  Heun(f,a,b,y0,n)

h=(b-a)/n;x=a:h:b;
y=y0*ones(1,n+1);
for j=2:n+1
    yp=y(j-1)+h*f(x(j-1),y(j-1));
    yc=y(j-1)+h*f(x(j),yp);
    y(j)=1/2*(yp+yc);
end
for k=1:n+1
    fprintf('x[%d]= %f    y[%d]= %f\n',k-1,x(k),k-1,y(k));
end

end

