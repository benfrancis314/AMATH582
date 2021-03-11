train_014 = [train_0; train_1; train_4]; test_014 = [test_0; test_1; test_4]; 
labels_train_014 = [0*ones(length(train_0),1); 1*ones(length(train_1),1);4*ones(length(train_4),1)];
labels_test_014 = [0*ones(length(test_0),1); 1*ones(length(test_1),1);4*ones(length(test_4),1)];
pred_014 = classify(test_014, train_014, labels_train_014);

correct_014 = 0
for i=1:length(pred_014)
    if pred_014(i) == labels_test_014(i)
        correct_014 = correct_014 + 1;
    end
end

accuracy_014 = correct_014/length(labels_test_014);
confusionchart(labels_test_014,pred_014);