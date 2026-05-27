InsurTech Telematics: Motor de Tarificación Dinámica y Prevención de Riesgo
Bienvenido a mi repositorio. Soy Rodrigo Quiroga, estudiante de Ingeniería de Sistemas en la Universidad de Lima, y este es un proyecto nacido de mi pasión por el análisis de datos, la arquitectura de sistemas y la innovación en el sector financiero y asegurador.

Este proyecto es una prueba de concepto (PoC) de extremo a extremo que simula el entorno de Advanced Analytics de una aseguradora líder. Mi objetivo aquí es demostrar cómo la convergencia entre Big Data, Machine Learning e Inteligencia de Negocios puede transformar el modelo tradicional de seguros vehiculares (basado en tarifas planas) hacia un modelo de Usage-Based Insurance (UBI), donde las primas se ajustan dinámicamente según el comportamiento real del conductor.

🎯 El Problema de Negocio
Actualmente, muchas aseguradoras calculan el riesgo basándose en variables estáticas (edad, modelo del auto, historial). Esto genera asimetrías: conductores prudentes subsidian a conductores temerarios. Además, la falta de detección temprana de patrones de conducción peligrosos incrementa la tasa de siniestralidad y los costos operativos de la empresa.

💡 La Solución Propuesta
Desarrollé un motor analítico que ingesta datos de telemetría inercial (sensores de teléfonos móviles desarrollados para recolectar datos del vehículo) para perfilar el riesgo de una cartera de asegurados en tiempo real.

Fases del Proyecto:
1. Ingesta Masiva (Big Data): Procesamiento de un dataset de sensores a gran escala.

2. Feature Engineering: Aplicación de física vectorial para calcular la magnitud de aceleración lineal y la velocidad angular.

3. Machine Learning: Entrenamiento de un algoritmo para clasificar patrones de manejo.

4. Data Storytelling y Business Intelligence: Creación de un panel gerencial para la toma de decisiones comerciales.

🛠️ Arquitectura y Metodología Técnica
1. Manejo de Big Data en R
El dataset original crudo (proveniente de Kaggle) consta de 7 millones de registros de mediciones inerciales por segundo.

Nota Técnica: Debido a que el archivo original pesa aproximadamente 1 GB, superando el límite de 100 MB de GitHub, no se encuentra subido en este repositorio. Sin embargo, el script de R adjunto contiene la lógica exacta de ingesta. Igualmente, adjunto el link del dataset por si se requiere utilizarlo: https://www.kaggle.com/datasets/shakilofficial0/large-scale-driver-behavior-sensor-dataset/data

Utilicé la librería de alto rendimiento data.table en R para cargar, limpiar y estructurar esta información directamente en la memoria RAM, optimizando drásticamente los tiempos de procesamiento.

2. Feature Engineering y Física de Sensores
Transformé las coordenadas X, Y, Z crudas del acelerómetro y giroscopio en variables de energía física total utilizando la norma euclidiana. Posteriormente, simulé una cartera corporativa asignando estas 7 millones de mediciones de forma aleatoria y estadísticamente consistente a 1,500 IDs de clientes.

3. Descubrimiento de IA (El "Insight" de Innovación)
Entrené un modelo de Árboles de Decisión (rpart) para predecir cuándo un conductor estaba realizando maniobras agresivas. El hallazgo de negocio más importante fue que el modelo descartó la aceleración lineal y basó sus reglas matemáticas (con un +99% de precisión) exclusivamente en la velocidad angular (Giroscopio), lo cual personalmente me dejó sorprendido y pensativo por un buen rato, logré un insight único.

Conclusión para el negocio: El riesgo inminente de siniestro no radica en pisar el acelerador a fondo en línea recta, sino en la frecuencia y violencia de los volantazos y cambios de carril bruscos.

4. Inteligencia de Negocios en Power BI
Para cerrar la brecha entre el código y la estrategia comercial, exporté la cartera perfilada y diseñé un Dashboard Ejecutivo corporativo para su entendimiento.

Implementé métricas avanzadas en lenguaje DAX para aislar dinámicamente a los conductores cuyo porcentaje de maniobras peligrosas superaba el umbral de riesgo (25.5%).

Diseñé una Matriz de Correlación de Riesgo (Gráfico de dispersión) que cruza la intensidad de la fuerza G frente a la frecuencia de agresividad, permitiendo identificar visualmente a los clientes críticos para aplicar un aumento de prima preventivo.

📊 Visualización del Proyecto

<img width="934" height="519" alt="image" src="https://github.com/user-attachments/assets/7632889b-7a2b-42fa-93af-9873ccdc722b" />
Dashboard_Telematics_Risk_Analytics.jpg

🚀 Tecnologías Utilizadas

Lenguajes: R (Procesamiento analítico y ML), DAX (Lógica de negocio y KPIs).

Librerías: data.table, dplyr, rpart.

Herramientas: RStudio, Power BI Desktop, Excel (validación), Gemini.

Conceptos: Big Data Ingestion, Vector Physics, Business Intelligence, InsurTech.

📬 Contacto

Si formas parte de un equipo de Innovación, Data Analytics o Tecnología y buscas perfiles con espíritu ganador que lideren innovando, me encantaría conversar sobre este proyecto y cómo escalar estas soluciones.

LinkedIn: www.linkedin.com/in/rodrigo-quiroga-6772ba2a4

Email: rquiroga353@gmail.com
