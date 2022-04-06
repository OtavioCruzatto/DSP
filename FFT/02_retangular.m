% Gerando e plotando a FFT de uma onda retangular.

clear all;  % Apaga variaveis e seus valores.
close all;  % Fecha janelas.
clc;  % Limpa o terminal.

freq_sinal = 1000;  % Frequencia do sinal [Hz] = [ciclos/seg].
T_sinal = 1 / freq_sinal; % Período do sinal [seg].

freq_amost = 100000; % Frequencia de amostragem [Hz] = [amostras/seg].
T_amostragem = 1 / freq_amost;  % Período de amostragem [seg].

% Quantidade de amostras realizadas dentro de um ciclo do sinal [amostras/ciclo].
qtd_amostras_por_ciclo = freq_amost / freq_sinal;

% Intervalo de tempo (passo), em que cada amostra é realizada [seg].
intervalo_entre_amostras = T_sinal / qtd_amostras_por_ciclo;

ciclos = 1000; % Quantidade de ciclos completos do sinal.

% Quantidade total de amostras em x 'ciclos'.
qtd_tot_amost = ciclos * qtd_amostras_por_ciclo;

% Vetor tempo [segundos]:
% De 0 ao valor necessário para completar x 'ciclos' do sinal.
% O passo do incremento do vetor é período de amostragem 'T_amostragem'. 
tempo = 0 : T_amostragem : (ciclos * T_sinal) - T_amostragem; 

duty_cycle = 50;  % Ciclo ativo do sinal (parte alta) [%].
amp_alto = 1;  % Amplitude do sinal durante o tempo alto.
amp_baixo = 0;  % Amplitude do sinal durante o tempo baixo. 

% Vetor onda_retangular_aux:
% Algoritmo para a geração de apenas um ciclo (período) do sinal.
cont = 1;
onda_retangular_aux = [];
while (cont <= length(tempo))
  if ( tempo(cont) < ((duty_cycle/100)*T_sinal) )
    onda_retangular_aux(cont) = amp_alto;
  elseif ( tempo(cont) < T_sinal )
    onda_retangular_aux(cont) = amp_baixo;
  endif
  cont++;
endwhile

% Vetor onda_retangular:
% Algoritmo para a geração da quantidade de ciclos solicitada na variável 'ciclos'.
ciclo = 1;
onda_retangular = [];
while (ciclo <= ciclos)
  if (length(onda_retangular) == 0)
    onda_retangular(1:length(onda_retangular_aux)) = onda_retangular_aux(1:length(onda_retangular_aux));
  elseif
    onda_retangular(length(onda_retangular)+1:ciclo*length(onda_retangular_aux)) = onda_retangular_aux(1:length(onda_retangular_aux));
  endif
  ciclo++;
endwhile

% Calculo do módulo (abs) da transformada rápida de fourier (fft);
onda_ret_dom_freq = abs(fft(onda_retangular, freq_amost));
onda_ret_dom_freq = onda_ret_dom_freq(1:freq_amost/2);

figure
plot(tempo, onda_retangular(1:length(tempo))); % Plota o sinal de forma pseudo-contínua.

figure
stem(tempo, onda_retangular(1:length(tempo))); % Plota o sinal com os pontos discretos amostrados.

figure
plot(onda_ret_dom_freq); % Plota a fft do sinal.

