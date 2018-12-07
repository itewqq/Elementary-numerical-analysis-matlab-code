function  iterMult(A,u,KM,eps)
%u is a colum vector
k=0;r1=0;
while k<KM
    k=k+1;
    v=A*u;
    r2=norm(v,Inf);
    u=v/r2;
    if(abs(r1-r2)<eps) break;
    end
    r1=r2;
end

if k >= KM
    fprintf('The Methond is disconvergent\n');
else
    fprintf('r = %f \n',r2);
    for i= 1:length(u)
        fprintf('x[%d]= %f\n',i,u(i));
    end
end

end

