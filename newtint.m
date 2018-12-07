function newtint(x,y,xhat)
n=length(y);
c=y(:);
for j=2:n
    for i=n:-1:j
        c(i)=(c(i)-c(i-1))/(x(i)-x(i-j+1));
    end
end
yhat=c(n);
for i=n-1:-1:1
    yhat=yhat*(xhat-x(i))+c(i);
end
d=zeros(n,n);
d(:,1)=y';
for i=2:n
    for j=n:-1:i
        d(j,i)=d(j,i-1)-d(j-1,i-1);
    end
end
fprintf('diiffrention table\n');
d
fprintf('\nN(%f)=%f\n',xhat,yhat);
end

