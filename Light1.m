clc
clear global

% Load LabJack UD library and initialize LabJack constants
ljud_LoadDriver
ljud_Constants
 
% Open the first found LabJack U3
[Error ljHandle] = ljud_OpenLabJack(LJ_dtU3,LJ_ctUSB,'1',1);
Error_Message(Error)
 
% Set all pin assignments to the factory default condition
Error = ljud_ePut(ljHandle, LJ_ioPIN_CONFIGURATION_RESET,0,0,0);
Error_Message(Error)

tvar = tic;

while true
    t = toc(tvar);
        if t <= 10 
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,1,0);%Red1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,0,0);%Ylw1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,0,0);%Grn1
        end
        
        if t > 10 && t <= 15 
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,1,0);%Red1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,0,0);%Ylw1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,0,0);%Grn1
        end
        
    
        if t > 15 && t <= 25
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,0,0);%Red1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,0,0);%Ylw1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,1,0);%Grn1 on
        end
        
        if t > 25 && t <= 30 %Yellow 1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,0,0);%Red1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,1,0);%Ylw1 on            
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,0,0);%Grn1 
        end 
        
        if t > 30
            tvar = tic;
        end
    
end 
