function f=intfun(t,n,k)
% ����˹ϵ���еĻ��ֱ��ʽ
f=1;
for i=[0:k-1,k+1:n]
    f=f.*(t-i);
end