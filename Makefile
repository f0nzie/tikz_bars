
SOURCE_DIR  = src
TIKZ_LIBS = $(wildcard $(SOURCE_DIR)/*.code.tex)
TEX_FILES_ALL_ = $(wildcard $(SOURCE_DIR)/*.tex)
TIKZ_FILES_ALL  = $(filter-out $(TIKZ_LIBS), $(TEX_FILES_ALL_))
TIKZ_LUALATEX = $(filter %.lualatex.tex, $(TIKZ_FILES_ALL))
TIKZ_LATEX = $(filter-out  $(TIKZ_LUALATEX), $(TIKZ_FILES_ALL))
PDF_LATEX = $(addprefix out/, $(addsuffix .pdf, $(basename  $(notdir $(TIKZ_LATEX) ))))



# Detect operating system. Sort of tricky for Windows because of MSYS, cygwin, MGWIN
OSFLAG :=
ifeq ($(OS), Windows_NT)
	OSFLAG = WINDOWS
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S), Linux)
		OSFLAG = LINUX
	endif
	ifeq ($(UNAME_S), Darwin)
		OSFLAG = OSX
	endif
endif






























.PHONY: info
info:
	@echo $(words $(TIKZ_LIBS))
	@echo $(words $(TEX_FILES_ALL_))
	@echo $(words $(TIKZ_FILES_ALL))
	@echo $(words $(TIKZ_LATEX))
	@echo $(words $(TIKZ_LATEX))
	@echo $(words $(TIKZ_LUALATEX))
	@echo $(TIKZ_LIBS)
	@echo $(words $(PDF_LATEX))




.PHONY: getos
getos:
	@# Testing different ways of detecting the OS
	@echo "OS is:" $(OSFLAG)
	@# these two are equivalent
	@echo "Number of words in OS env var:" $(words $(OS))
	@echo count words in findstring $(words $(findstring $(OS),))
	@if [  $(words $(OS)) -gt 0 ]; then echo "OS env word count it is greater than zero, means it is WINDOWS"; fi
	@# Using if
	@if [ "$(findstring $(OS), Windows_NT)" != "" ]; then echo "OS returns Windows_NT, not an empty string"; fi
	@# using test
	@if test $(findstring $(OS), Windows_NT) ; then echo "WINDOWS passed the test"; fi;
	@if test $(findstring $(OSFLAG), WINDOWS); then echo "findstring of OSFLAG found WINDOWS"; fi
	@if test $(OSFLAG) = WINDOWS; then echo "OSFLAG is WINDOWS"; fi
	@if test $(findstring $(OSFLAG), OSX); then echo "it is a Mac"; fi
	$(eval NUMWORDS = $(words $(findstring $(OS), Windows_NT)))
	@echo NUMWORDS $(NUMWORDS)
ifeq ($(strip $(findstring $(OS), Windows_NT) ),)
	@echo "findstring found OS empty. No WINDOWS here"
else
	@echo "findstring found OS filled, so it is WINDOWS"
endif


