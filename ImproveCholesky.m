function [x]=ImproveCholesky(A,b)
[~,n]=size(A);
L=zeros(n,n);
D=diag(n,0);
S=L*D;
for i=1:n
    L(i,i)=1;
end
for i=1:n                            
    for j=1:n
        if (eig(A)<=0)|(A(i,j)~=A(j,i))
            disp('wrong');break;
        end
    end
end
D(1,1)=A(1,1);
for i=2:n
   for j=1:i-1
       S(i,j)=A(i,j)-sum(S(i,1:j-1)*L(j,1:j-1)');
       L(i,1:i-1)=S(i,1:i-1)/D(1:i-1,1:i-1);
   end  
   D(i,i)=A(i,i)-sum(S(i,1:i-1)*L(i,1:i-1)');
end
y=zeros(n,1);
x=zeros(n,1);
for i=1:n
   y(i)=(b(i)-sum(L(i,1:i-1)*D(1:i-1,1:i-1)*y(1:i-1)))/D(i,i);  
end
for i=n:-1:1  
    x(i)=y(i)-sum(L(i+1:n,i)'*x(i+1:n));                       
end
