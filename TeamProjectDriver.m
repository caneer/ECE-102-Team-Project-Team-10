clc
clear all
prompt1 = 'Options';
c1 = 'Normal Mode';
c2 = 'Double Speed Mode';
c3 = 'Diagnostic Mode';
c4 = 'Exit Program';

choice = menu(prompt1,c1,c2,c3,c4) ; 

switch choice
    case 1
       NormalSpdLights
        
    case 2
       DoubleSpdLights
        
    case 3
        DiagnosticMode
        
    case 4
        Turnoffleds
        return
end
