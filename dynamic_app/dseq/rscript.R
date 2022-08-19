#! /usr/bin/Rscript
library(DESeq2)
library(tidyverse)
setwd("/mnt/e/Collage/BioTech/Analisis_Genes/dynamic_app/dseq")
## Paso 1: preaparar datos con el recuento de los genes -------------
# Leemos los datos con el recuento de genes
counts_data <- read.csv('counts_data.csv', row.names = 1)

# leemos los metadatos de cada muestra para saber cuales reiben tratamiento
colData <- read.csv('sample_md.csv', row.names = 1)

# Nos aseguramos que los nombres de las filas en colData, empaten con los nombres de columnas en counts_data
# Esto para evitar problemas la libreria DESeq2
all(colnames(counts_data) %in% rownames(colData))
# Ahora revisamos que tengan el mismo orden
all(colnames(counts_data) == rownames(colData))


## Paso 2: contruimos el objeto DESeqDataSet -------------
# design especifica el factor de diseno del experimento
dds <- DESeqDataSetFromMatrix(countData=counts_data, colData=colData, design = ~condition)

# Prefiltro opcional: remover filas con un recuento bajo del gen
# Manteniendo solo las que tienen almenos 10 en total, disminuye el tamano del objeto
# y aumenta la velocidad de procesamiento
keep <- rowSums(counts(dds)) >= 10

# Usamos estos valores logicos para reducir nuestro DESeqDataSet object
dds <- dds[keep,]

# Establecemos nuetro nivel factor de referencia
dds$condition <- relevel(dds$condition, ref = "untreated")

# NOTE: colapsar replicas tecnicas antes de correr la funcion DESeq
# y realizar en analisis diferencial de expresion

## Paso 3: Corremos la funcion DESeq en el objeto DESeqDataSet -------------
dds <- DESeq(dds)

# Guardamos los resultados generados del analisis de expresion diferencial
res <- results(dds)
# baseMean = promedio del recuento normalizado entre todas las muestras
# log2Fold = log2FoldChange de la condicion sin tratamiento comparada con la condicion trata
# lfcSe = estimacion del error estandar (desviacion estandar) del log2FoldChange
# stat = resultado de la prueba Wald para cada gen
# pvalue = es el valor de la prueba estadistica para cada gen
# padj = el pvalue corregido para multiples pruebas
# necesitmos coregir el pvalue porque cuando realizamos una prueba estadistica usamos un valor de 0.05
# asi que el 5% de nuestros genes expresados diferencialmente no estan expresados difrenecialmente en realidad
# estos genes pasan la prueba estadistica pero el tratamiento no tiene efecto en ellos realmente
# el 5% de los 22369 genes expresados diferencialmente se consideran falsos positivos
# DESeq2 adjusta el valor p para evitar la deteccion de falsos positivos

## Explorar resultados -------------
# summary(res)

# podemos cambiar el umbral del valor ajustado p
res0.01 <- results(dds, alpha=0.01)
# summary(res0.01)

# podemos ver las comparasiones hechas con las siguiente funcion
# resultsNames(dds)

# podemos comparar entre diferentes factores
# e.g.: treated_4hrs, treated_8hrs, untreated
#results(dds, contrast=c("dexamethasone", "treated_4hrs", "untreated"))

# MA plot
png(file="saving_plot1.png")
plotMA(res)
dev.off()