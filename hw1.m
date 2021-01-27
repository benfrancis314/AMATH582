close all; clear all; clc;
load('subdata.mat')

L = 10; n = 64;
x2 = linspace(-L,L,n+1); x = x2(1:n); y =x; z = x;
k = (2*pi/(2*L))*[0:(n/2 - 1) -n/2:-1]; ks = fftshift(k);
[X,Y,Z]=meshgrid(x,y,z); [Kx,Ky,Kz]=meshgrid(ks,ks,ks);

Uave = zeros(n,n,n);
for j=1:49
    Un(:,:,:)=reshape(subdata(:,j),n,n,n);
    Utn = fftn(Un);
    Uave = Uave + Utn;
end

Uave = Uave / 49;
[~, ind] = max(abs(Uave(:)));
[I,J,K] = ind2sub([n,n,n], ind);
sign_fx = Kx(I,J,K);
sign_fy = Ky(I,J,K);
sign_fz = Kz(I,J,K);

filter = exp(-1 * ((Kx-sign_fx).^2 + (Ky-sign_fy).^2 + (Kz-sign_fz).^2));
submarine = zeros(3,49);
for j=1:49
    Un=reshape(subdata(:,j),n,n,n);
    Utn_f = fftn(Un) .* filter;
    Un_f = ifftn(Utn_f);
    
    [~, ind] = max(abs(Un_f(:))); 
    [submarine_x, submarine_y, submarine_z] = ind2sub([n n n], ind);
    submarine(1,j) = X(submarine_x, submarine_y, submarine_z);
    submarine(2,j) = Y(submarine_x, submarine_y, submarine_z);
    submarine(3,j) = Z(submarine_x, submarine_y, submarine_z);
end

figure();
plot3(submarine(1,:), submarine(2,:), submarine(3,:),'r'), grid on; 
title('Approximate Submarine Trajectory','FontSize',18), xlabel('X','FontSize',14), ylabel('Y','FontSize',14), zlabel('Z','FontSize',14);
aircraft_trajectory = submarine(1:2,:);
plot(aircraft_trajectory(1,:), aircraft_trajectory(2,:),'r'), grid on;
title('Recommended Aircraft Trajectory','FontSize',18), xlabel('X','FontSize',14), ylabel('Y','FontSize',14), zlabel('Z','FontSize',14);
