#!/bin/bash

ARRAY=( "texlive-pdftex" "texlive-latex-bin" "texlive-texconfig*" "texlive-latex*"
        "texlive-metafont*" "texlive-cmap*"  "texlive-ec" "texlive-fncychap*"
        "texlive-pdftex-def" "texlive-fancyhdr*" "texlive-titlesec*"
        "texlive-multirow" "texlive-framed*" "texlive-wrapfig*" "texlive-parskip*"
        "texlive-caption" "texlive-ifluatex*"  "texlive-collection-fontsrecommended"
        "texlive-collection-latexrecommended" "texinfo-tex")

for i in "${!ARRAY[@]}"
do   
      echo " Installation de pré-requis n°$((i+1)): ${ARRAY[$i]}"
      apt install ${ARRAY[$i]}
done
                   
