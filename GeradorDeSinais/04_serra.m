% Gerando e plotando uma onda dente de serra.

clear all;  % Apaga variaveis e seus valores.
close all;  % Fecha janelas.
clc;  % Limpa o terminal.

freq_sinal = 3;  % Frequencia do sinal [Hz] = [ciclos/seg].
T_sinal = 1 / freq_sinal; % Período do sinal [seg].

freq_amost = 100; % Frequencia de amostragem [Hz] = [amostras/seg].
T_amostragem = 1 / freq_amost;  % Período de amostragem [seg].

% Quantidade de amostras realizadas dentro de um ciclo do sinal [amostras/ciclo].
qtd_amostras_por_ciclo = freq_amost / freq_sinal;

% Intervalo de tempo (passo), em que cada amostra é realizada [seg].
intervalo_entre_amostras = T_sinal / qtd_amostras_por_ciclo;

ciclos = 3; % Quantidade de ciclos completos do sinal.

% Vetor tempo [segundos]:
% De 0 ao valor necessário para completar x 'ciclos' do sinal.
% O passo do incremento do vetor é período de amostragem 'T_amostragem'. 
tempo = 0 : T_amostragem : (ciclos * T_sinal) - T_amostragem; 

amp = 1;  % Amplitude do sinal durante o tempo alto.

% Vetor onda_dente_de_serra_aux:
% Algoritmo para a geração de apenas um ciclo (período) do sinal.
cont = 1;
onda_dente_de_serra_aux = [];
while (cont <= length(tempo))
  if (tempo(cont) < T_sinal)
    onda_dente_de_serra_aux(cont) = (amp / T_sinal) * tempo(cont);
  endif
  cont++;
endwhile

% Vetor onda_dente_de_serra:
% Algoritmo para a geração da quantidade de ciclos solicitada na variável 'ciclos'.
ciclo = 1;
onda_dente_de_serra = [];
while (ciclo <= ciclos)
  if (length(onda_dente_de_serra) == 0)
    onda_dente_de_serra(1:length(onda_dente_de_serra_aux)) = onda_dente_de_serra_aux(1:length(onda_dente_de_serra_aux));
  elseif
    onda_dente_de_serra(length(onda_dente_de_serra)+1:ciclo*length(onda_dente_de_serra_aux)) = onda_dente_de_serra_aux(1:length(onda_dente_de_serra_aux));
  endif
  ciclo++;
endwhile

figure
plot(tempo, onda_dente_de_serra(1:length(tempo))); % Plota o sinal de forma pseudo-contínua.

figure
stem(tempo, onda_dente_de_serra(1:length(tempo))); % Plota o sinal com os pontos discretos amostrados.