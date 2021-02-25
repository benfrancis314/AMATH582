figure(1);
t = 1:226;

% Sync by eye
X1_sync = [X1(1,5:185);X1(2,5:185);X1(3,20:200);X1(4,20:200);X1(5,30:210);X1(6,30:210)];
X2_sync = [X2(1,55:215);X2(2,55:215);X2(3,40:200);X2(4,40:200);X2(5,40:200);X2(6,40:200)];
X3_sync = [X3(1,35:200);X3(2,35:200);X3(3,25:190);X3(4,25:190);X3(5,53:218);X3(6,53:218)];
X4_sync = [X4(1,13:193);X4(2,13:193);X4(3,20:200);X4(4,20:200);X4(5,33:213);X4(6,33:213)];

t1 = 1:length(X1_sync); t2 = 1:length(X2_sync); t3 = 1:length(X3_sync); t4 = 1:length(X4_sync);

% Normalize
X1_norm = [(X1_sync(1,:) - min(X1_sync(1,:)))/max((X1_sync(1,:) - min(X1_sync(1,:)))); 
    (X1_sync(2,:) - min(X1_sync(2,:)))/max((X1_sync(2,:) - min(X1_sync(2,:)))); ...
           (X1_sync(3,:) - min(X1_sync(3,:)))/max((X1_sync(3,:) - min(X1_sync(3,:)))); 
           (X1_sync(4,:) - min(X1_sync(4,:)))/max((X1_sync(4,:) - min(X1_sync(4,:)))); ...
           (X1_sync(5,:) - min(X1_sync(5,:)))/max((X1_sync(5,:) - min(X1_sync(5,:)))); 
           (X1_sync(6,:) - min(X1_sync(6,:)))/max((X1_sync(6,:) - min(X1_sync(6,:))));];
X2_norm = [(X2_sync(1,:) - min(X2_sync(1,:)))/max((X2_sync(1,:) - min(X2_sync(1,:)))); 
    (X2_sync(2,:) - min(X2_sync(2,:)))/max((X2_sync(2,:) - min(X2_sync(2,:)))); ...
           (X2_sync(3,:) - min(X2_sync(3,:)))/max((X2_sync(3,:) - min(X2_sync(3,:)))); 
           (X2_sync(4,:) - min(X2_sync(4,:)))/max((X2_sync(4,:) - min(X2_sync(4,:)))); ...
           (X2_sync(5,:) - min(X2_sync(5,:)))/max((X2_sync(5,:) - min(X2_sync(5,:)))); 
           (X2_sync(6,:) - min(X2_sync(6,:)))/max((X2_sync(6,:) - min(X2_sync(6,:))));];
X3_norm = [(X3_sync(1,:) - min(X3_sync(1,:)))/max((X3_sync(1,:) - min(X3_sync(1,:)))); 
    (X3_sync(2,:) - min(X3_sync(2,:)))/max((X3_sync(2,:) - min(X3_sync(2,:)))); ...
           (X3_sync(3,:) - min(X3_sync(3,:)))/max((X3_sync(3,:) - min(X3_sync(3,:)))); 
           (X3_sync(4,:) - min(X3_sync(4,:)))/max((X3_sync(4,:) - min(X3_sync(4,:)))); ...
           (X3_sync(5,:) - min(X3_sync(5,:)))/max((X3_sync(5,:) - min(X3_sync(5,:))));
           (X3_sync(6,:) - min(X3_sync(6,:)))/max((X3_sync(6,:) - min(X3_sync(6,:))));];
X4_norm = [(X4_sync(1,:) - min(X4_sync(1,:)))/max((X4_sync(1,:) - min(X4_sync(1,:)))); 
    (X4_sync(2,:) - min(X4_sync(2,:)))/max((X4_sync(2,:) - min(X4_sync(2,:)))); ...
           (X4_sync(3,:) - min(X4_sync(3,:)))/max((X4_sync(3,:) - min(X4_sync(3,:)))); 
           (X4_sync(4,:) - min(X4_sync(4,:)))/max((X4_sync(4,:) - min(X4_sync(4,:)))); ...
           (X4_sync(5,:) - min(X4_sync(5,:)))/max((X4_sync(5,:) - min(X4_sync(5,:)))); 
           (X4_sync(6,:) - min(X4_sync(6,:)))/max((X4_sync(6,:) - min(X4_sync(6,:))));];
% Plot
subplot(2,4,1), plot(t1,X1_norm(2,:),'r-'); hold on; plot(t1,X1_norm(4,:)); plot(t1,X1_norm(5,:),'b-'); 
subplot(2,4,2), plot(t2,X2_norm(2,:),'r-'); hold on; plot(t2,X2_norm(4,:)); plot(t2,X2_norm(5,:),'b-'); 
subplot(2,4,3), plot(t3,X3_norm(2,:),'r-'); hold on; plot(t3,X3_norm(4,:)); plot(t3,X3_norm(5,:),'b-'); 
subplot(2,4,4), plot(t4,X4_norm(2,:),'r-'); hold on; plot(t4,X4_norm(4,:)); plot(t4,X4_norm(5,:),'b-'); 
subplot(2,4,5), plot(t1,X1_norm(1,:),'r-'); hold on; plot(t1,X1_norm(3,:)); plot(t1,X1_norm(6,:),'b-'); 
subplot(2,4,6), plot(t2,X2_norm(1,:),'r-'); hold on; plot(t2,X2_norm(3,:)); plot(t2,X2_norm(6,:),'b-'); 
subplot(2,4,7), plot(t3,X3_norm(1,:),'r-'); hold on; plot(t3,X3_norm(3,:)); plot(t3,X3_norm(6,:),'b-'); 
subplot(2,4,8), plot(t4,X4_norm(1,:),'r-'); hold on; plot(t4,X4_norm(3,:)); plot(t4,X4_norm(6,:),'b-'); 