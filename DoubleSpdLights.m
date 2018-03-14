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
        [Error state]= ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,8,0,0); % Read switch
        Error_Message(Error)
         if (state == 0)  % Check if switch button was pressed
            pressed = 1
         end
         
        [Error state]= ljud_eGet(ljHandle, LJ_ioGET_DIGITAL_BIT,9,0,0); % Read switch
        Error_Message(Error)
         if (state == 0)  % Check if switch button was pressed
            pressed = 1
         end
            
        if t <= 10 %Green 2 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,1,0);%Red1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,0,0);%Ylw1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,0,0);%Grn1

            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,4,0,0);%Red2       
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,5,0,0);%Ylw2
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,6,1,0);%Grn2 on
            
            disp('North lane is green')
            disp('West lane is red')
            disp('Pedestrian signal is red')

            if pressed == 1
                Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,0,0,0);%Red1SW
                Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,7,1,0);%Grn1SW on
            
                disp('Pedestrian signal is green')
                
                pressed = 0;
            end
        end

        if t > 10 && t <= 15 % Yellow 2 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,1,0);%Red1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,0,0);%Ylw1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,0,0);%Grn1

            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,4,0,0);%Red2       
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,5,1,0);%Ylw2 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,6,0,0);%Grn2 

            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,0,1,0);%Red1SW on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,7,0,0);%Grn1SW 
            
            disp('North lane is yellow')
            disp('West lane is red')
            disp('Pedestrian signal is red')
        end
    
        if t > 15 && t <= 25 %Green 1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,0,0);%Red1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,0,0);%Ylw1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,1,0);%Grn1 on
        
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,4,1,0);%Red2 on      
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,5,0,0);%Ylw2       
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,6,0,0);%Grn2 

            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,0,1,0);%Red1SW on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,7,0,0);%Grn1SW 
            
            disp('North lane is red')
            disp('West lane is green')
            disp('Pedestrian signal is red')
        end
    
        if t > 25 && t <= 30 %Yellow 1 on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,1,0,0);%Red1
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,2,1,0);%Ylw1 on            
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,3,0,0);%Grn1 
        
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,4,1,0);%Red2 on      
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,5,0,0);%Ylw2   
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,6,0,0);%Grn2 
        
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,0,1,0);%Red1SW on
            Error = ljud_ePut(ljHandle, LJ_ioPUT_DIGITAL_BIT,7,0,0);%Grn1SW
            
            disp('North lane is red')
            disp('West lane is yellow')
            disp('Pedestrian signal is red')
        end
    
        if t > 30
            tvar = tic;
        end
    
end 

