function Rick(data)

%data =[aparecio_H, respuesta_H, tiempo_H, resultado_suma, respuesta_suma, tiempo_suma, cantText1, cantText2, cantText3]

%dado o no que pego a la suma
%grafico x: cantText 2    y:porcentaje que le pego dado el total
alba = size(data)  ;
LAG = [1 3 5 8];
x1 = [1 2 3 4 5  6 7 8];
y1 = zeros(1,length(x1));
y2 = zeros(1,length(x1));
for i=1:1:alba(1)
        if (data{i,1}==1)
            if(data{i,2} == 's')
                y1(data{i,8}) = y1(data{i,8}) + 1;
            end
            if(data{i,2} == 'n')
                y2(data{i,8}) = y2(data{i,8}) - 1;
            end
        end
end

figure(1)
title('A.B. total')
scatter(x1,y1,'b')
hold on
scatter(x1,y2,'r')
y2
y1

end