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
pressed = 0;

while true
    t = toc(tvar);
        [Error state]= ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,9,0,0); % Read switch
        Error_Message(Error)
        
        if (state == 0)  % Check if switch button was pressed
            pressed = 1
        end
         
        if t <= 10
            if pressed == 1
                Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,0,0,0);%Red1SW
                Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,7,1,0);%Grn1SW on
            
                pressed = 0;
            end
        end
        
        if t > 10 && t <= 30
             Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,0,1,0);%Red1SW on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,7,0,0);%Grn1SW 
        end
        
        if t > 30
            tvar = tic;
        end
    
end 