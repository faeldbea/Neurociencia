function Rick(data)

%data =[aparecio_H, respuesta_H, tiempo_H, resultado_suma, respuesta_suma, tiempo_suma, cantText1, cantText2, cantText3]

%dado o no que pego a la suma
%grafico x: cantText 2    y:porcentaje que le pego dado el total
tam = size(data);
alba = 10;
x1 = 1:1:alba;
y1 = zeros(1,alba);
for i=1:1:tam(1)
        if (data{i,1}==1)
            if(data{i,2} == 's')
                y1(data{i,8}) = y1(data{i,8}) + 1;
            end
        end
end

x2 = 1:1:alba;
y2 = zeros(1,alba);
for i=1:1:tam(1)
        if (data{i,1}==1)
            if(data{i,2} == 's')
                if data{i,4} == str2num(data{i,5})
                    y2(data{i,8}) = y2(data{i,8}) + 1;
                end
            end
        end
end
figure(1)
title('A.B. total')
plot(x1,y1)
figure(2)
title('A.B. si le pego a la suma')
plot(x2,y2)
end
