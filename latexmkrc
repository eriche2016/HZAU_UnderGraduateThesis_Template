# latexmk rc file: force XeLaTeX on Overleaf
$pdflatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$pdf_mode = 1;
$max_repeat = 5;
