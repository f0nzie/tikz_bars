# BUILD



1. Create R project
2. Install R package `blogdown`
3. Install Hugo
4. Place the tikz files under the folder `src`
5. Test that the tikz files build. (i) from the [command line][#commandline]; or from (ii) TexStudio
6. Use a Makefile to automate the build of the tex files
7. 







### Command line

```bash
# example
pdflatex --interaction=batchmode -halt-on-error barchart.tex
```





[#commandline]: