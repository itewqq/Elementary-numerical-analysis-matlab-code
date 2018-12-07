function [y,Ck,Ak]=NewtonCotes(fun,a,b,n)
% y=NewtonCotes(fun,a,b,n)
% 牛顿-科特斯数值积分公式
%
% 参数说明：
% fun，积分表达式，这里有两种选择
%      (1)积分函数句柄，必须能够接受矢量输入，比如fun=@(x)sin(x).*cos(x)
%      (2)x,y坐标的离散点，第一列为x，第二列为y，必须等距，且节点的个数小于9，比如：fun=[1:8;sin(1:8)]'
% 如果fun的表采用第二种方式，那么只需要输入第一个参数即可，否则还要输入a,b,n三个参数
% a，积分下限
% b，积分上限
% n，牛顿-科特斯数公式的阶数，必须满足1<n<7，因为n>=8时不能保证公式的稳定性
%    (1)n=1，即梯形公式
%    (2)n=2，即辛普森公式
%    (3)n=4，即科特斯公式
% y，数值积分结果
% Ck，科特斯系数
% Ak，求积系数
%
if nargin==1
    [mm,nn]=size(fun);
    if mm>=8
        error('为了保证NewtonCotes积分的稳定性，最多只能有9个等距节点！')
    elseif nn~=2
        error('fun构成应为：第一列为x，第二列为y，并且个数为小于10的等距节点！')
    end
    xk=fun(1,:);
    fk=fun(2,:);
    a=min(xk);
    b=max(xk);
    n=mm-1;
elseif nargin==4
    % 计算积分节点xk和节点函数值fx
    xk=linspace(a,b,n+1);
    if isa(fun,'function_handle')
        fx=fun(xk);
    else
        error('fun积分函数的句柄，且必须能够接受矢量输入！')
    end
else
    error('输入参数错误，请参考函数帮助！')
end
% 计算科特斯系数
Ck=cotescoeff(n);
% 计算求积系数
Ak=(b-a)*Ck;
% 求和算积分
y=Ak*fx';
end