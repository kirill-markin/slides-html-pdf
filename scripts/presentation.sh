#!/bin/bash

# Create dist directory if it doesn't exist (just in case)
mkdir -p dist

echo "Converting HTML presentations to PDF..."

# Process all HTML files in src directory
for html_file in src/*.html; do
    # Extract the base filename without path and extension
    filename=$(basename "$html_file" .html)
    echo "Processing $filename.html..."
    
    # Convert to PDF using Chrome in headless mode
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS path
        "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
            --headless \
            --disable-gpu \
            --print-to-pdf="$(pwd)/dist/$filename.pdf" \
            "file://$(pwd)/$html_file"
    else
        # Linux path (adjust if needed)
        google-chrome \
            --headless \
            --disable-gpu \
            --print-to-pdf="$(pwd)/dist/$filename.pdf" \
            "file://$(pwd)/$html_file"
    fi
    
    echo "PDF generated at dist/$filename.pdf"
done

echo "All done! Check the 'dist' directory for your PDF files." 