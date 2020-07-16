A = input('Enter A in format [a11 a12 ... a1n; ... ; an1 an2 ... ann]   ');
[m,n] = size(A);

AA = A;

R = A;

Q = eye(m,m);


for i = 1: n

	I = eye(m-i+1);
	
	e1 = zeros(m-i+1,1);
 
	e1(1)=1; e1;

	x = AA(:,1);

	dx = norm(x,2);

	w = (x-dx*e1)/norm(x-dx*e1,2);

	H = I - 2*w*w';
	AA = H*AA;

	Q1 = eye(m,m);

	Q1(i:end,i:end) = H;

	Q = Q*Q1;

	R(i:end,i:end) = AA;

	AA = AA(2:end,2:end);

end
 

Q*R - A


Q


R