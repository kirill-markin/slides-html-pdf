#!/bin/bash

# Create dist directory if it doesn't exist
mkdir -p dist

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

# Combine all slides (extract just the slide div)
for slide in src/slides/slide-*.html; do
    # Extract the content between <div class="slide"...> and </div> (including styles)
    sed -n '/<div class="slide"/,/<\/div>/p' "$slide" >> dist/presentation.html
done

# Close the HTML
cat >> dist/presentation.html << EOL
</body>
</html>
EOL

echo "Presentation HTML file generated at dist/presentation.html" 