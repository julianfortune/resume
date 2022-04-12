BUILD_DIR = ./build
RESUME_LATEX = $(BUILD_DIR)/resume.tex

clean:
	@rm -rf $(BUILD_DIR)
	@rm \
	*.aux \
	*.lof \
	*.log \
	*.lot \
	*.fls \
	*.out \
	*.toc \
	*.fmt \
	*.fot \
	*.cb \
	*.cb2 \
	.*.lb \
	*.fdb_latexmk \
	*.synctex \
	*.synctex.gz \
	*.pdfsync \
	*.pdf \
	2> /dev/null || \
	\
	mkdir $(BUILD_DIR)

build:
	@mkdir $(BUILD_DIR)

latex: build
	pandoc --from=markdown --to=latex --template=template.tex --output=$(RESUME_LATEX) --standalone resume.md

pdf: latex
	latexmk $(RESUME_LATEX) -pdf -output-directory=$(BUILD_DIR)