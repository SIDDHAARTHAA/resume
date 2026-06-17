# Resume LaTeX Boilerplate

This folder is set up as its own Git repository so you can version your resume independently from other projects.

## Files

- `resume.tex`: your main LaTeX resume file
- `Makefile`: build, clean, and release helpers
- `CHANGELOG.md`: a simple place to note meaningful resume updates
- `releases/`: optional exported PDFs for named versions

## Workflow

1. Paste or replace your actual LaTeX content in `resume.tex`.
2. Build the PDF with:

```sh
make pdf
```

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

- Local build output goes to `build/resume.pdf`
- Versioned snapshot PDFs go to `releases/`

## Notes

- The `Makefile` uses `latexmk` when available and falls back to `pdflatex`.
- Generated build files are ignored by Git.
- Replace the placeholder resume content whenever you're ready and we can refine the structure from there.
