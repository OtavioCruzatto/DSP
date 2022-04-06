% Este script gera uma sen�ide de amplitude unit�ria, frequ�ncia de 1kHz.
% 
% 
% 

tone_freq = 1000;                       % Frequencia do tom que sera criado, em Hz
fs = 44100;                             % Frequencia de amostragem, em Hz
Ts = 1 / fs;                            % Periodo de amostragem, em seg
n = 1:fs;                               % Vetor de tempo discreto com valores entre 1 e fs, com o passo de 1
w = 2 * pi * tone_freq;                 % Frequencia angular do tom, em rad/seg
angulo = w * n * Ts;                    % Vetor com fs posi��es de �ngulo em radiano.
tone = sin(angulo);                     % Vetor com fs posi��es com os valores do seno do �ngulo.
audiowrite('test-tone.wav', tone, fs);  % Cria��o do arquivo WAV con o nome: test-tone.wav


