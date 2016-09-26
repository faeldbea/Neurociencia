function [data] = AntsInMyEyesJohnson(itera,data,screens,screenNumber,w,c1,c2,aparecio_H)
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
    
    
    total_diapos = 20;
%     tiemp = 0.018;  %no se ve entre 0,018 y 0,045 s         //paper 0,015
%     tiempNegro = 5*tiemp;

    frame = 0.018;
    tiemp       = 3*frame;  %no se ve entre 0,018 y 0,045 s         //paper 0,015
    tiempNegro  = 3*frame;
    cantTextos1 = c1;
    cantTextos2 = c2;
    cantTextos3 = total_diapos - cantTextos1 - cantTextos2;
    data{itera,7} = cantTextos1;
    data{itera,8} = cantTextos2;
    data{itera,9} = cantTextos3;
    posiblesLetras = ['B' 'C' 'D' 'E' 'F' 'G' 'J' 'K' 'L' 'M' 'N' 'P' 'R' 'T' 'U' 'V' 'Y' ];
    posiblesNumeros = ['1' '2' '3' '4'];

   
    
    
    cfg.posLetras = [700 800 900];
    cfg.colLetras = [255 255 255 255];
    cfg.colBackGround = [0 0 0 255];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    esKey = KbName('space');
while KbCheck; end % Wait until all keys are released.

while 1
    % Check the state of the keyboard.
	[ keyIsDown, seconds, keyCode ] = KbCheck;

    % If the user is pressing a key, then display its code number and name.
    if keyIsDown

        % Note that we use find(keyCode) because keyCode is an array.
        % See 'help KbCheck'

        if keyCode(esKey)
            break;
        end
        
        % If the user holds down a key, KbCheck will report multiple events.
        % To condense multiple 'keyDown' events into a single event, we wait until all
        % keys have been released.
        while KbCheck; end
    end
end

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    letras = [' ' ' ' '+' ' ' ' '];
    Jerry(screens,screenNumber,w,letras,cfg,tiemp*3)
    
    for i=1:1:cantTextos1
        
       
        letras = Pierna(posiblesLetras,false);
        Jerry(screens,screenNumber,w,letras,cfg,tiemp)
        
        letras = [' ' ' ' ' ' ' ' ' '];
        Jerry(screens,screenNumber,w,letras,cfg,tiempNegro)
        
    end    

    num1 = ceil(rand()*length(posiblesNumeros));
    num2 = ceil(rand()*length(posiblesNumeros));
    letras = [posiblesNumeros(num1) ' ' '+' ' ' posiblesNumeros(num2)];
    Jerry(screens,screenNumber,w,letras,cfg,tiemp)
    resultado_suma = num1+num2;
    data{itera,4} = resultado_suma;
    
    letras = [' ' ' ' ' ' ' ' ' '];
    Jerry(screens,screenNumber,w,letras,cfg,tiempNegro)
        
    
    for i=1:1:cantTextos2

        letras = Pierna(posiblesLetras,false);
        Jerry(screens,screenNumber,w,letras,cfg,tiemp)
        
        letras = [' ' ' ' ' ' ' ' ' '];
        Jerry(screens,screenNumber,w,letras,cfg,tiempNegro)
        
    end    


    if aparecio_H
        letras = Pierna(posiblesLetras,true);
        Jerry(screens,screenNumber,w,letras,cfg,tiemp)
    else
        letras = Pierna(posiblesLetras,false);
        Jerry(screens,screenNumber,w,letras,cfg,tiemp)
    end
    data{itera,1} = aparecio_H;
        
    letras = [' ' ' ' ' ' ' ' ' '];
    Jerry(screens,screenNumber,w,letras,cfg,tiempNegro)

    
    for i=1:1:cantTextos3
        letras = Pierna(posiblesLetras,false);
        Jerry(screens,screenNumber,w,letras,cfg,tiemp)
        
        letras = [' ' ' ' ' ' ' ' ' '];
        Jerry(screens,screenNumber,w,letras,cfg,tiempNegro)       
    end 
    
    letras = ['X' ' ' 'X' ' ' 'X'];
    Jerry(screens,screenNumber,w,letras,cfg,tiemp*3)

    
    escapeKey = KbName('ESCAPE');
    while KbCheck; end % Wait until all keys are released.
    a = true;
    n=0;
    while a
        if n==0
        tic 
        Screen('FillRect', w);
        Screen('TextFont',w, 'Helvetica');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        Screen('DrawText', w, '¿Cuanto da la suma?', 500, 450, cfg.colLetras);
        Screen('Flip',w);
        end
        if n==1
        tic 
        Screen('FillRect', w);
        Screen('TextFont',w, 'Helvetica');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        Screen('DrawText', w, '¿Aparecio la H?', 500, 450, cfg.colLetras);
        Screen('DrawText', w, '( s/n )', 540, 550, cfg.colLetras);
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
        if n==2
            a=false;
        end
        while toc<tiemp*3 %segundos
        end
    end
    tic 
    Screen('FillRect', w);
    Screen('TextFont',w, 'Helvetica');
    Screen('TextSize',w, 100);
    Screen('TextStyle', w, 1+2);
    Screen('DrawText', w, '¿Estas listo?', 600, 450, cfg.colLetras);
    Screen('DrawText', w, '(Toca la barra dos veces)', 400, 550, cfg.colLetras);
    Screen('Flip',w);
    while toc<tiemp*3 %segundos
    end
    [secs, keyCode, deltaSecs] = KbWait;   
    if keyCode(KbName('Escape')) 
        save temp
        return
    end
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
