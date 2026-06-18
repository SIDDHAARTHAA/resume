MAIN_TEX := resume.tex
BUILD_DIR := build
BUILD_PDF := $(BUILD_DIR)/resume.pdf
OUTPUT_PDF := resume.pdf

.PHONY: pdf clean release

pdf:
	mkdir -p $(BUILD_DIR)
	@if command -v latexmk >/dev/null 2>&1; then \
		latexmk -pdf -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR) $(MAIN_TEX); \
	elif command -v pdflatex >/dev/null 2>&1; then \
		pdflatex -interaction=nonstopmode -halt-on-error -output-directory=$(BUILD_DIR) $(MAIN_TEX); \
	else \
		echo "No LaTeX compiler found. Install latexmk or pdflatex, then run 'make pdf' again."; \
		exit 1; \
	fi
	cp $(BUILD_PDF) $(OUTPUT_PDF)

clean:
	@if command -v latexmk >/dev/null 2>&1; then \
		latexmk -C -output-directory=$(BUILD_DIR); \
	fi
	rm -rf $(BUILD_DIR)

release: pdf
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make release VERSION=v0.1.0"; \
		exit 1; \
	fi
	mkdir -p releases
	cp $(OUTPUT_PDF) releases/resume-$(VERSION).pdf
	@echo "Created releases/resume-$(VERSION).pdf"
