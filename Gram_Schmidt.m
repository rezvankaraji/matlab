%% Input n vectors using A(:,j) or a matrix%%
% A(:,1) = [1 2 4 5 6];A(:,2) = [3 4 6 1 2];
% A(:,3) = [1 6 5 9 3];
A = [1 2 4 5 6;3 4 6 1 2;1 6 5 9 3];

A = A';   %%% Transpose it 
m = size(A,1);    %%% Number of rows
n = size(A,2);    %%% Number of columns

V(:,1) = A(:,1);

for j = 2: n
    V(:,j) = A(:,j);
    for i = 1: j-1
        Pr(j,i) = (A(:,j)' * V(:,i))/(V(:,i)'*V(:,i));
        V(:,j) = V(:,j) - Pr(j,i) * V(:,i);
    end
end
V'*V
V


