%% Direcctorio Placas por HU

clc
clear;
close all;

LetrasNums=['0'; '1'; '2';'3';'4';'5';'6';'7';'8';'9';...
            'A';'B';'C';'D';'E';'F';'G';'H';'I';'J';'K';'L';...
            'M';'N';'O';'P';'Q';'R';'S';'T';'U';'V';'W';'X';'Y';'Z'];


PlacaLetNums=zeros(length(LetrasNums),8);
cont=1;
for i=1:length(LetrasNums)
        Letra=strcat(LetrasNums(i),'.jpg');
        RGB=imread(Letra);
        gray=rgb2gray(RGB);
        bin=~imbinarize(gray);
        [B S]=Mascara_Invd(RGB);
        EE=strel('disk', 2);
        B=imclose(~B,EE);

        figure(1)
        subplot(2,2,1)
        imshow(RGB)
        title(strcat('Imagen' , Letra,' A Color'))
        subplot(2,2,2)
        imshow(gray)
        title(strcat('Imagen' , Letra,' En Grises'))
        subplot(2,2,3)
        imshow(bin)
        title(strcat('Imagen' , Letra,' Binarizada OTSU'))
        subplot(2,2,4)
        imshow(B)
        title(strcat('Imagen' , Letra,' Binarizada con Mascara HSV'))

     


        M=invmoments(B); %Devuelve 7 números, momentos de HU
        PlacaLetNums(cont, :)=[M double(LetrasNums(i))];%Se guarda los codigos de la letra
        cont=cont+1;
        %waitforbuttonpress;


end



%Guardamos el Diccionario
save('EntrenamientoPlacas.mat', 'PlacaLetNums')











