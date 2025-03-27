# HTML Slides as Code

Simple HTML presentations with version control. Each slide is a separate HTML file that can be previewed, combined, and exported to PDF.

## Usage

1. Create slides in `src/slides/` as `slide-XX.html`
2. Preview with Live Server in your IDE
3. Generate PDF:
```bash
./scripts/build.sh  # Combines slides
./scripts/pdf.sh    # Creates PDF
```

## Structure

```
src/
├── slides/     # HTML slides (slide-01.html, slide-02.html, ...)
└── assets/     # Styles (base.css) and images
```

## Features

- 🎨 Plain HTML and CSS
- 📱 16:9 slides (1280x720px)
- 💻 Edit in any IDE
- 🔍 Live preview
- 📄 PDF export
- 📦 No dependencies

## License

MIT