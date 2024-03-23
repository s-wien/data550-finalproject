here::i_am("code/report.Rmd")

library(rmarkdown)
# rendering a report in production mode
render(input = here::here("code/report.Rmd"),
       output_file = here::here("report/report.html"))

print("render report complete!")