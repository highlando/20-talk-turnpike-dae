MDFILE=abstract.md

OUTPDF=${FLNM}.pdf
pandoc -o ${OUTPDF}

OUTDCX=${FLNM}.docx
pandoc -o ${OUTDCX}
