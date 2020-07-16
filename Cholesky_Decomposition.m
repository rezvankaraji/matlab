A = input('Enter A in format [a11 a12 ... a1n; ... ; an1 an2 ... ann]   ');

n = size(A,1);

L = zeros(n);

for r = 1 : n
   
	L(r,r) = sqrt( A(r,r) - L(r,1:r-1) * L(r,1:r-1)' );
   
	for j = r+1 : n

	        L(j,r) = 1/L(r,r) * ( A(r,j) - L(r,1:r-1) * L(j,1:r-1)' );

        end

end

L


L*L'