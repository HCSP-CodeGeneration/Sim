% %same speed
% model1='scope_test';
% model2='scope_test2';
% stepSize=0.1;
% output_m1=[];
% output_m2=[];
% for k=1:1:20 %exe k/2 stepSize for two model, model1's output is the input of model2, model2's output is the input of model1
%     if k==1
%         [output1 nextState1]= simForward(model1, [0,0], 0, stepSize,[]);
%         output_m1=[output_m1;output1];
%     elseif k==2
%         [output2 nextState2]= simForward(model2, output1, 0, stepSize,[]);
%          output_m2=[output_m2;output2];
%     elseif mod(k,2)==1
%         [output1 nextState1]= simForward(model1, output2, stepSize*(k-1)/2, stepSize,nextState1);
%         output_m1=[output_m1;output1];
%     else
%         [output2 nextState2]= simForward(model2, output1, stepSize*(k/2-1), stepSize,nextState2);
%          output_m2=[output_m2;output2];
%     end
% end
% output_m1=unique(output_m1,'rows');
% output_m2=unique(output_m2,'rows');
% figure;
% plot(output_m1(:,1),output_m1(:,2),'r--',output_m2(:,1),output_m2(:,2));
% grid on;


% fast VS slow
model1='scope_test';
model2='scope_test2';
stepSize=0.1;
output_m1=[];
output_m2=[];
for k=1:1:20 %exe k/2 stepSize for two model, model1's output is the input of model2, model2's output is the input of model1
    if k==1
        [output1 nextState1]= simForward(model1, [0,0], 0, stepSize,[]);
        output_m1=[output_m1;output1];
    elseif k==2
        [output2 nextState2]= simForward(model2, output1, 0, 2*stepSize,[]);
         output_m2=[output_m2;output2];
    elseif mod(k,2)==1
        [output1 nextState1]= simForward(model1, output2, stepSize*(k-1)/2, stepSize,nextState1);
        output_m1=[output_m1;output1];
    else
        [output2 nextState2]= simForward(model2, output1, stepSize*(k-2), 2*stepSize,nextState2);
         output_m2=[output_m2;output2];
    end
end
output_m1=unique(output_m1,'rows');
output_m2=unique(output_m2,'rows');
figure;
plot(output_m1(:,1),output_m1(:,2),'r--',output_m2(:,1),output_m2(:,2));
grid on;
