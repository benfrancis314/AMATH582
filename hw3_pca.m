% Prep data
X1_norm = [X1(1,5:185);X1(2,5:185);X1(3,20:200);X1(4,20:200);X1(5,30:210);X1(6,30:210)];
X2_norm = [X2(1,55:215);X2(2,55:215);X2(3,40:200);X2(4,40:200);X2(5,40:200);X2(6,40:200)];
X3_norm = [X3(1,35:200);X3(2,35:200);X3(3,25:190);X3(4,25:190);X3(5,53:218);X3(6,53:218)];
X4_norm = [X4(1,13:193);X4(2,13:193);X4(3,20:200);X4(4,20:200);X4(5,33:213);X4(6,33:213)];
[m1,n1] = size(X1_norm); [m2,n2] = size(X2_norm);
[m3,n3] = size(X3_norm); [m4,n4] = size(X4_norm); 
mn1 = mean(X1_norm,2); mn2 = mean(X2_norm,2);
mn3 = mean(X3_norm,2); mn4 = mean(X4_norm,2); 
X1_mean=X1_norm-repmat(mn1,1,n1); X2_mean=X2_norm-repmat(mn2,1,n2);
X3_mean=X3_norm-repmat(mn3,1,n3); X4_mean=X4_norm-repmat(mn4,1,n4); 
% SVD
[u1,s1,v1]=svd(X1_mean/sqrt(n1-1));
[u2,s2,v2]=svd(X2_mean/sqrt(n2-1));
[u3,s3,v3]=svd(X3_mean/sqrt(n3-1));
[u4,s4,v4]=svd(X4_mean/sqrt(n4-1));
lambda1=diag(s1).^2; lambda2=diag(s2).^2;
lambda3=diag(s3).^2; lambda4=diag(s4).^2;
Y1=u1'*X1_mean; Y2=u2'*X2_mean;
Y3=u3'*X3_mean; Y4=u4'*X4_mean; 
% Plot
figure(1)
subplot(1,4,1), plot((lambda1 / sum(lambda1)) * 100,'bo','Linewidth',3);
title('Experiment 1','FontSize',20); 
xlabel('Mode','FontSize',14); ylabel('% variance','FontSize',14)
subplot(1,4,2), plot((lambda2 / sum(lambda2)) * 100,'bo','Linewidth',3);
title('Experiment 2','FontSize',20); 
xlabel('Mode','FontSize',14); ylabel('% variance','FontSize',14)
subplot(1,4,3), plot((lambda3 / sum(lambda3)) * 100,'bo','Linewidth',3);
title('Experiment 3','FontSize',20); 
xlabel('Mode','FontSize',14); ylabel('% variance','FontSize',14)
subplot(1,4,4), plot((lambda4 / sum(lambda4)) * 100,'bo','Linewidth',3);
title('Experiment 4','FontSize',20); 
xlabel('Mode','FontSize',14); ylabel('% variance','FontSize',14)
sgtitle('Percentage of variance captured by each mode','FontSize',24,'FontWeight','bold');
figure(2)
t1 = 1:length(Y1(1,:)); t2 = 1:length(Y2(1,:)); 
t3 = 1:length(Y3(1,:)); t4 = 1:length(Y4(1,:));
subplot(2,2,1), plot(t1,Y1(1,:),t1,Y1(2,:),'LineWidth',2); hold on; 
plot(t1,Y1(3,:),t1,Y1(4,:),'LineWidth',1); plot(t1,Y1(5,:),t1,Y1(6,:));
title('Experiment 1','FontSize',20); xlabel('Time','FontSize',14);
legend('First','Second','Third','Fourth','Fifth','Sixth')
subplot(2,2,2), plot(t2,Y2(1,:),t2,Y2(2,:),t2,Y2(3,:),'LineWidth',2);hold on; 
plot(t2,Y2(4,:),t2,Y2(5,:),'LineWidth',1);plot(t2,Y2(6,:));
title('Experiment 2','FontSize',20); xlabel('Time','FontSize',14);
legend('First','Second','Third','Fourth','Fifth','Sixth')
subplot(2,2,3), plot(t3,Y3(1,:),t3,Y3(2,:),'LineWidth',2); hold on;
plot(t3,Y3(3,:),t3,Y3(4,:),'LineWidth',1); plot(t3,Y3(5,:),t3,Y3(6,:));
title('Experiment 3','FontSize',20); xlabel('Time','FontSize',14);
legend('First','Second','Third','Fourth','Fifth','Sixth')
subplot(2,2,4), plot(t4,Y4(1,:),t4,Y4(2,:),'LineWidth',2); hold on; 
plot(t4,Y4(3,:),t4,Y4(4,:),'LineWidth',1); plot(t4,Y4(5,:),t4,Y4(6,:));
legend('First','Second','Third','Fourth','Fifth','Sixth');
title('Experiment 4','FontSize',20); xlabel('Time','FontSize',14);
sgtitle('Principal Components Projections','FontSize',24,'FontWeight','bold');