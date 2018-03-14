clc
clear all

prompt2 = 'Diagnostic Mode Options';
l1 = 'Light 1';
l2 = 'Light 2';
s1 = 'Switch 1';
s2 = 'Switch 2';
exit = 'Exit Program';

Mode = menu(prompt2,l1,l2,s1,s2,exit) ; 

switch Mode
    case 1 
        Light1
        
    case 2
        Light2
        
    case 3
        Switch1
        
    case 4
        Switch2
        
    case 5
        Turnoffleds
        return
end