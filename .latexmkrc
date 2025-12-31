$pdf_mode = 5;  # Use XeLaTeX
$postscript_mode = 0;
$dvi_mode = 0;

# Change to XeLaTeX as the PDF mode
$pdflatex = 'xelatex -interaction=nonstopmode -file-line-error %O %S';
