[images_train, labels_train] = mnist_parse('train-images-idx3-ubyte', 'train-labels-idx1-ubyte');
[images_test, labels_test] = mnist_parse('t10k-images-idx3-ubyte', 't10k-labels-idx1-ubyte');

train_vec = reshape(double(images_train), 28*28, []);
test_vec = reshape(double(images_test), 28*28, []);

[m_train, n_train] = size(train_vec);
[m_test, n_test] = size(test_vec);
mn_train = mean(train_vec,2); 
mn_test = mean(test_vec,2);
train_vec_mean = train_vec-repmat(mn_train,1,n_train);
test_vec_mean = test_vec-repmat(mn_test,1,n_test);
[u_train,s_train,v_train] = svd(train_vec_mean/sqrt(n_train-1),'econ');
lambda_train = diag(s_train).^2;

% Plot variances
figure(1)
plot(100*(lambda_train / sum(lambda_train)) ,'ko','LineWidth',2); 
title("% Variance Captured by Principal Values","FontSize",22, "FontWeight", "bold");
ylabel("% Captured Variance","FontSize",18);
xlabel("Squared Singular Values","FontSize",18);

for j=1:4
    sing_vals_of_interest = [1,2,3,4];
    subplot(2,2,j);
    % Columns of u are the principal components
    ef = reshape(u_train(:,sing_vals_of_interest(j)),28,28);
    pcolor(ef), axis off, shading interp, colormap(hot);
    title(["Principal Component "+ j],"FontSize",18);
end
sgtitle("First Four Principle Components of Training Data","FontSize",22, "FontWeight", "bold");
% 
label_colors = [0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 0.4660 0.6740 0.1880; 
    ...0.8500 0.3250 0.0980; 0.9290 0.6940 0.1250];

num_points = 60000;
sing_vals = [1,2,3];
for i=1:num_points
    digit_color = label_colors(labels_train(i)+1,:);
    plot3(v_train(i,1),v_train(i,2),v_train(i,3),'o-','Color',digit_color,'LineWidth',2);
    hold on; 
end
xlabel('Projection onto PC 1', 'FontSize', 16), ylabel('Projection onto PC 2', 'FontSize', 16), ...
    zlabel('Projection onto PC 3', 'FontSize', 16);
title('Visualization of PC Projections', 'FontSize', 22);


% Define new data as projected onto PC space
r = 87;
% Print % variance included
sum(lambda_train(1:r))/sum(lambda_train)
train_proj = [v_train(:,1:r)];
test_proj_all = (u_train'*test_vec_mean).';
test_proj = [test_proj_all(:,1:r)];

% Separate out by digits

% Organize data by data type
train_0 = []; test_0 = []; train_1 = []; test_1 = [];
train_2 = []; test_2 = []; train_3 = []; test_3 = [];
train_4 = []; test_4 = []; train_5 = []; test_5 = [];
train_6 = []; test_6 = []; train_7 = []; test_7 = [];
train_8 = []; test_8 = []; train_9 = []; test_9 = [];

% Sort data into 10 buckets
for i=1:length(labels_train)
    if labels_train(i) == 0
        train_0 = [train_0; train_proj(i,:)]; 
    end
    if labels_train(i) == 1
        train_1 = [train_1; train_proj(i,:)]; 
    end
    if labels_train(i) == 2
        train_2 = [train_2; train_proj(i,:)]; 
    end
    if labels_train(i) == 3
        train_3 = [train_3; train_proj(i,:)]; 
    end
    if labels_train(i) == 4
        train_4 = [train_4; train_proj(i,:)]; 
    end
    if labels_train(i) == 5
        train_5 = [train_5; train_proj(i,:)];
    end
    if labels_train(i) == 6
        train_6 = [train_6; train_proj(i,:)];
    end
    if labels_train(i) == 7
        train_7 = [train_7; train_proj(i,:)];
    end
    if labels_train(i) == 8
        train_8 = [train_8; train_proj(i,:)]; 
    end
    if labels_train(i) == 9
        train_9 = [train_9; train_proj(i,:)]; 
    end
end
for i=1:length(labels_test)
    if labels_test(i) == 0
        test_0 = [test_0; test_proj(i,:)];
    end
    if labels_test(i) == 1
        test_1 = [test_1; test_proj(i,:)];
    end
    if labels_test(i) == 2
        test_2 = [test_2; test_proj(i,:)];
    end
    if labels_test(i) == 3
        test_3 = [test_3; test_proj(i,:)];
    end
    if labels_test(i) == 4
        test_4 = [test_4; test_proj(i,:)];
    end
    if labels_test(i) == 5
        test_5 = [test_5; test_proj(i,:)];
    end
    if labels_test(i) == 6
        test_6 = [test_6; test_proj(i,:)];
    end
    if labels_test(i) == 7
        test_7 = [test_7; test_proj(i,:)];
    end
    if labels_test(i) == 8
        test_8 = [test_8; test_proj(i,:)];
    end
    if labels_test(i) == 9
        test_9 = [test_9; test_proj(i,:)];
    end
end

% Test different pairs of digits
train_01 = [train_0; train_1]; test_01 = [test_0; test_1]; 
train_02 = [train_0; train_2]; test_02 = [test_0; test_2]; 
train_03 = [train_0; train_3]; test_03 = [test_0; test_3]; 
train_04 = [train_0; train_4]; test_04 = [test_0; test_4]; 
train_05 = [train_0; train_5]; test_05 = [test_0; test_5]; 
train_06 = [train_0; train_6]; test_06 = [test_0; test_6]; 
train_07 = [train_0; train_7]; test_07 = [test_0; test_7]; 
train_08 = [train_0; train_8]; test_08 = [test_0; test_8]; 
train_09 = [train_0; train_9]; test_09 = [test_0; test_9]; 
train_12 = [train_1; train_2]; test_12 = [test_1; test_2]; 
train_13 = [train_1; train_3]; test_13 = [test_1; test_3]; 
train_14 = [train_1; train_4]; test_14 = [test_1; test_4]; 
train_15 = [train_1; train_5]; test_15 = [test_1; test_5]; 
train_16 = [train_1; train_6]; test_16 = [test_1; test_6]; 
train_17 = [train_1; train_7]; test_17 = [test_1; test_7]; 
train_18 = [train_1; train_8]; test_18 = [test_1; test_8]; 
train_19 = [train_1; train_9]; test_19 = [test_1; test_9]; 
train_23 = [train_2; train_3]; test_23 = [test_2; test_3]; 
train_24 = [train_2; train_4]; test_24 = [test_2; test_4]; 
train_25 = [train_2; train_5]; test_25 = [test_2; test_5]; 
train_26 = [train_2; train_6]; test_26 = [test_2; test_6]; 
train_27 = [train_2; train_7]; test_27 = [test_2; test_7];
train_28 = [train_2; train_8]; test_28 = [test_2; test_8]; 
train_29 = [train_2; train_9]; test_29 = [test_2; test_9]; 
train_34 = [train_3; train_4]; test_34 = [test_3; test_4]; 
train_35 = [train_3; train_5]; test_35 = [test_3; test_5]; 
train_36 = [train_3; train_6]; test_36 = [test_3; test_6]; 
train_37 = [train_3; train_7]; test_37 = [test_3; test_7]; 
train_38 = [train_3; train_8]; test_38 = [test_3; test_8]; 
train_39 = [train_3; train_9]; test_39 = [test_3; test_9]; 
train_45 = [train_4; train_5]; test_45 = [test_4; test_5]; 
train_46 = [train_4; train_6]; test_46 = [test_4; test_6]; 
train_47 = [train_4; train_7]; test_47 = [test_4; test_7];
train_48 = [train_4; train_8]; test_48 = [test_4; test_8]; 
train_49 = [train_4; train_9]; test_49 = [test_4; test_9]; 
train_56 = [train_5; train_6]; test_56 = [test_5; test_6]; 
train_57 = [train_5; train_7]; test_57 = [test_5; test_7]; 
train_58 = [train_5; train_8]; test_58 = [test_5; test_8]; 
train_59 = [train_5; train_9]; test_59 = [test_5; test_9]; 
train_67 = [train_6; train_7]; test_67 = [test_6; test_7]; 
train_68 = [train_6; train_8]; test_68 = [test_6; test_8]; 
train_69 = [train_6; train_9]; test_69 = [test_6; test_9]; 
train_78 = [train_7; train_8]; test_78 = [test_7; test_8]; 
train_79 = [train_7; train_9]; test_79 = [test_7; test_9];
train_89 = [train_8; train_9]; test_89 = [test_8; test_9];
labels_train_01 = [0*ones(length(train_0),1); 1*ones(length(train_1),1)]; labels_test_01 = [0*ones(length(test_0),1); 1*ones(length(test_1),1)];
labels_train_02 = [0*ones(length(train_0),1); 2*ones(length(train_2),1)]; labels_test_02 = [0*ones(length(test_0),1); 2*ones(length(test_2),1)];
labels_train_03 = [0*ones(length(train_0),1); 3*ones(length(train_3),1)]; labels_test_03 = [0*ones(length(test_0),1); 3*ones(length(test_3),1)];
labels_train_04 = [0*ones(length(train_0),1); 4*ones(length(train_4),1)]; labels_test_04 = [0*ones(length(test_0),1); 4*ones(length(test_4),1)];
labels_train_05 = [0*ones(length(train_0),1); 5*ones(length(train_5),1)]; labels_test_05 = [0*ones(length(test_0),1); 5*ones(length(test_5),1)];
labels_train_06 = [0*ones(length(train_0),1); 6*ones(length(train_6),1)]; labels_test_06 = [0*ones(length(test_0),1); 6*ones(length(test_6),1)];
labels_train_07 = [0*ones(length(train_0),1); 7*ones(length(train_7),1)]; labels_test_07 = [0*ones(length(test_0),1); 7*ones(length(test_7),1)];
labels_train_08 = [0*ones(length(train_0),1); 8*ones(length(train_8),1)]; labels_test_08 = [0*ones(length(test_0),1); 8*ones(length(test_8),1)];
labels_train_09 = [0*ones(length(train_0),1); 9*ones(length(train_9),1)]; labels_test_09 = [0*ones(length(test_0),1); 9*ones(length(test_9),1)];
labels_train_12 = [1*ones(length(train_1),1); 2*ones(length(train_2),1)]; labels_test_12 = [1*ones(length(test_1),1); 2*ones(length(test_2),1)];
labels_train_13 = [1*ones(length(train_1),1); 3*ones(length(train_3),1)]; labels_test_13 = [1*ones(length(test_1),1); 3*ones(length(test_3),1)];
labels_train_14 = [1*ones(length(train_1),1); 4*ones(length(train_4),1)]; labels_test_14 = [1*ones(length(test_1),1); 4*ones(length(test_4),1)];
labels_train_15 = [1*ones(length(train_1),1); 5*ones(length(train_5),1)]; labels_test_15 = [1*ones(length(test_1),1); 5*ones(length(test_5),1)];
labels_train_16 = [1*ones(length(train_1),1); 6*ones(length(train_6),1)]; labels_test_16 = [1*ones(length(test_1),1); 6*ones(length(test_6),1)];
labels_train_17 = [1*ones(length(train_1),1); 7*ones(length(train_7),1)]; labels_test_17 = [1*ones(length(test_1),1); 7*ones(length(test_7),1)];
labels_train_18 = [1*ones(length(train_1),1); 8*ones(length(train_8),1)]; labels_test_18 = [1*ones(length(test_1),1); 8*ones(length(test_8),1)];
labels_train_19 = [1*ones(length(train_1),1); 9*ones(length(train_9),1)]; labels_test_19 = [1*ones(length(test_1),1); 9*ones(length(test_9),1)];
labels_train_23 = [2*ones(length(train_2),1); 3*ones(length(train_3),1)]; labels_test_23 = [2*ones(length(test_2),1); 3*ones(length(test_3),1)];
labels_train_24 = [2*ones(length(train_2),1); 4*ones(length(train_4),1)]; labels_test_24 = [2*ones(length(test_2),1); 4*ones(length(test_4),1)];
labels_train_25 = [2*ones(length(train_2),1); 5*ones(length(train_5),1)]; labels_test_25 = [2*ones(length(test_2),1); 5*ones(length(test_5),1)];
labels_train_26 = [2*ones(length(train_2),1); 6*ones(length(train_6),1)]; labels_test_26 = [2*ones(length(test_2),1); 6*ones(length(test_6),1)];
labels_train_27 = [2*ones(length(train_2),1); 7*ones(length(train_7),1)]; labels_test_27 = [2*ones(length(test_2),1); 7*ones(length(test_7),1)];
labels_train_28 = [2*ones(length(train_2),1); 8*ones(length(train_8),1)]; labels_test_28 = [2*ones(length(test_2),1); 8*ones(length(test_8),1)];
labels_train_29 = [2*ones(length(train_2),1); 9*ones(length(train_9),1)]; labels_test_29 = [2*ones(length(test_2),1); 9*ones(length(test_9),1)];
labels_train_34 = [3*ones(length(train_3),1); 4*ones(length(train_4),1)]; labels_test_34 = [3*ones(length(test_3),1); 4*ones(length(test_4),1)];
labels_train_35 = [3*ones(length(train_3),1); 5*ones(length(train_5),1)]; labels_test_35 = [3*ones(length(test_3),1); 5*ones(length(test_5),1)];
labels_train_36 = [3*ones(length(train_3),1); 6*ones(length(train_6),1)]; labels_test_36 = [3*ones(length(test_3),1); 6*ones(length(test_6),1)];
labels_train_37 = [3*ones(length(train_3),1); 7*ones(length(train_7),1)]; labels_test_37 = [3*ones(length(test_3),1); 7*ones(length(test_7),1)];
labels_train_38 = [3*ones(length(train_3),1); 8*ones(length(train_8),1)]; labels_test_38 = [3*ones(length(test_3),1); 8*ones(length(test_8),1)];
labels_train_39 = [3*ones(length(train_3),1); 9*ones(length(train_9),1)]; labels_test_39 = [3*ones(length(test_3),1); 9*ones(length(test_9),1)];
labels_train_45 = [4*ones(length(train_4),1); 5*ones(length(train_5),1)]; labels_test_45 = [4*ones(length(test_4),1); 5*ones(length(test_5),1)];
labels_train_46 = [4*ones(length(train_4),1); 6*ones(length(train_6),1)]; labels_test_46 = [4*ones(length(test_4),1); 6*ones(length(test_6),1)];
labels_train_47 = [4*ones(length(train_4),1); 7*ones(length(train_7),1)]; labels_test_47 = [4*ones(length(test_4),1); 7*ones(length(test_7),1)];
labels_train_48 = [4*ones(length(train_4),1); 8*ones(length(train_8),1)]; labels_test_48 = [4*ones(length(test_4),1); 8*ones(length(test_8),1)];
labels_train_49 = [4*ones(length(train_4),1); 9*ones(length(train_9),1)]; labels_test_49 = [4*ones(length(test_4),1); 9*ones(length(test_9),1)];
labels_train_56 = [5*ones(length(train_5),1); 6*ones(length(train_6),1)]; labels_test_56 = [5*ones(length(test_5),1); 6*ones(length(test_6),1)];
labels_train_57 = [5*ones(length(train_5),1); 7*ones(length(train_7),1)]; labels_test_57 = [5*ones(length(test_5),1); 7*ones(length(test_7),1)];
labels_train_58 = [5*ones(length(train_5),1); 8*ones(length(train_8),1)]; labels_test_58 = [5*ones(length(test_5),1); 8*ones(length(test_8),1)];
labels_train_59 = [5*ones(length(train_5),1); 9*ones(length(train_9),1)]; labels_test_59 = [5*ones(length(test_5),1); 9*ones(length(test_9),1)];
labels_train_67 = [6*ones(length(train_6),1); 7*ones(length(train_7),1)]; labels_test_67 = [6*ones(length(test_6),1); 7*ones(length(test_7),1)];
labels_train_68 = [6*ones(length(train_6),1); 8*ones(length(train_8),1)]; labels_test_68 = [6*ones(length(test_6),1); 8*ones(length(test_8),1)];
labels_train_69 = [6*ones(length(train_6),1); 9*ones(length(train_9),1)]; labels_test_69 = [6*ones(length(test_6),1); 9*ones(length(test_9),1)];
labels_train_78 = [7*ones(length(train_7),1); 8*ones(length(train_8),1)]; labels_test_78 = [7*ones(length(test_7),1); 8*ones(length(test_8),1)];
labels_train_79 = [7*ones(length(train_7),1); 9*ones(length(train_9),1)]; labels_test_79 = [7*ones(length(test_7),1); 9*ones(length(test_9),1)];
labels_train_89 = [8*ones(length(train_8),1); 9*ones(length(train_9),1)]; labels_test_89 = [8*ones(length(test_8),1); 9*ones(length(test_9),1)];
