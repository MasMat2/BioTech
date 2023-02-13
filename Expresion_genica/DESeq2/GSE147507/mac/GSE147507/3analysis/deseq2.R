# setwd("~/Documents/Collage/BioTech/BioTech/Gene expression/DESeq2/GSE147507/3analysis")

# load libraries
library(DESeq2)
library(tidyverse)
library(airway)

counts_data <- read.csv('../2clean_data/GSE147507.csv')
counts_data <- counts_data[rowSums(counts_data) > 10, ]
counts_data <- counts_data[!rowSums(counts_data == 0) > 2, ]

# leemos los metadatos de cada muestra para saber cuales reiben tratamiento
colData <- read.csv('../2clean_data/colData.GSE147507.csv')

all(colnames(counts_data) %in% rownames(colData))
all(colnames(counts_data) == rownames(colData))

colData$group <- factor(colData$group)
dds <- DESeqDataSetFromMatrix(countData=round(counts_data), colData=colData, design = ~group)
#dds <- collapseReplicates(dds, dds$group)
dds$group <- relevel(dds$group, ref = "Control")

dds <- DESeq(dds)

res <- results(dds, alpha = 0.2)

res

summary(res)

res <- res[order(as.numeric(row.names(res))),]
res <- res[order(res$padj),]
res <- res[which(res$padj < 0.2), ]

write.csv(resFilt, file="DE_results_filtered.csv")

data <- read.csv("DE_results_filtered.csv")
data <- data %>%
  arrange(X)
write.csv(data, file="DE_results_filtered.csv")
