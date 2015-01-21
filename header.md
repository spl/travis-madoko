Heading Base  : 2 
Math Mode     : dynamic
MathJax       : https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML

~RemoExample: .block
  label='[@RemoExample]{.RemoExample-label}'
  before='[**&label;.\ példa**.\ ]{.RemoExample-before}'
  border-style=solid
  border-color=black
  border-width=1px
  padding=10px
  
~RemoExercise: .block
  label='[@RemoExercise]{.RemoExercise-label}'
  before='[**&label;.\ feladat**.\ ]{.RemoExercise-before}'
  border-style=solid
  border-color=black
  border-width=1px
  padding=10px
  
~RemoRemark: .block
  label='[@RemoRemark]{.RemoRemark-label}'
  before='[**Megjegyzés**.\ ]{.RemoRemark-before}'

~RemoFigure:
  label='[@RemoFigure]{.RemoFigure-label}' .align-center
  after='&nl;********* {.figureline}&nl;\
    [[**&label;.\ ábra.** ]{.caption-before}&caption;]\
    {.figure-caption html-elem=fig-caption}\
    &nl;{notag}&nl;'
  toc=tof toc-line='&label;. &caption;'
  html-elem=figure
  html-elem=figure

[TITLE]
