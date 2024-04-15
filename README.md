# File Structure

This repository contains the following file structure: 

-`code/`

-`data/`

-`figures/`

-`renv/`

-`report/`

-`tables/`

-`Makefile`
- this file will restore the package environment (`install`), compile the report (`make`), and remove output (`make clean`)

-`README` (you are reading this now)

-`renv.lock` and associated files (e.g., `R.profile`) 

# Code Description

The files below perform the following: 

`code/01_make_table1.R`
- read clean data from `data/` folder (original datra source is too large, 
- save table1 in `tables/` folder

`code/02_make_figure1.R`
- read clean data from `data/` folder
- save figure 1 in `figures/` folder

`code/03_render_report.R`
- render `code/report.Rmd` 
- save compiled report (.html) in `reports/` folder

`code/report.Rmd`
- read data, tables, and figures from respective locations
- display results for production report
