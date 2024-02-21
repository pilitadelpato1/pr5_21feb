getwd()
nuevo_dir = ("C:/pr5_21feb")
setwd(nuevo_dir)

dir()
list.files()
if (file.exists(nuevo_dir)){
  cat("Directorio creado correctamente: ", nuevo_dir, "\n")
} else{
  cat("fallo al crear directorio: ", nuevo_dir, "\n")
}

#1
set.seed(123)

n_registros = 200
print(n_registros)

yacimiento = sample(c("Site1", "Site2", "Site3", "Site4", "Site5", "Site6", "Site7", "Site8", "Site9","Site10"))
tipo_artefacto = sample(c("Pottery", "Tools", "Jewerly", "Weapons"), n_registros, replace = T) 
n_artefactos = sample(1:1000, n_registros, replace = T)
contextos = sample(c("Habitacional", "Funerario", "Otros"), n_registros, replace=T)
latitud = sample(0:90, n_registros, replace = T)
longitud = sample(-180:180, n_registros, replace = T)

arqueo_data = data.frame(
  yacimiento = yacimiento,
  tipo_artefacto = tipo_artefacto,
  n_artefactos = n_artefactos,
  contextos = contextos,
  latitud = latitud,
  longitud = longitud
)

print(arqueo_data)
View(arqueo_data)


#2
media_nartefactos = mean(n_artefactos)
print(media_nartefactos)

cuartiles_nartefactos = quantile(n_artefactos)
print(cuartiles_nartefactos)

#3
hist_nartefactos = hist(n_artefactos, main = "Numero de artefactos", xlab = "Artefactos")

mediana_nartefactos = median(n_artefactos)
print(mediana_nartefactos)

#se trata de una gráfica positiva, debido a que la media es mayor que la mediana.

#4
graf_cajanartefactos = boxplot(n_artefactos, main = "Numero de artefactos")
#Nos 

#5


#6
mapa_de_calor = ggplot(arqueo_data, aes(x = longitud, y = latitud)) +
  geom_bin2d() + 
  labs(title = "Mapa de calor Densidad de Artefactos", x = "Longitud", y = "Latitud")
print(mapa_de_calor)

#7
total_artef_yac <- sum(arqueo_data$n_artefactos)
print(total_artef_yac)

#8
mediana_artefactos_yac = median(arqueo_data$n_artefactos)
print(mediana_artefactos_yac)

#9
desv_estandarnartefactos = sd(arqueo_data$n_artefactos)
print(desv_estandarnartefactos)

#10
yacimiento_max_artfactos = arqueo_data$yacimiento[which.max(arqueo_data$n_artefactos)]
print(yacimiento_max_artfactos)


#11
tabla_resumen = aggregate(n_artefactos=media_nartefactos, n_artefactos=mediana_nartefactos, n_artefactos=desv_estandarnartefactos)


