## GSE147507
Se usaron 3 réplicas biológicas independientes por serie.

Fold-change Series:
1. NHBE SARS_CoV-2 (primary human lung epithelium)
2. A549 SARS_CoV-2 (transformed lung alveolar)
5. A549 SARS_CoV-2 (transformed lung alveolar)
6. A549 ACE2 SARS_CoV-2 (transformed lung alveolar transduced with a vector expressing human ACE2)
7. Calu3 SARS-CoV-2 (transformed lung-derived Calu-3)
9. NHBE IFNB_4h (primary human lung epithelium treated with human interferon-beta)
9. NHBE IFNB_6h (primary human lung epithelium treated with human interferon-beta)
9. NHBE IFNB_12h (primary human lung epithelium treated with human interferon-beta)
12. COVID19Lung (primary human lung epithelium treated with human interferon-beta)
16. A549-ACE2 SARS-CoV-2 (transformed lung alveolar transduced with a vector expressing human ACE2)
16. A549-ACE2 SARS-CoV-2 Rux (Ruxolitinib pre-treatment)

## GSE149312_corona_intestine
Los archivos exp1 contienen 2 muestras biológicas (1, 6) de organoides infectados con SARS-COV (a), o SARS-COV 2 (b) analizadas: antes, 24h o 60h después de la infección. Así la muestra 6a60 es la muestra biológica "6" infectada con SARS-COV (a) por 60h.

1. 1b24 (small intestinal organoids)
2. 1b60
3. 6a24
4. 6a60
5. 6b24
6. 6b60

Los archivos exp2 contienen muestras biológicas de organoides infectadas con SARS-COV (a) o SARS-COV 2 (b) analizadas: antes o 72 horas después de la infección.

7. 7a72
8. 7b72

## GSE150316_RPMNormCounts_final
Transcriptome data on "GSE150316_RPMNormCounts_final.txt.gz"
General 20 samples different tissues
Genero 47 samples different tissues
- fold_change_genes_1_General 
- fold_change_genes_3_General
- fold_change_genes_1_Genero
- fold_change_genes_3_Genero

## GSE155974
Transcriptome data on "GSE155974_RAW.tar"\
2 samples
- fold_change_genes_1
- fold_change_genes_3

## GSE162562_series_matrix
Series of patitients age, gender and severity\
Trasncriptome data on "GSE162562_RAW.tar"\
108 raw samples 43 asymptomatic, 52 highliy exposed seronegative, 5 healthy controls, 4 with mild symtoms and 4 highly exposed seronegative foreign subjects.\
\
11 samples     (Mujeres,            Hombres\
    0_12,       Mujeres 0_12,       Hombres 0_12\
    13_19,      Mujeres 13_19,      Hombres 13_19\
    20_mas,     Mujeres 20_mas,     Hombres 20_mas)\
\
Possible error 'Seronegative, highly exposed' = 'Control' line 25 'Analisis_GSE162562.py'
- fold_change_genes_1
- fold_change_genes_3

## GSE175779
Transcriptome data on "GSE175779_Raw_counts_matrix.txt.gz"\
4 samples
- fold_change_genes_1
- fold_change_genes_3

## GSE179277_series_matrix 
Series of patitients age, gender and infection (SC2, other_virus, no_virus)\
Trasncriptome data on "GSE179277_all_adult_and_ped_samples_combined_counts_unfiltered.csv.gz"\
237 raw samples from 83 with SARS-CoV-2, 39 with other respiratory viruses, 115 with no virus\
\
11 samples SC2 (Mujeres,            Hombres\
    0_12,       Mujeres 0_12,       Hombres 0_12\
    13_19,      Mujeres 13_19,      Hombres 13_19\
    20_mas,     Mujeres 20_mas,     Hombres 20_mas)
- fold_change_genes_1_SC2
- fold_change_genes_1_other_virus
- fold_change_genes_3_SC2
- fold_change_genes_3_other_virus

## GSE184390
Trasncriptome data on "GSE184390_RAW.tar"\
2 samples
- fold_change_genes_1
- fold_change_genes_3

## GSE185557
Transcriptome data on "GSE185557_count_matrix.csv.gz"\
2 samples
- fold_change_genes_1
- fold_change_genes_3


muestra{
    id
    edad
    genero
    control
    comorbuilidad
    tejido
    tratamiento
}



categorias
edad
genero
comorbilidad
tejido


construir heatmap del fold change

revisar que pertenezcan a la misma distriucion los genes expresados diferencialmente

determinar redes de senalizacion en
https://reactome.org/
https://www.kegg.jp/


comparar con expresion normal en 
https://gtexportal.org/home/


inmmune
metabolico
nervioso sentral

raa
renina angiotensia aldosterona
regulado por
hipotalamo hipofisis 
endocrino
funcionamiento correcto buna presion alterial, metabolizacion glucosa lipidos
