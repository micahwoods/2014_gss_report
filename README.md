The files in this repository will generate the 2014 [Global Soil Survey](http://www.paceturf.org/journal/global_soil_survey) report, a joint project of [PACE Turf](http://www.paceturf.org/), the [Asian Turfgrass Center](http://www.asianturfgrass.com/), and the turfgrass managers from around the world who have contributed samples to this project. 

### If you just want a copy of the report

[Download](http://www.paceturf.org/PTRI/Documents/2014_gss_report.pdf) a `pdf` copy of the first year report.

### If you want to see, study, or analyze the GSS data 

The data are in the `/data` folder of this repository. 

Direct link: [GSS survey data September 20133 to August 2014](https://github.com/micahwoods/2014_gss_report/blob/master/data/20140910_gss.csv)

### If you are interested in the analyses we have done

Check out the code chunks in the `2014_gss_report.Rnw` file.

### If you would like to reproduce this report

#### Required files and software

Put these files in a directory. 

One must have `R` and `LaTeX` installed on your machine. The `R` packages `knitr`, `dplyr`, `VGAM`, and `xtable` must be installed also.

Note that this report uses the [tufte-handout class](https://code.google.com/p/tufte-latex/). The `tufte-common.def` and `tufte-handout.cls` files should be in the same directory with the `.Rnw` and `.tex` files.

#### Generating the report

In `R`:

`setwd("directory name")`   
`library(knitr)`   
`knit("2014_gss_report.Rnw")`   

That will create the `2014_gss_report.tex` file.

Then at the terminal command line:

`cd directory name`   
`pdflatex 2014_gss_report.tex`   

Run `pdflatex 2014_gss_report.tex` a second time to get all the cross-references numbered correctly.

That will produce the final report in PDF format. 