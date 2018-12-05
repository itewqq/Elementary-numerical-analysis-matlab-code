function GauseSeidel(A,b,max,eps)
n=length(A);x=zeros(n,1);x1=zeros(n,1);k=0;
while 1
    x1(1)=(b(1)-A(1,2:n)*x(2:n,1))/A(1,1);
    for i=2:n-1
        x1(i)=(b(i)-A(i,1:i-1)*x(1:i-1,1)-A(i,i+1:n)*x(i+1:n,1))/A(i,i);
    end
    x1(n)=(b(n)-A(n,1:n-1)*x(1:n-1,1))/A(n,n);
    k=k+1;
    if sum(abs(x1-x))<eps
        fprintf('number=%d\n',k);
        break;
    end
    if k>=max
        fprintf('The Method is disconvergent\n');
        break;
    end
    x=x1;
end
if k<max
    for i=1:n
        fprintf('x[%d]= %f\n',i,x1(i));
    end
end


end

