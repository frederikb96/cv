.PHONY: build clean

build:
	latexmk -pdfxe -interaction=nonstopmode -halt-on-error -output-directory=build cv.tex
	cp build/cv.pdf cv.pdf

clean:
	latexmk -C -output-directory=build cv.tex
