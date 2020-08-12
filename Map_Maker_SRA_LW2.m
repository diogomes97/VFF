clear all;close all;clc;
disp("==== Started ====");
tic
I = imread('BW_0.png');
imshow(I);
I = double(rgb2gray(I))./255; % Binarizar Imagem

I=~I; % Flip 1=Preto|0=Branco
I = flipdim(I ,1); % vertical flip

figure();
imshow(I);
str="";
file = fopen('enviroment.txt','w');
for i=1:size(I,1) % Linhas
    str=strcat(str,"{");
    for j=1:size(I,2) % Colunas
        if(j==1),str=strcat(str,num2str(I(i,j)));
        else,str=strcat(str,",",num2str(I(i,j)));end
    end
    if(i==size(I,1)),str=strcat(str,"}");
    else,str=strcat(str,"},");end
    
    fprintf(file,strcat("\t\t",str,"\n"));
    str="";
end
disp(str)
fclose(file);
fprintf(" Elapsed(seg): ");
disp(toc);
disp("==== Finished ====");