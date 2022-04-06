% Este script gera uma senóide de amplitude unitária, frequência de 1kHz.
% 
% 
% 

tone_freq = 1000;                       % Frequencia do tom que sera criado, em Hz
fs = 44100;                             % Frequencia de amostragem, em Hz
Ts = 1 / fs;                            % Periodo de amostragem, em seg
n = 1:fs;                               % Vetor de tempo discreto com valores entre 1 e fs, com o passo de 1
w = 2 * pi * tone_freq;                 % Frequencia angular do tom, em rad/seg
angulo = w * n * Ts;                    % Vetor com fs posições de ângulo em radiano.
tone = sin(angulo);                     % Vetor com fs posições com os valores do seno do ângulo.
audiowrite('test-tone.wav', tone, fs);  % Criação do arquivo WAV con o nome: test-tone.wav


