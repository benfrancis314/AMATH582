X = vid_mat;
x1 = X(:,1:end-1);
x2 = X(:,2:end);
r=1;
dt=duration/numFrames;
[Phi,omega,lambda,b,X_dmd,S] = dmd(x1,x2,r,dt);

original = video;
background = uint8(X_dmd);
foreground = uint8(X(:,1:numFrames-1) - X_dmd + 150);

for i=1:numFrames-1
    foreground_reshaped(:,:,:,i) = reshape(foreground(:,i), 540, 960);
    background_reshaped(:,:,:,i) = reshape(background(:,i), 540, 960);
end

sig = diag(S).^2/sum(diag(S).^2)*100;
figure(1);
semilogy(sig,'bo','Linewidth',2)
title('Log % Variance Captured per Mode of Car Video', 'FontSize', 18);
ylabel('Log of % Variance Captured', 'FontSize', 14)
xlabel('Modes', 'FontSize', 14)

figure(2);
subplot(3,3,1), imagesc(rgb2gray(original(:,:,:,1))), colormap(gray), axis off
subplot(3,3,2), imagesc(rgb2gray(original(:,:,:,100))), colormap(gray), axis off, ...
    title('Original Video', 'FontSize', 14);
subplot(3,3,3), imagesc(rgb2gray(original(:,:,:,200))), colormap(gray), axis off
subplot(3,3,4), imagesc(background_reshaped(:,:,:,1)), colormap(gray), axis off
subplot(3,3,5), imagesc(background_reshaped(:,:,:,100)), colormap(gray), axis off, ...
    title('Background', 'FontSize', 14);
subplot(3,3,6), imagesc(background_reshaped(:,:,:,200)), colormap(gray), axis off
subplot(3,3,7), imagesc(foreground_reshaped(:,:,:,1)), colormap(gray),axis off
subplot(3,3,8), imagesc(foreground_reshaped(:,:,:,100)), colormap(gray),axis off, ...
    title('Foreground', 'FontSize', 14);
subplot(3,3,9), imagesc(foreground_reshaped(:,:,:,200)), colormap(gray),axis off
sgtitle('Car Video', 'FontSize', 18, 'FontWeight', 'bold')


