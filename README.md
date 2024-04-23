# R_shiny_app_rna-seq
Making an R shiny app that analyzes RNA-seq data and produces visualizations


This version of the app will be able to take txt files generated from a downstream bulk RNA-seq pipeline. The txt files will be quantification of genes, from samples that were aligned to a reference genome and generated from the resulting bam files of said alignment.

The input files will also be of different conditions. The program takes a few liberities when determining which condition each file will be. If entering an even number of files, it will take the first half as one condition and the other half as another condition. If the files follow a similar naming convention they will be uploaded in the correct order to ensure no problems occur. Please have 3 control and 3 knockdown (condition) files since this is a differential gene expression analysis. 

I will provide an example of an input file.


I will upload a renv.lock file that contains the dependencies used to run this app using r shiny.
I saved the project's libraries using renv::snapshot(), and I can load it back using renv::restore(lockfile = 'renv.lock') and choose option 2.

One other note is that I am using shinyuithemes from the github repository remotes and you can download it to rstudio with, remotes::install_github("rstudio/shinyuieditor").


## How to host the app on posit:

### Find this app using this url
 
 https://barrns-genome.shinyapps.io/my_first_r_app/

##### If you are not familiar with rstudio and want a quick understanding of how the app works, please try it out using the link above. This will take you to shinyapps.io which hosts rshiny apps users create. 
 
install.packages("rsconnect")
library(rsconnect)

### Set your Posit account
rsconnect::setAccountInfo(name="<account_name>", 
                          token="<account_token>", 
                          secret="<account_secret>")

### Deploy your app
rsconnect::deployApp(appDir = "<path_to_your_app>")
