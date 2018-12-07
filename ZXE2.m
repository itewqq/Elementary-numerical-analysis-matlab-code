function  ZXE2(ax,y)
m=1;
x=ax.^2;
S=zeros(1,2*m+1);T=zeros(m+1,1);
for k=1:2*m+1
    S(k)=sum(x.^(k-1));
end
for k=1:m+1
    T(k)=sum(x.^(k-1).*y);
end
A=zeros(m+1,m+1);a=zeros(m+1,1);
for i=1:m+1
    for j=1:m+1
        A(i,j)=S(i+j-1);
    end
end
a=A\T;
fprintf('a= %f   b=%f\n',a(1),a(2));
end

