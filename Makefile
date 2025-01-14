# Directory di build
BUILD_DIR = build

# Lista dei paper (aggiungi i percorsi qui)
PAPERS = \
    papers/observer/2025/observer-2025.tex

# Regola principale
all: $(PAPERS:%.tex=$(BUILD_DIR)/%.pdf)

# Regola per compilare un PDF
$(BUILD_DIR)/%.pdf: %.tex
	mkdir -p $(BUILD_DIR)/$(dir $<)
	pdflatex -output-directory=$(BUILD_DIR)/$(dir $<) $<
	#bibtex $(BUILD_DIR)/$(basename $(dir $<)/$(notdir $<))
	#pdflatex -output-directory=$(BUILD_DIR)/$(dir $<) $<
	#pdflatex -output-directory=$(BUILD_DIR)/$(dir $<) $<

# Pulizia
clean:
	rm -rf $(BUILD_DIR)

push:
	@git add .
	@git commit -m "update" || true
	@git push