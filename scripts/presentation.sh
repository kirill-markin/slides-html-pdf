#!/bin/bash

# Create dist directory if it doesn't exist
mkdir -p dist

echo "Step 1: Building HTML presentation..."

# Start with a new presentation file
cat > dist/presentation.html << EOL
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Presentation</title>
    <link rel="stylesheet" href="../src/assets/styles/base.css">
</head>
<body>
EOL

# Combine all slides (since slides now contain just the div directly)
for slide in src/slides/slide-*.html; do
    # Simply include the entire content of each slide file
    cat "$slide" >> dist/presentation.html
done

# Close the HTML
cat >> dist/presentation.html << EOL
</body>
</html>
EOL

echo "HTML presentation generated at dist/presentation.html"

# Step 2: Convert to PDF
echo "Step 2: Converting to PDF..."

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
echo "All done! Check the 'dist' directory for your files." 