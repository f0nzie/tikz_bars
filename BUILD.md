# BUILD



1. Create R project
2. Install R package `blogdown`
3. Install Hugo
4. Place the tikz files under the folder `src`
5. Test that the tikz files build. (i) from the [command line][#commandline]; or from (ii) TexStudio
6. Use a Makefile to automate the build of the tex files
7. Create the folder `out`
8. Copy the file README.Rmd, `template.Rmd`, and `style.css`
9. Change the variables for the website url, title, and other in README. Rmd
10. Compile with `make`. At least, the README file should open automatically
11. Copy the file `_build_site.R` and the folder `site`. 
12. With this file you should be able to generate a local website.







## Makefile

1. Get OS information
2. Get list of tex files to compile









### Command line

```bash
# example
pdflatex --interaction=batchmode -halt-on-error barchart.tex
```





[#commandline]: