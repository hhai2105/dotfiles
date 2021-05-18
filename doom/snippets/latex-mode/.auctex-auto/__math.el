(TeX-add-style-hook
 "__math"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("amsart" "letter")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("babel" "english") ("inputenc" "utf8") ("xcolor" "table" "xcdraw") ("geometry" "margin=1in") ("scrextend" "fontsize=12pt")))
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "amsart"
    "amsart10"
    "titlesec"
    "textcomp"
    "babel"
    "inputenc"
    "enumerate"
    "amsmath"
    "amsfonts"
    "amssymb"
    "graphicx"
    "xcolor"
    "tikz"
    "geometry"
    "enumitem"
    "mathrsfs"
    "caption"
    "hyperref"
    "subcaption"
    "float"
    "scrextend"
    "mathtools")
   (TeX-add-symbols
    '("tab" ["argument"] 0)
    '("ffrac" 2)
    "rr"
    "nn"
    "qq"
    "dd"
    "intt"
    "bd"
    "nbd"
    "cl"
    "me"
    "mypound"
    "HomeworkNumber"
    "StudentName"
    "StudentIDNumber"
    "doubleunderline")
   (LaTeX-add-xcolor-definecolors
    "UMassMaroon"))
 :latex)

