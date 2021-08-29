## Primer problema

#install.packages("readxl")
#install.packages("fs")
#install.packages("dplyr")
#install.packages('writexl')
#install.packages("raster")
#install.packages("stringr")
#install.packages("NLP")
library("readxl")
library("fs")
library("dplyr")
library("writexl")
library("raster")
library("stringr") 
library("NLP")

files <- list.files(
        path=paste(getwd(),"/data", sep = ""),
        pattern="*.xlsx",
        full.names=TRUE)


new_data = readxl::read_excel(files[1])
new_data = new_data[c("COD_VIAJE", "CLIENTE", "UBICACION", "CANTIDAD", "PILOTO", "Q", "CREDITO", "UNIDAD", "Fecha")] 
#agregamos columna de fechas
fecha_v<-rep(gsub(".xlsx", "", path_file(files[1])),
       times=dim(new_data)[1])
new_data[,"Fecha"] = fecha_v

for (x in 2:(length(files)-1)) {
  temporal_data = readxl::read_excel(files[x])
  #agregamos columna de fechas
  fecha_v<-rep(gsub(".xlsx", "", path_file(files[1])),
               times=dim(temporal_data)[1])
  temporal_data[,"Fecha"] = fecha_v
  temporal_data = temporal_data[c("COD_VIAJE", "CLIENTE", "UBICACION", "CANTIDAD", "PILOTO", "Q", "CREDITO", "UNIDAD", "Fecha")] 
  new_data = bind_rows(new_data, temporal_data)
}

writexl::write_xlsx(new_data, "result.xlsx")

##Segundo problema
vec1 <- sample(1:20, 100, replace=TRUE)
vec2 <- sample(1:20, 100, replace=TRUE)
vec3 <- sample(1:20, 100, replace=TRUE)
vec4 <- sample(1:20, 100, replace=TRUE)
list_vectors = list(vec1, vec2, vec3, vec4)

lapply(list_vectors, modal)

list_vectors

##Tercer problema



# Read string data and split into data frame
files <- list.files(
  path=paste(getwd(),"/data", sep = ""),
  pattern="*.txt",
  full.names=TRUE)

data = read.delim(file = files[1], header = TRUE, sep = "|")
data2 = read.delim2(file = files[1], header = TRUE, sep = "|")


install.packages("leaflet")
install.packages("crosstalk")
install.packages("DT")
