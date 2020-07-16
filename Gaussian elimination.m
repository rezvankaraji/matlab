A = input('Enter A in format [a11 a12 ... a1n; ... ; an1 an2 ... ann]   ');

b = [sum(A(1,:)); sum(A(2,:)); sum(A(3,:)); sum(A(4,:)) ]

n = size(A,1);

AA = A;

R = A;

bb = b;

for i = 1: n-1
	
	L = eye(n-i+1);
	
	a = AA(:,1);
	
	L(2:end,1) = -a(2:end)/a(1);
	
	AA = L*AA;
	
	L1 = eye(n,n);
	
	L1(i:end,i:end) = L;
	
	bb = L1*bb;
	
	R(i:end,i:end) = AA;
	
	AA = AA(2:end,2:end);

end

R

bb

x = zeros(n,1);

for i=n:-1:1
    
	x(i) = 1/R(i,i) * (bb(i) - R(i,i+1:n)*x(i+1:n));

end

x