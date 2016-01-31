% To prove the simulink model can rollback
input1=[0,0.5;0.2,0.7;0.4,0.5];
out1 = sim('scope_test', 'StopTime', num2str(0.5), 'SaveFinalState', 'on', ...
          'LoadInitialState', 'off','LoadExternalInput', 'on','ExternalInput', 'input1', 'SaveCompleteFinalSimState', 'on',...
          'FinalStateName', 'currentState'); % do one step, do not load state, save state in nextState variable 
assignin('base', 'currentState', out1.get('currentState'));
output1=[out1.get('yout').time,out1.get('yout').signals(1).values]; %get output with time 
output1=unique(output1,'rows'); %unique the output

input2=[0.5,1];
out2 = sim('scope_test', 'StopTime', num2str(1),'SaveFinalState', 'on', ...
           'LoadInitialState', 'on','LoadExternalInput', 'on', 'ExternalInput', 'input2','InitialState', 'currentState','SaveCompleteFinalSimState', 'on',...
          'FinalStateName', 'nextState'); % do one step from startTime, load currentState, save state in nextState variable 
output2=[out2.get('yout').time,out2.get('yout').signals(1).values]; %get output with time 
output2=unique(output2,'rows'); %unique the output

input3=[0.5,2;0.6,3;0.8,4];
out3 = sim('scope_test', 'StopTime', num2str(1),'SaveFinalState', 'on', ...
           'LoadInitialState', 'on','LoadExternalInput', 'on', 'ExternalInput', 'input3','InitialState', 'currentState','SaveCompleteFinalSimState', 'on',...
          'FinalStateName', 'nextState'); % do one step from startTime, load currentState, save state in nextState variable 
output3=[out3.get('yout').time,out3.get('yout').signals(1).values]; %get output with time 
output3=unique(output3,'rows'); %unique the output

plot(output1(:,1),output1(:,2),'r--',output2(:,1),output2(:,2),'b--',output3(:,1),output3(:,2),'g--');

     
     