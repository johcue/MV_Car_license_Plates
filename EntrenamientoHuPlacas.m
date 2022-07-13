%% Direcctorio Placas por HU

clc
clear;
close all;

Letras=['A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';...
    'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z'];

Numeros=['0'; '1'; '2';'3';'4';'5';'6';'7';'8';'9'];


PlacaLetras=zeros(length(Letras),8);
cont=1;
for i=1:length(Letras)
        Letra=strcat(Letras(i),'.jpg');
        RGB=imread(Letra);
        gray=rgb2gray(RGB);
        B=imbinarize(gray);
        

        figure(1)
        subplot(1,2,1)
        imshow(RGB)
        title(strcat('Imagen' , Letra,' A Color'))
        subplot(1,2,2)
        imshow(B)
        title(strcat('Imagen' , Letra,' Binarizada'))
     


        M=invmoments(B) %Devuelve 7 números, momentos de HU
        PlacaLetras(cont, :)=[M double(Letras(i))];%Se guarda los codigos de la letra
        cont=cont+1;
        pause(0.5)


end

PlacaNumbs=zeros(length(Numeros),8);
cont1=1;
for i=1:length(Numeros)
        Numbs=strcat(Numeros(i),'.jpg');
        RGB=imread(Numbs);
        gray=rgb2gray(RGB);
        B=imbinarize(gray);

        figure(2)
        subplot(1,2,1)
        imshow(RGB)
        title(strcat('Imagen' , Numbs,' A Color'))
        subplot(1,2,2)
        imshow(B)
        title(strcat('Imagen' , Numbs,' Binarizada'))

        M1=invmoments(B) %Devuelve 7 números, momentos de HU
        PlacaNumbs(cont1, :)=[M1 double(Numeros(i))];%Se guarda los codigos de la letra
        cont1=cont1+1;
        %pause(0.5)


end

%Guardamos el Diccionario
save('Plsjustkillme.mat', 'PlacaLetras', 'PlacaNumbs')











