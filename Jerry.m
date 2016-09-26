function Jerry(screens,screenNumber,w,letras,cfg,tiempo)

        Screen('FillRect', w);
        Screen('TextFont',w, 'Helvetica');
        Screen('TextSize',w, 100);
        Screen('TextStyle', w, 1+2);
        Screen('DrawText', w, letras(1) , 800, 500, cfg.colLetras);
        Screen('DrawText', w, letras(3) , 900, 500, cfg.colLetras);
        Screen('DrawText', w, letras(5) , 1000, 500, cfg.colLetras);
        Screen('Flip',w);
      
        HideCursor;
        tic
        while toc<tiempo %segundos
        end
        
end
