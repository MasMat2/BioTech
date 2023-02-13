#setwd("~/Downloads/GSE185557")

counts_data <- read.csv('../../../0sources/GSE185557/GSE185557.CB.csv', row.names="X")
counts_data %>% filter(rowSums(across(everything(), ~.x==0))<=2)

# leemos los metadatos de cada muestra para saber cuales reiben tratamiento
colData <- read.csv('../../../0sources/GSE185557/colData.GSE185557.CB.csv', row.names="X")

all(colnames(counts_data) %in% rownames(colData))
all(colnames(counts_data) == rownames(colData))

colData$group <- factor(colData$group)
dds <- DESeqDataSetFromMatrix(countData=round(counts_data), colData=colData, design = ~group)

dds$group <- relevel(dds$group, ref = "Control")

dds <- DESeq(dds)

res <- results(dds, lfcThreshold = 1.25, alpha = 0.1)

res

summary(res)