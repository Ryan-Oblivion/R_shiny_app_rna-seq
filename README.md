# R_shiny_app_rna-seq
Making an R shiny app that analyzes RNA-seq data and produces visualizations


This version of the app will be able to take txt files generated from a downstream bulk RNA-seq pipeline. The txt files will be quantification of genes, from samples that were aligned to a reference genome and generated from the resulting bam files of said alignment.

The input files will also be of different conditions. The program takes a few liberities when determining which condition each file will be. If entering an even number of files, it will take the first half as one condition and the other half as another condition. If the files follow a similar naming convention they will be uploaded in the correct order to ensure no problems occur. Please have 3 control and 3 knockdown (condition) files since this is a differential gene expression analysis. 

I will provide an example of an input file.


