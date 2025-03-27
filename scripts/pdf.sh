#!/bin/bash

# Check if presentation.html exists
if [ ! -f dist/presentation.html ]; then
    echo "Error: dist/presentation.html not found. Run build.sh first."
    exit 1
fi

# Convert to PDF using Chrome in headless mode
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS path
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
        --headless \
        --disable-gpu \
        --print-to-pdf="$(pwd)/dist/presentation.pdf" \
        "file://$(pwd)/dist/presentation.html"
else
    # Linux path (adjust if needed)
    google-chrome \
        --headless \
        --disable-gpu \
        --print-to-pdf="$(pwd)/dist/presentation.pdf" \
        "file://$(pwd)/dist/presentation.html"
fi

echo "PDF generated at dist/presentation.pdf" 