# Resume LaTeX Boilerplate

This folder is set up as its own Git repository so you can version your resume independently from other projects.

## Files

- `resume.tex`: your main LaTeX resume file
- `resume.pdf`: the shareable PDF artifact you can push and link directly
- `Makefile`: build, clean, and release helpers
- `CHANGELOG.md`: a simple place to note meaningful resume updates
- `releases/`: optional exported PDFs for named versions

## Workflow

1. Paste or replace your actual LaTeX content in `resume.tex`.
2. Build the PDF with:

```sh
make pdf
```

This updates the tracked top-level `resume.pdf` file.

3. Commit meaningful changes:

```sh
git add .
git commit -m "Update experience section"
```

4. When you want a named snapshot PDF:

```sh
make release VERSION=v0.1.0
git tag v0.1.0
```

## Output

- Local compiler output goes to `build/resume.pdf`
- Shareable tracked output goes to `resume.pdf`
- Versioned snapshot PDFs go to `releases/`

## Notes

- The `Makefile` uses `latexmk` when available and falls back to `pdflatex`.
- Generated build files are ignored by Git, but `resume.pdf` is meant to be committed when you want a shareable link.
- Replace the placeholder resume content whenever you're ready and we can refine the structure from there.
