function [output nextState] = simForward(modelName, input, startTime, stepSize, currentState)
% load_system(modelName);
output=[];
assignin('base', 'input', input);% save input in base workspace, global, using for sim command
assignin('base', 'currentState', currentState);% save currentState in base workspace, global, using for sim command
      if startTime==0 %simulation start
         out = sim(modelName, 'StopTime', num2str(stepSize), 'SaveFinalState', 'on', ...
          'LoadInitialState', 'off','LoadExternalInput', 'on','ExternalInput', 'input', 'SaveCompleteFinalSimState', 'on',...
          'FinalStateName', 'nextState'); % do one step, do not load state, save state in nextState variable 
     else
         out = sim(modelName, 'StopTime', num2str(startTime+stepSize),'SaveFinalState', 'on', ...
           'LoadInitialState', 'on','LoadExternalInput', 'on', 'ExternalInput', 'input','InitialState', 'currentState','SaveCompleteFinalSimState', 'on',...
          'FinalStateName', 'nextState'); % do one step from startTime, load currentState, save state in nextState variable 
     end
     nextState=out.get('nextState'); %save nextState in the nextState variable
     output=[output; [out.get('yout').time,out.get('yout').signals(1).values]]; %get output with time 
%      output=unique(output,'rows'); %unique the output
%      plot(output(:,1),output(:,2));
%      close_system(modelName, 0);
end



% function [output] = simForward(modelName, startTime, stepSize,endTime)
% load_system(modelName);
% output=[];
% t=0:0.5:2;
% u=t;
% input=[t',u'];
% assignin('base', 'input', input);
% for k=startTime:stepSize:endTime
%      if k==0
%          out = sim(modelName, 'StopTime', num2str(stepSize), 'SaveFinalState', 'on', ...
%           'LoadInitialState', 'off','LoadExternalInput', 'on','ExternalInput', 'input', 'SaveCompleteFinalSimState', 'on',...
%           'FinalStateName', 'xFinal');
%      else
%          out = sim(modelName, 'StopTime', num2str(k+stepSize),'SaveFinalState', 'on', ...
%            'LoadInitialState', 'on','LoadExternalInput', 'on', 'ExternalInput', 'input','InitialState', 'xFinal','SaveCompleteFinalSimState', 'on',...
%           'FinalStateName', 'xFinal');
%      end
%      assignin('base', 'xFinal', out.get('xFinal'));
%      output=[output; [out.get('yout').time,out.get('yout').signals(1).values]];
%      output=unique(output,'rows');
% end
% plot(output(:,1),output(:,2));
% close_system(modelName, 0);
% end






