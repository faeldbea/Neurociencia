%guardar con 'nombre_c' control o 'nombre_p' para el posta
%Morty('nombre_c/p',cantidad de iteracioens, 0 para posta/1 para el control
      

% control:  letra roja + H  x 4 lag
% expe:     suma + H        x 4 lag
% 

% Un trial:
%   - 20 estimulos
%   - c/ estimulo dura (0.018*3 + 0.018*3) = 0.108 s
%   - 20 * 0.108s = 2.16s
%   - respuesta 3s
%   - TOTAL = 6s

% 60s para completar una vuelta

% 15 repeticiones por tipo de trial

% 15 minutos

% IDEAL: 
% 1. Setear el numero de trials fijo para todos y despues permutar
%       LAG                 = [0 1 3 5 8];
%       Donde 0 significa no presentar la H.
%
% 2. Pasar todos los parametros al script ppal, y guardarlos junto con los
%       resultados

function [data] = Morty(sujname, it, control)
    if ~(exist('data')==7); fprintf('ERROR: No esta el directorio data\n'); return; end
        
    data = {0 0 0 0 0 0 0 0 0};
    screens=Screen('Screens');
    screenNumber=max(screens);
    w=Screen('OpenWindow', screenNumber,0);
%     w=Screen('OpenWindow', screenNumber,0,[50 50 1000 1000]);

    params.flipratereal = Screen('GetFlipInterval',w);
    try
        if control  
            l = [2 3 4];
            ls = repmat(l,1,ceil(it/3));
            ls = ls( randperm(length(ls)));

            LAG                 = [1 3 5 8];
            lags                = repmat(LAG,1,ceil(it/4));
            lags = lags( randperm(length(lags)));

            porcentaje = 0.75;
            aparecio_H = [ones(1,floor(porcentaje*it)) zeros(1,it-floor(porcentaje*it))];
            aparecio_H =  aparecio_H(randperm(length(aparecio_H)));

            posiblesLetras = ['B' 'C' 'D' 'E' 'F' 'G' 'J' 'K' 'L' 'M' 'N' 'P' 'R' 'T' 'U' 'V' 'Y' ];
            for k=1:1:it
               letras_rojas(k) = posiblesLetras(ceil(rand()*length(posiblesLetras)));
            end
            for i=1:1:it    
                data=Snowball(i,data,screens,screenNumber,w,ls(i),lags(i),aparecio_H(i),letras_rojas(i));
            end
            Screen('CloseAll');    
        else 
            l = [2 3 4];
            ls = repmat(l,1,ceil(it/3));
            ls = ls( randperm(length(ls)));

            LAG                 = [1 3 5 8];
            lags                = repmat(LAG,1,ceil(it/4));
            lags = lags( randperm(length(lags)));

            porcentaje = 0.7;
            aparecio_H = [ones(1,floor(porcentaje*it)) zeros(1,it-floor(porcentaje*it))];
            aparecio_H =  aparecio_H(randperm(length(aparecio_H)));
            for i=1:1:it
                data=AntsInMyEyesJohnson(i,data,screens,screenNumber,w,ls(i),lags(i),aparecio_H(i));
            end
            Screen('CloseAll');
        end
    %catch ME
     %   Screen('CloseAll');
      %  keyboard
    end
    params.LAGS = LAG;

    save(['data/' sujname],'data','params')
end