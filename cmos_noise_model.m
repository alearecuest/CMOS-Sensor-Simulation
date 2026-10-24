% Simulación de ruido en sensores CMOS para telemetría óptica
clear; clc; close all;

% 1. Crear una señal ideal simulada (Cielo de fondo + 2 estrellas)
ideal_signal = 15 * ones(256, 256); % Fondo tenue
ideal_signal(100, 100) = 3000; % Estrella brillante
ideal_signal(150, 200) = 1500; % Estrella secundaria

% Parámetros físicos del sensor simulado
t_exp = 2.5; % Tiempo de exposición (segundos)
dark_current_rate = 25; % Corriente oscura en e-/s/pixel
read_noise_std = 12; % Ruido de lectura (RMS en electrones)

% 2. Ruido de Fotones (Distribución de Poisson sobre la señal ideal)
signal_photons = poissrnd(ideal_signal);

% 3. Corriente Oscura (Distribución de Poisson dependiente del tiempo)
dark_current = poissrnd(dark_current_rate * t_exp, size(ideal_signal));

% 4. Ruido de Lectura (Distribución Gaussiana)
read_noise = read_noise_std * randn(size(ideal_signal));

% 5. Imagen RAW final generada por el sensor
raw_image = signal_photons + dark_current + read_noise;

% Graficar comparación
figure('Name', 'Simulación de Sensor CMOS', 'Color', 'w');
subplot(1,2,1); 
imshow(ideal_signal, [0 100]); 
title('Señal Óptica Ideal');

subplot(1,2,2); 
imshow(raw_image, [0 100]); 
title('Imagen RAW (Ruido integrado)');