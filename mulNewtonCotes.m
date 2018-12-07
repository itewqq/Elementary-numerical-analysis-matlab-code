function y=mulNewtonCotes(fun,a,b,m,n)
% 复化Newton-Cotes数值积分公式，即在每个子区间上使用Newton-Cotes公式，然后求和
% 参数说明
% fun，积分函数的句柄，必须能够接受矢量输入
% a，积分下限
% b，积分上限
% m，将区间[a,b]等分的子区间数量
% n，采用的Newton-Cotes公式的阶数，必须满足n<8，否则积分没法保证稳定性
%    (1)n=1，即复化梯形公式
%    (2)n=2，即复化辛普森公式
%    (3)n=4，即复化科特斯公式

xk=linspace(a,b,m+1);
for i=1:m
    s(i)=NewtonCotes(fun,xk(i),xk(i+1),n);
end
y=sum(s);
fprintf('n=%d   ans=%f\n',n,y);