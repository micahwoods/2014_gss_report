The files in this repository will generate the 2014 Global Soil Survey report.

### Required files and software

Put these files in a directory. 

One must have `R` and `LaTeX` installed. The `R` packages `knitr`, `dplyr`, `VGAM`, and `xtable` must be installed also.

Note that this report uses the tufte-handout class, which is available here: https://code.google.com/p/tufte-latex/. The `tufte-common.def` and `tufte-handout.cls` files should be in the same directory with the `.Rnw` and `.tex` files.

### Generating the report

In `R`:

`setwd("directory name")
library(knitr)
knit("2014_gss_report.Rnw")`

That will create the `2014_gss_report.tex` file.

Then using the terminal command line:

`cd directory name
pdflatex 2014_gss_report.tex`

Run `pdflatex` on `2014_gss_report.tex` a second time to get all the cross-references numbered correctly.

That will produce the final report in PDF format.