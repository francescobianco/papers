BUILD_DIR = build
PAPERS = \
    papers/observer/2025/observer-2025.tex

all: $(PAPERS:%.tex=$(BUILD_DIR)/%.pdf)

$(BUILD_DIR)/%.pdf: %.tex
	@mkdir -p $(BUILD_DIR)/$(dir $<)
	@pdflatex -output-directory=$(BUILD_DIR)/$(dir $<) $<
	@#bibtex $(BUILD_DIR)/$(basename $(dir $<)/$(notdir $<))
	@#pdflatex -output-directory=$(BUILD_DIR)/$(dir $<) $<
	@#pdflatex -output-directory=$(BUILD_DIR)/$(dir $<) $<

clean:
	rm -rf $(BUILD_DIR)

push:
	@git config credential.helper 'cache --timeout=3600'
	@git add .
	@git commit -m "update" || true
	@git push
