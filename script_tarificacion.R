install.packages("rpart.plot")
instal.packages("rpart")
install.packages("data.table")

library(data.table)
library(rpart)
library(rpart.plot)

datos_telemetria <- fread("C:/Users/rquir/Downloads/dataset_7M.csv", stringsAsFactors = FALSE)
str(datos_telemetria)

datos_telemetria[, Magnitud_Acc := sqrt(AccX^2 + AccY^2 + AccZ^2)]
datos_telemetria[, Magnitud_Gyro := sqrt(GyroX^2 + GyroY^2 + GyroZ^2)]

datos_telemetria[, Class := as.factor(Class)]
set.seed(2026)
numero_clientes <- 1500
datos_telemetria[, ID_Cliente := sample(1:numero_clientes, .N, replace = TRUE)]

perfil_riesgo <- datos_telemetria[, .(
  Total_Mediciones = .N,
  Mediciones_Agresivas = sum(Class == "AGGRESSIVE", na.rm = TRUE),
  Promedio_Aceleracion = mean(Magnitud_Acc, na.rm = TRUE)
), by = ID_Cliente]

perfil_riesgo[, Porcentaje_Agresivo := (Mediciones_Agresivas / Total_Mediciones) * 100]

perfil_riesgo[, Categoria_Riesgo := fifelse(Porcentaje_Agresivo > 15, "Riesgo Alto - Aumento de Prima", "Riesgo Normal - Mantener")]

head(perfil_riesgo[order(-Porcentaje_Agresivo)])

modelo_conduccion <- rpart(Class ~ Magnitud_Acc + Magnitud_Gyro,
                           data = datos_telemetria,
                           method = "class",
                           control = rpart.control(cp = 0.01))

print(modelo_conduccion)
rpart.plot(modelo_conduccion, main = "Algoritmo de Detección de Riesgo Vehicular")
fwrite(perfil_riesgo, "Modelo_Tarificacion_Pacifico.csv", sep = ",", row.names = FALSE)
getwd()