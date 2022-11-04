#instalacion de librerias
#if (!require("BiocManager", quietly = TRUE))
#install.packages("BiocManager")



#BiocManager::install("RnaSeqGeneEdgeRQL")
#BiocManager::install("org.Hs.eg.db")
#install.packages("ggplot2")
install.packages("GOplot")
#install.packages("statmod")



#BiocManager::install("clusterProfiler")
#BiocManager::install("pathview")



#install.packages("ggnewscale")
#install.packages("ggupset")
#install.packages("ggridges")
#install.packages("europepmc")
#install.packages ("ggupset")



#llamar las librerias necesarias
library(ggplot2)
library(GOplot)
library(statmod)
library(RnaSeqGeneEdgeRQL)
library(org.Hs.eg.db)
library(clusterProfiler)
library(pathview)
library(ggnewscale)
library(ggupset)
library(ggridges)
library(europepmc)



#obtener targets
#establecer el diseño experimental
targetsFile <- system.file("extdata", "targetsCOVID.txt",
                           package="RnaSeqGeneEdgeRQL")



targets <- read.delim(targetsFile, stringsAsFactors=FALSE)



targets
rownames(targets) <- targets$NAME
View(targets)



targetsFile



#obtener tabla de conteo
group <- paste(targets$CellType, targets$Status, sep=".")
group <- factor(group)
table(group)



GenewiseCounts<- read.csv("GSE185557_count_matrix.csv")
colnames (GenewiseCounts)[1]<- "EntrezGeneID"
rownames (GenewiseCounts) <- GenewiseCounts$EntrezGeneID
GenewiseCounts<- GenewiseCounts[,-1]
dim(GenewiseCounts)



head (GenewiseCounts[,1,drop=FALSE])
View(GenewiseCounts)



names <-rownames(GenewiseCounts)



View(names)




library(edgeR)
y <- DGEList(GenewiseCounts, group=group,
             genes=GenewiseCounts[,1,drop=FALSE])




options(digits=1)
y$samples
counts
dim(counts)
counts <- GenewiseCounts



group
View(group)



library(org.Hs.eg.db)
y$genes$Symbol <- mapIds(org.Hs.eg.db, rownames(y),                          
                         keytype="ENSEMBL", column="SYMBOL")