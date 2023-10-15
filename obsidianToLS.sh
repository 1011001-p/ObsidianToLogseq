#!/bin/bash

# Check for directory input
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

DIR="$1"
JOURNALS_DIR="${DIR}/journals"
PAGES_DIR="${DIR}/pages"

# Create the journals and pages directory if they don't exist
mkdir -p "${JOURNALS_DIR}" "${PAGES_DIR}"

# Find all markdown files, avoid specified top-level folders
find "${DIR}" -type f -name "*.md" -not -path "${DIR}/journals/*" -not -path "${DIR}/logseq/*" -not -path "${DIR}/whiteboards/*" -not -path "${DIR}/pages/*" | while read -r file; do
    # Extract the modification date and convert it to YYYY_MM_DD format
    DATE_MODIFIED=$(stat -c "%y" "${file}" | awk '{print $1}' | sed 's/-/_/g')

    # Extract the file name without the path and extension
    FILENAME=$(basename "${file}" .md)

    # Create or append to the journal file with the date
    echo "- [[${FILENAME}]]" >> "${JOURNALS_DIR}/${DATE_MODIFIED}.md"

    # Move the markdown file to the pages directory
    mv "${file}" "${PAGES_DIR}/"
done

echo "Done!"
