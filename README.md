# CMOS Sensor Simulation

Modelo físico en MATLAB para la simulación de ruido en sensores de imagen CMOS aplicados a telemetría óptica y sistemas espaciales.

El script `cmos_noise_model.m` procesa una señal ideal y le inyecta características físicas reales del hardware:
* Ruido de disparo de fotones (Distribución de Poisson).
* Corriente oscura dependiente del tiempo de exposición y la temperatura.
* Ruido de lectura del conversor analógico-digital (Gaussiano).

## Uso
Ejecuta `cmos_noise_model.m` en MATLAB para comparar una señal óptica ideal con su equivalente RAW tras aplicar el modelo de ruido integral.
