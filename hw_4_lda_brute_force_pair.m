pred_01 = classify(test_01, train_01, labels_train_01);
pred_02 = classify(test_02, train_02, labels_train_02);
pred_03 = classify(test_03, train_03, labels_train_03);
pred_04 = classify(test_04, train_04, labels_train_04);
pred_05 = classify(test_05, train_05, labels_train_05);
pred_06 = classify(test_06, train_06, labels_train_06);
pred_07 = classify(test_07, train_07, labels_train_07);
pred_08 = classify(test_08, train_08, labels_train_08);
pred_09 = classify(test_09, train_09, labels_train_09);
pred_12 = classify(test_12, train_12, labels_train_12);
pred_13 = classify(test_13, train_13, labels_train_13);
pred_14 = classify(test_14, train_14, labels_train_14);
pred_15 = classify(test_15, train_15, labels_train_15);
pred_16 = classify(test_16, train_16, labels_train_16);
pred_17 = classify(test_17, train_17, labels_train_17);
pred_18 = classify(test_18, train_18, labels_train_18);
pred_19 = classify(test_19, train_19, labels_train_19);
pred_23 = classify(test_23, train_23, labels_train_23);
pred_24 = classify(test_24, train_24, labels_train_24);
pred_25 = classify(test_25, train_25, labels_train_25);
pred_26 = classify(test_26, train_26, labels_train_26);
pred_27 = classify(test_27, train_27, labels_train_27);
pred_28 = classify(test_28, train_28, labels_train_28);
pred_29 = classify(test_29, train_29, labels_train_29);
pred_34 = classify(test_34, train_34, labels_train_34);
pred_35 = classify(test_35, train_35, labels_train_35);
pred_36 = classify(test_36, train_36, labels_train_36);
pred_37 = classify(test_37, train_37, labels_train_37);
pred_38 = classify(test_38, train_38, labels_train_38);
pred_39 = classify(test_39, train_39, labels_train_39);
pred_45 = classify(test_45, train_45, labels_train_45);
pred_46 = classify(test_46, train_46, labels_train_46);
pred_47 = classify(test_47, train_47, labels_train_47);
pred_48 = classify(test_48, train_48, labels_train_48);
pred_49 = classify(test_49, train_49, labels_train_49);
pred_56 = classify(test_56, train_56, labels_train_56);
pred_57 = classify(test_57, train_57, labels_train_57);
pred_58 = classify(test_58, train_58, labels_train_58);
pred_59 = classify(test_59, train_59, labels_train_59);
pred_67 = classify(test_67, train_67, labels_train_67);
pred_68 = classify(test_68, train_68, labels_train_68);
pred_69 = classify(test_69, train_69, labels_train_69);
pred_78 = classify(test_78, train_78, labels_train_78);
pred_79 = classify(test_79, train_79, labels_train_79);
pred_89 = classify(test_89, train_89, labels_train_89);

correct_01 = 0; correct_02 = 0; correct_03 = 0; correct_04 = 0; correct_05 = 0; correct_06 = 0; correct_07 = 0; correct_08 = 0; correct_09 = 0;
correct_12 = 0; correct_13 = 0; correct_14 = 0; correct_15 = 0; correct_16 = 0; correct_17 = 0; correct_18 = 0; correct_19 = 0; correct_89 = 0;
correct_23 = 0; correct_24 = 0; correct_25 = 0; correct_26 = 0; correct_27 = 0; correct_28 = 0; correct_29 = 0; correct_78 = 0; correct_79 = 0;
correct_34 = 0; correct_35 = 0; correct_36 = 0; correct_37 = 0; correct_38 = 0; correct_39 = 0; correct_67 = 0; correct_68 = 0; correct_69 = 0;
correct_45 = 0; correct_46 = 0; correct_47 = 0; correct_48 = 0; correct_49 = 0; correct_56 = 0; correct_57 = 0; correct_58 = 0; correct_59 = 0;

for i=1:length(pred_01)
    if pred_01(i) == labels_test_01(i)
        correct_01 = correct_01 + 1;
    end
end
for i=1:length(pred_02)
    if pred_02(i) == labels_test_02(i)
        correct_02 = correct_02 + 1;
    end
end
for i=1:length(pred_03)
    if pred_03(i) == labels_test_03(i)
        correct_03 = correct_03 + 1;
    end
end
for i=1:length(pred_04)
    if pred_04(i) == labels_test_04(i)
        correct_04 = correct_04 + 1;
    end
end
for i=1:length(pred_05)
    if pred_05(i) == labels_test_05(i)
        correct_05 = correct_05 + 1;
    end
end
for i=1:length(pred_06)
    if pred_06(i) == labels_test_06(i)
        correct_06 = correct_06 + 1;
    end
end
for i=1:length(pred_07)
    if pred_07(i) == labels_test_07(i)
        correct_07 = correct_07 + 1;
    end
end
for i=1:length(pred_08)
    if pred_08(i) == labels_test_08(i)
        correct_08 = correct_08 + 1;
    end
end
for i=1:length(pred_09)
    if pred_09(i) == labels_test_09(i)
        correct_09 = correct_09 + 1;
    end
end
for i=1:length(pred_12)
    if pred_12(i) == labels_test_12(i)
        correct_12 = correct_12 + 1;
    end
end
for i=1:length(pred_13)
    if pred_13(i) == labels_test_13(i)
        correct_13 = correct_13 + 1;
    end
end
for i=1:length(pred_14)
    if pred_14(i) == labels_test_14(i)
        correct_14 = correct_14 + 1;
    end
end
for i=1:length(pred_15)
    if pred_15(i) == labels_test_15(i)
        correct_15 = correct_15 + 1;
    end
end
for i=1:length(pred_16)
    if pred_16(i) == labels_test_16(i)
        correct_16 = correct_16 + 1;
    end
end
for i=1:length(pred_17)
    if pred_17(i) == labels_test_17(i)
        correct_17 = correct_17 + 1;
    end
end
for i=1:length(pred_18)
    if pred_18(i) == labels_test_18(i)
        correct_18 = correct_18 + 1;
    end
end
for i=1:length(pred_19)
    if pred_19(i) == labels_test_19(i)
        correct_19 = correct_19 + 1;
    end
end
for i=1:length(pred_23)
    if pred_23(i) == labels_test_23(i)
        correct_23 = correct_23 + 1;
    end
end
for i=1:length(pred_24)
    if pred_24(i) == labels_test_24(i)
        correct_24 = correct_24 + 1;
    end
end
for i=1:length(pred_25)
    if pred_25(i) == labels_test_25(i)
        correct_25 = correct_25 + 1;
    end
end
for i=1:length(pred_26)
    if pred_26(i) == labels_test_26(i)
        correct_26 = correct_26 + 1;
    end
end
for i=1:length(pred_27)
    if pred_27(i) == labels_test_27(i)
        correct_27 = correct_27 + 1;
    end
end
for i=1:length(pred_28)
    if pred_28(i) == labels_test_28(i)
        correct_28 = correct_28 + 1;
    end
end
for i=1:length(pred_29)
    if pred_29(i) == labels_test_29(i)
        correct_29 = correct_29 + 1;
    end
end
for i=1:length(pred_34)
    if pred_34(i) == labels_test_34(i)
        correct_34 = correct_34 + 1;
    end
end
for i=1:length(pred_35)
    if pred_35(i) == labels_test_35(i)
        correct_35 = correct_35 + 1;
    end
end
for i=1:length(pred_36)
    if pred_36(i) == labels_test_36(i)
        correct_36 = correct_36 + 1;
    end
end
for i=1:length(pred_37)
    if pred_37(i) == labels_test_37(i)
        correct_37 = correct_37 + 1;
    end
end
for i=1:length(pred_38)
    if pred_38(i) == labels_test_38(i)
        correct_38 = correct_38 + 1;
    end
end
for i=1:length(pred_39)
    if pred_39(i) == labels_test_39(i)
        correct_39 = correct_39 + 1;
    end
end
for i=1:length(pred_45)
    if pred_45(i) == labels_test_45(i)
        correct_45 = correct_45 + 1;
    end
end
for i=1:length(pred_46)
    if pred_46(i) == labels_test_46(i)
        correct_46 = correct_46 + 1;
    end
end
for i=1:length(pred_47)
    if pred_47(i) == labels_test_47(i)
        correct_47 = correct_47 + 1;
    end
end
for i=1:length(pred_48)
    if pred_48(i) == labels_test_48(i)
        correct_48 = correct_48 + 1;
    end
end
for i=1:length(pred_49)
    if pred_49(i) == labels_test_49(i)
        correct_49 = correct_49 + 1;
    end
end
for i=1:length(pred_56)
    if pred_56(i) == labels_test_56(i)
        correct_56 = correct_56 + 1;
    end
end
for i=1:length(pred_57)
    if pred_57(i) == labels_test_57(i)
        correct_57 = correct_57 + 1;
    end
end
for i=1:length(pred_58)
    if pred_58(i) == labels_test_58(i)
        correct_58 = correct_58 + 1;
    end
end
for i=1:length(pred_59)
    if pred_59(i) == labels_test_59(i)
        correct_59 = correct_59 + 1;
    end
end
for i=1:length(pred_67)
    if pred_67(i) == labels_test_67(i)
        correct_67 = correct_67 + 1;
    end
end
for i=1:length(pred_68)
    if pred_68(i) == labels_test_68(i)
        correct_68 = correct_68 + 1;
    end
end
for i=1:length(pred_69)
    if pred_69(i) == labels_test_69(i)
        correct_69 = correct_69 + 1;
    end
end
for i=1:length(pred_78)
    if pred_78(i) == labels_test_78(i)
        correct_78 = correct_78 + 1;
    end
end
for i=1:length(pred_79)
    if pred_79(i) == labels_test_79(i)
        correct_79 = correct_79 + 1;
    end
end
for i=1:length(pred_89)
    if pred_89(i) == labels_test_89(i)
        correct_89 = correct_89 + 1;
    end
end

accuracy = zeros(45,1);

accuracy(1) = correct_01/length(labels_test_01);
accuracy(2) = correct_02/length(labels_test_02);
accuracy(3) = correct_03/length(labels_test_03);
accuracy(4) = correct_04/length(labels_test_04);
accuracy(5) = correct_05/length(labels_test_05);
accuracy(6) = correct_06/length(labels_test_06);
accuracy(7) = correct_07/length(labels_test_07);
accuracy(8) = correct_08/length(labels_test_08);
accuracy(9) = correct_09/length(labels_test_09);
accuracy(10) = correct_12/length(labels_test_12);
accuracy(11) = correct_13/length(labels_test_13);
accuracy(12) = correct_14/length(labels_test_14);
accuracy(13) = correct_15/length(labels_test_15);
accuracy(14) = correct_16/length(labels_test_16);
accuracy(15) = correct_17/length(labels_test_17);
accuracy(16) = correct_18/length(labels_test_18);
accuracy(17) = correct_19/length(labels_test_19);
accuracy(18) = correct_23/length(labels_test_23);
accuracy(19) = correct_24/length(labels_test_24);
accuracy(20) = correct_25/length(labels_test_25);
accuracy(21) = correct_26/length(labels_test_26);
accuracy(22) = correct_27/length(labels_test_27);
accuracy(23) = correct_28/length(labels_test_28);
accuracy(24) = correct_29/length(labels_test_29);
accuracy(25) = correct_34/length(labels_test_34);
accuracy(26) = correct_35/length(labels_test_35);
accuracy(27) = correct_36/length(labels_test_36);
accuracy(28) = correct_37/length(labels_test_37);
accuracy(29) = correct_38/length(labels_test_38);
accuracy(30) = correct_39/length(labels_test_39);
accuracy(31) = correct_45/length(labels_test_45);
accuracy(32) = correct_46/length(labels_test_46);
accuracy(33) = correct_47/length(labels_test_47);
accuracy(34) = correct_48/length(labels_test_48);
accuracy(35) = correct_49/length(labels_test_49);
accuracy(36) = correct_56/length(labels_test_56);
accuracy(37) = correct_57/length(labels_test_57);
accuracy(38) = correct_58/length(labels_test_58);
accuracy(39) = correct_59/length(labels_test_59);
accuracy(40) = correct_67/length(labels_test_67);
accuracy(41) = correct_68/length(labels_test_68);
accuracy(42) = correct_69/length(labels_test_69);
accuracy(43) = correct_78/length(labels_test_78);
accuracy(44) = correct_79/length(labels_test_79);
accuracy(45) = correct_89/length(labels_test_89);

t = 1:45;
plot(t,accuracy);

[~, worst] = min(accuracy); % 7 and 9
[~, best] = max(accuracy); % 0 and 1
mean(accuracy) % Average accuracy