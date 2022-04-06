% Gerando e plotando uma onda triangular.

clear all;  % Apaga variaveis e seus valores.
close all;  % Fecha janelas.
clc;  % Limpa o terminal.

freq_sinal = 3;  % Frequencia do sinal [Hz] = [ciclos/seg].
T_sinal = 1 / freq_sinal; % Período do sinal [seg].

freq_amost = 300; % Frequencia de amostragem [Hz] = [amostras/seg].
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

amp = 3;  % Amplitude do sinal durante o tempo alto.

% Vetor onda_triangular_aux:
% Algoritmo para a geração de apenas um ciclo (período) do sinal.
cont = 1;
onda_triangular_aux = [];
while (cont <= length(tempo))
  if (tempo(cont) <= (T_sinal / 2))
    onda_triangular_aux(cont) = ((2 * amp) / T_sinal) * tempo(cont);
  elseif (tempo(cont) < T_sinal)
    onda_triangular_aux(cont) = (((-2 * amp) / T_sinal) * tempo(cont)) + (2 * amp);
  endif
  cont++;
endwhile

% Vetor onda_triangular:
% Algoritmo para a geração da quantidade de ciclos solicitada na variável 'ciclos'.
ciclo = 1;
onda_triangular = [];
while (ciclo <= ciclos)
  if (length(onda_triangular) == 0)
    onda_triangular(1:length(onda_triangular_aux)) = onda_triangular_aux(1:length(onda_triangular_aux));
  elseif
    onda_triangular(length(onda_triangular)+1:ciclo*length(onda_triangular_aux)) = onda_triangular_aux(1:length(onda_triangular_aux));
  endif
  ciclo++;
endwhile

figure
plot(tempo, onda_triangular(1:length(tempo))); % Plota o sinal de forma pseudo-contínua.

figure
stem(tempo, onda_triangular(1:length(tempo))); % Plota o sinal com os pontos discretos amostrados.