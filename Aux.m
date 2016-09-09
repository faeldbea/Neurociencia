function [data] = Aux(itera,data,screens,screenNumber,w)
% DrawSomeText
%
% ___________________________________________________________________
%
%  Trivial example of drawing text.  
% _________________________________________________________________________
%
% see also: PsychDemos

% 3/8/04    awi     Wrote it.
% 7/13/04   awi     Added comments section.  
% 9/8/04    awi     Added Try/Catch, cosmetic changes to documentation.
% 1/21/05   awi     Replaced call to GetChar with call to KbWait. 
% 10/6/05	awi		Note here cosmetic changes by dgp between 1/21/05 and 10/6/05	.


%varias corridas juntas
%input de respuestas
%guardar data


%data =[aparecio_H, respuesta_H, tiempo_H, resultado_suma, respuesta_suma, tiempo_suma, cantText1, cantText2, cantText3]


try
    % Choosing the display with the highest dislay number is
    % a best guess about where you want the stimulus displayed.

    %screens=Screen('Screens');
    %screenNumber=max(screens);
    %w=Screen('OpenWindow', screenNumber);
    
    
    total_diapos = 10;
    tiemp = 0.12;
    cantTextos1 = randsample([2:1:4],1);
    cantTextos2 = randsample([1:1:4],1);
    cantTextos3 = total_diapos - cantTextos1 - cantTextos2;
    data{itera,7} = cantTextos1;
    data{itera,8} = cantTextos2;
    data{itera,9} = cantTextos3;
    posiblesLetras = ['A' 'B' 'C' 'D' 'E' 'F' 'G' 'I' 'J' 'K' 'L' 'M' 'N' 'P' 'R' 'U' 'V'];
    posiblesNumeros = ['1' '2' '3' '4'];
    aparecio_H = false;
    resultado_suma = 0;

    
    tic
    Screen('FillRect', w);
    Screen('TextFont',w, 'Courier New');
    Screen('TextSize',w, 100);
    Screen('TextStyle', w, 1+2);
    Screen('DrawText', w, '  +  ', 800, 500, [0, 0, 255, 255]);
    Screen('Flip',w);
    
    while toc<tiemp*10 %segundos
    end
    
    
    for i=1:1:cantTextos1
        Screen('FillRect', w);
        Screen('TextFont',w, 'Courier New');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        letras = Pierna(posiblesLetras,false);
        Screen('DrawText', w, letras , 800, 500, [0, 0, 255, 255]);
        Screen('Flip',w);
  
    
        HideCursor;
        tic
        while toc<tiemp %segundos
        end
        
    end    
    tic
    Screen('FillRect', w);
    Screen('TextFont',w, 'Courier New');
    Screen('TextSize',w, 100);
    Screen('TextStyle', w, 1+2);
    num1 = ceil(rand()*length(posiblesNumeros));
    num2 = ceil(rand()*length(posiblesNumeros));
    R = [posiblesNumeros(num1) ' + '  posiblesNumeros(num2)];
    resultado_suma = num1+num2;
    data{itera,4} = resultado_suma;
    Screen('DrawText', w, R, 800, 500, [0, 0, 255, 255])

    Screen('Flip',w);
    
    while toc<tiemp %segundos
    end
    
    for i=1:1:cantTextos2
        Screen('FillRect', w);
        Screen('TextFont',w, 'Courier New');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        letras = Pierna(posiblesLetras,false);
        Screen('DrawText', w, letras , 800, 500, [0, 0, 255, 255]);
        Screen('Flip',w);
  
    
        HideCursor;
        tic
        while toc<tiemp %segundos
        end
        
    end    

    tic
    Screen('FillRect', w);
    Screen('TextFont',w, 'Courier New');
    Screen('TextSize',w, 100);
    Screen('TextStyle', w, 1+2);
    if rand()>0.5
        letras = Pierna(posiblesLetras,true);
        Screen('DrawText', w, letras, 800, 500, [0, 0, 255, 255]);
        aparecio_H = true;
    else
        letras = Pierna(posiblesLetras,false);
        Screen('DrawText', w, letras, 800, 500, [0, 0, 255, 255]);
    end
    data{itera,1} = aparecio_H;
    Screen('Flip',w);
    while toc<tiemp %segundos
    end
    
    for i=1:1:cantTextos3
        Screen('FillRect', w);
        Screen('TextFont',w, 'Courier New');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        letras = Pierna(posiblesLetras,false);
        Screen('DrawText', w, letras , 800, 500, [0, 0, 255, 255]);
        Screen('Flip',w);
  
    
        HideCursor;
        tic
        while toc<tiemp %segundos
        end
        
    end 
    
    tic
    Screen('FillRect', w);
    Screen('TextFont',w, 'Courier New');
    Screen('TextSize',w, 100);
    Screen('TextStyle', w, 1+2);
    Screen('DrawText', w, 'X X X', 800, 500, [0, 0, 255, 255]);
    Screen('Flip',w);
    
    while toc<tiemp*3 %segundos
    end
   
    
    escapeKey = KbName('ESCAPE');
    while KbCheck; end % Wait until all keys are released.
    a = true;
    n=0;
    while a
        if n==0
        tic 
        Screen('FillRect', w);
        Screen('TextFont',w, 'Courier New');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        Screen('DrawText', w, 'Â¿Cuanto da la suma?', 500, 450, [0, 0, 255, 255]);
        Screen('Flip',w);
        end
        if n==1
        tic 
        Screen('FillRect', w);
        Screen('TextFont',w, 'Courier New');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        Screen('DrawText', w, 'Â¿Aparecio la H?', 500, 450, [0, 0, 255, 255]);
        Screen('DrawText', w, '( s/n )', 540, 550, [0, 0, 255, 255]);
        Screen('Flip',w);
        end
        if n==2
        tic 
        Screen('FillRect', w);
        Screen('TextFont',w, 'Courier New');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        Screen('DrawText', w, 'Â¿Estas Listo?', 500, 450, [0, 0, 255, 255]);
        Screen('DrawText', w, '(Toca la barra', 450, 550, [0, 0, 255, 255]);
        Screen('DrawText', w, 'dos veces)', 450, 650, [0, 0, 255, 255]);
        Screen('Flip',w);
        end
        
        n = n + 1;
        startSecs = GetSecs;
        timeSecs = KbWait;
        % Check the state of the keyboard.
        [ keyIsDown, seconds, keyCode ] = KbCheck;

        % If the user is pressing a key, then display its code number and name.
        if keyIsDown

            % Note that we use find(keyCode) because keyCode is an array.
            % See 'help KbCheck'
            if n==1
                data{itera,5} = KbName(keyCode);
                data{itera,6} = timeSecs - startSecs;
            end
            if n ==2
                data{itera,2} = KbName(keyCode);
                data{itera,3} = timeSecs - startSecs;
            end

            if keyCode(escapeKey)
                break;
            end

            % If the user holds down a key, KbCheck will report multiple events.
            % To condense multiple 'keyDown' events into a single event, we wait until all
            % keys have been released.
            while KbCheck; end
        end
        if n==3
            a=false;
        end
        while toc<tiemp*3 %segundos
        end
    end
    
    KbWait;     
    %Screen('CloseAll');
    ShowCursor;

catch
    % This "catch" section executes in case of an error in the "try" section
    % above.  Importantly, it closes the onscreen window if it's open.
    %Screen('CloseAll');
    ShowCursor;
    psychrethrow(psychlasterror);
end

end
function [RV] = Pierna(posiblesLetras,con_H)

if con_H
    n1 = ceil(rand()*length(posiblesLetras));
    n2 = ceil(rand()*length(posiblesLetras));

    RV = [posiblesLetras(n1) ' ' 'H' ' ' posiblesLetras(n2) ];
else
    n1 = ceil(rand()*length(posiblesLetras));
    n2 = ceil(rand()*length(posiblesLetras));
    n3 = ceil(rand()*length(posiblesLetras));

    RV = [posiblesLetras(n1) ' ' posiblesLetras(n2) ' ' posiblesLetras(n3) ];
end
end
