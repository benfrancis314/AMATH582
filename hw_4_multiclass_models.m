lda = fitcdiscr(train_proj,labels_train);
ldaClass_test = predict(lda,test_proj);
svm = fitcecoc(train_proj,labels_train);
svmClass_test = predict(svm,test_proj);
tree = fitctree(train_proj,labels_train);
treeClass_test = predict(tree,test_proj);

figure(1)
subplot(1,3,1), cm1 = confusionchart(labels_test,ldaClass_test,'FontSize',16);
cm1.Title = 'LDA';
subplot(1,3,2), cm2 = confusionchart(labels_test,svmClass_test,'FontSize',16);
cm2.Title = 'SVM';
subplot(1,3,3), cm3 = confusionchart(labels_test,treeClass_test,'FontSize',16);
cm3.Title = 'Decision Tree';
sgtitle("Confusion Matrices",'FontSize',22, 'FontWeight','bold');

