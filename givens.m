% Dummy variable...
A = [];

function [Q,R] = qrgivens(A)
    [m, n] = size(A);
    Q = eye(m);
    R = A;

    for j = 1 : n
        for i = m : -1 : (j+1)
            G = eye(m);
            [c, s] = givens( R(i-1,j), R(i,j) );
            G([i-1, i], [i-1, i]) = [c -s; s c];
            R = G' * R;
            Q = Q * G;
        end
    end
end

function [c, s] = givens(x, y)
    if y == 0
        c = 1;
        s = 0;
    else
        if abs(y) > abs(x)
            r = x / y;
            s = 1 / sqrt(1 + r ^ 2);
            c = s * r;
        else
            r = y / x;
            c = 1 / sqrt(1 + r ^ 2);
            s = c * r;
        end
    end
end


A = input('Please enter A: ')
b = input('Please enter b: ')

[Q, R] = qrgivens(A)

x = R\Q.'*b