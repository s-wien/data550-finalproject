# Building a Docker Image

- In your own working directory, navigate to your desired root directory for this project in Git Bash

- Once you are in the correct working directory, in Git Bash write `docker pull sswien/final` to download the Docker image; alternatively you can copy the same code from the DockerHub link here: https://hub.docker.com/r/sswien/final

- To run the target in the `Makefile`

  - Navigate to the desired directory you would like to set at the project directory (in Git Bash or RStudio)

  - To create the report enter `$ make final_report/build.html` in your Git Bash terminal (depending on your computer you may not need to use `winpty`)
  
- To confirm that the report was generated, in Git Bash type `cd report`, and then `ls`: you should be able to see the `report.html` file

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

-`Dockerfile`

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
