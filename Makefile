.PHONY: build data clean

# Where experience.yaml and accomplishments.yaml come from; any URL curl reads, file:// included.
WEBSITE_DATA ?= https://raw.githubusercontent.com/frederikb96/frederikberg/main/src/data
LATEXMK ?= latexmk -pdfxe

build: data
	$(LATEXMK) -interaction=nonstopmode -halt-on-error -output-directory=build cv.tex
	cp build/cv.pdf cv.pdf

data:
	mkdir -p build/data
	curl -fsSL -o build/data/experience.yaml $(WEBSITE_DATA)/experience.yaml
	curl -fsSL -o build/data/accomplishments.yaml $(WEBSITE_DATA)/accomplishments.yaml
	bun scripts/render-data.ts build/data .

clean:
	latexmk -C -output-directory=build cv.tex
