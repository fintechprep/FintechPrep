set arg=%1
"C:\Program Files\R\R-4.2.1\bin\Rscript" -e "Sys.setenv(RSTUDIO_PANDOC='C:/Program Files/RStudio/bin/quarto/bin/tools');rmarkdown::render('C:/FintechPrep/FintechPrepReporting/IndiaForeignReservesAnalysis.Rmd');" %arg%