report.html: code/report.Rmd code/03_render_report.R figure1 table1
	Rscript code/03_render_report.R

figure1:
	Rscript code/02_make_figure1.R

table1:
	Rscript code/01_make_table1.R
	
.PHONY: clean
clean:
	rm -f tables/*.rds && rm -f figures/*.png && rm -f report/report.html

.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
#rule to build final report
final_report/build.html: 
	docker run -v "/$$(pwd)"/report:/project/report sswien/final

#to make the whole report run, enter $ make final_report/build.html
