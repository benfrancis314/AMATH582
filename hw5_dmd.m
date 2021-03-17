function [Phi,omega,lambda,b,X_dmd,S] = my_dmd(X1,X2,r,dt)
[U, S, V] = svd(X1, 'econ');
U_r = U(:, 1:r);
S_r = S(1:r, 1:r);
V_r = V(:, 1:r);
A_tilde = U_r'*X2*V_r/S_r;
[W_r, D] = eig(A_tilde);
Phi = X2*V_r/S_r*W_r;
lambda = diag(D);
omega = log(lambda)/dt;
x1 =X1(:,1);
b = Phi\x1;
measurements_1 = size(X1, 2);
time_dynamics = zeros(r, measurements_1);
t = (0:measurements_1 - 1)*dt;
for i = 1:measurements_1
    time_dynamics(:, i) = (b.*exp(omega*t(i)));
end
X_dmd = Phi*time_dynamics;