 fprintf("The root of fucntion x^2-e^x=0 is \n");
% fprintf("t1 = %f\n",newt(@t11,@t1));
fprintf("t1 =%f\n",gexian(@t1,-1,1,1e-6));
 fprintf("The root of fucntion xe^x-1=0 is \n");
% fprintf("t2 = %f\n",newt(@t21,@t2));
fprintf("t2 =%f\n",gexian(@t2,0,1,1e-6));
 fprintf("The root of fucntion log(x)+x-2=0 is \n");
% fprintf("t3 = %f\n",newt(@t31,@t3));
fprintf("t3 =%f\n",gexian(@t3,1,2,1e-6));

function res=gexian(f,x0,x1,e)
    y=x0;
    x=x1;
    while abs(x-y)> e
        z=x-(f(x)*(x-y))/(f(x)-f(y));
        y=x;
        x=z;
    end
    res=x;
end


function res= newt(f1,f)
    eps=5e-6;
    delta=1e-6;
    N=100;
    k=0;
    x0=1.0;
    while (1)
        x1=x0-f(x0)/f1(x0);
        k=k+1;
        if(k>N | abs(x1)<eps)
            disp('Newton method failed');
            break;
        end
        if abs(x1)<1
            d=x1-x0;
        else
            d=(x1-x0)/x1;
        end
        x0=x1;
        if(abs(d)<eps | abs(f(x1))<delta)
            break;
        end
    end
    res=x0;
end

function y=t11(x)
    y=2*x-exp(x);
end

function y=t1(x)
    y=x^2-exp(x);
end

function y=t21(x)
    y=exp(x)+x*exp(x);
end

function y=t2(x)
    y=x*exp(x)-1;
end

function y=t31(x)
    y=1/x+1;
end

function y=t3(x)
    y=log(x)+x-2;
end