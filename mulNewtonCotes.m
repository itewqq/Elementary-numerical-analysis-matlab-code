function y=mulNewtonCotes(fun,a,b,m,n)
% ����Newton-Cotes��ֵ���ֹ�ʽ������ÿ����������ʹ��Newton-Cotes��ʽ��Ȼ�����
% ����˵��
% fun�����ֺ����ľ���������ܹ�����ʸ������
% a����������
% b����������
% m��������[a,b]�ȷֵ�����������
% n�����õ�Newton-Cotes��ʽ�Ľ�������������n<8���������û����֤�ȶ���
%    (1)n=1�����������ι�ʽ
%    (2)n=2������������ɭ��ʽ
%    (3)n=4������������˹��ʽ

xk=linspace(a,b,m+1);
for i=1:m
    s(i)=NewtonCotes(fun,xk(i),xk(i+1),n);
end
y=sum(s);
fprintf('n=%d   ans=%f\n',n,y);