MDFILE=slides.md

pandoc $MDFILE -o slides.html \
    --filter pandoc-citeproc -t revealjs --slide-level=2 -s \
    --mathjax='node_modules/mathjax/es5/tex-mml-chtml.js' \
    -V revealjs-url=node_modules/reveal.js \
    -V theme=solarized \
    -V viewDistance=15 -V width=1280 -V height=880 -V margin=0.05
    # -V revealjs-url=https://revealjs.com \
    # --mathjax='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' \

sed -i '/Reveal.initialize.*/a hash: true,' slides.html  # add some reveal configs
# ## base theme slides -- works well
# pandoc $MDFILE --filter pandoc-citeproc -t beamer -o base-theme-slides.pdf -H def.tex
# -H <(echo '\('; cat macros.tex; echo '\)') \
# -H <(echo '\['; cat def.tex; echo '\]') \
