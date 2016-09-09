function [data] = Morty(it)
data = {0 0 0 0 0 0 0 0 0};
screens=Screen('Screens');
screenNumber=max(screens);
w=Screen('OpenWindow', screenNumber);

for i=1:1:it
    %data=Hola(i,data);
    
    
    data=Hola(i,data,screens,screenNumber,w);
end
Screen('CloseAll');
end
