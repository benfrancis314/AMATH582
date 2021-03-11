%  Best
lda_01 = fitcdiscr(train_01,labels_train_01);
svm_01 = fitcsvm(train_01,labels_train_01);
tree_01 = fitctree(train_01,labels_train_01,'MaxNumSplits',3);
lda_pred_01 = predict(lda_01, test_01);
svm_pred_01 = predict(svm_01, test_01);
tree_pred_01 = predict(tree_01, test_01);

% Worst
lda_79 = fitcdiscr(train_79,labels_train_79);
svm_79 = fitcsvm(train_79,labels_train_79);
tree_79 = fitctree(train_79,labels_train_79);
lda_pred_79 = predict(lda_79, test_79);
svm_pred_79 = predict(svm_79, test_79);
tree_pred_79 = predict(tree_79, test_79);

correct_lda_01 = 0;
correct_svm_01 = 0;
correct_tree_01 = 0;
for i=1:length(lda_pred_01)
    if lda_pred_01(i) == labels_test_01(i)
        correct_lda_01 = correct_lda_01 + 1;
    end
    if svm_pred_01(i) == labels_test_01(i)
        correct_svm_01 = correct_svm_01 + 1;
    end
    if tree_pred_01(i) == labels_test_01(i)
        correct_tree_01 = correct_tree_01 + 1;
    end
end

accuracy_lda_01 = correct_lda_01/length(labels_test_01)
accuracy_svm_01 = correct_svm_01/length(labels_test_01)
accuracy_tree_01 = correct_tree_01/length(labels_test_01)

correct_lda_79 = 0;
correct_svm_79 = 0;
correct_tree_79 = 0;
for i=1:length(lda_pred_79)
    if lda_pred_79(i) == labels_test_79(i)
        correct_lda_79 = correct_lda_79 + 1;
    end
    if svm_pred_79(i) == labels_test_79(i)
        correct_svm_79 = correct_svm_79 + 1;
    end
    if tree_pred_79(i) == labels_test_79(i)
        correct_tree_79 = correct_tree_79 + 1;
    end
end

accuracy_lda_79 = correct_lda_79/length(labels_test_79)
accuracy_svm_79 = correct_svm_79/length(labels_test_79)
accuracy_tree_79 = correct_tree_79/length(labels_test_79)
