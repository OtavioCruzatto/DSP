% Gerando e plotando uma senoide.

clear all;  % Apaga variaveis e seus valores.
close all;  % Fecha janelas.
clc;  % Limpa o terminal.

freq_senoide = 1; % Frequencia do sinal em Hz.
w = 2 * pi * freq_senoide;  % Frequencia angular em rad/s.
T_senoide = 1 / freq_senoide;  % Período da senoide em segundos.

freq_amost = 20;  % Frequencia de amostragem do sinal em Hz.
T_amost = 1 / freq_amost; % Período da amostragem do sinal em segundos.

% Quantidade de amostras realizadas dentro de um ciclo da senoide [amostras/ciclo].
qtd_amost_por_ciclo = freq_amost / freq_senoide;

% Intervalo de tempo (passo), em que cada amostra é realizada [seg].
intervalo_entre_amostras = T_senoide / qtd_amost_por_ciclo;

ciclos = 1; % Quantidade de ciclos completos da senoide.

% Vetor tempo [segundos]:
% De 0 ao valor necessário para completar x 'ciclos' da senoide.
% O passo do incremento do vetor é período de amostragem 'T_amost'. 
t = 0 : T_amost : (ciclos * T_senoide);   

amp = 10;

senoide = amp * sin(w * t); % Criação do sinal senoidal.

figure
plot(t, senoide); % Plota o sinal de forma pseudo-contínua.

figure
stem(t, senoide); % Plota o sinal com os pontos discretos amostrados.
