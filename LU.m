A = input('Enter A in format [a11 a12 ... a1n; ... ; an1 an2 ... ann]   ');
[R, C]=size(A);

if R ~= C 
    disp('A must be square')
    exit 
end

U = zeros(R);
L = zeros(R);

%to be Doolittle
for i = 1 : R
    L(i, i) = 1;
end

for i = 1 : R
    for r = 1 : i - 1
        sum = 0;
        for k = 1 : r - 1
            sum = sum + L(i, k) * U(k, r);
        end
        L(i, r) = (A(i, r) - sum) / U(r, r);
    end
       
    for r = i : R
        sum = 0;
        for k = 1 : i - 1
           sum = sum + L(i, k) * U(k, r);
        end
        U(i, r) = A(i, r) - sum;
    end
end

A
L
U