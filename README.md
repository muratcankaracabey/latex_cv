# Latex CV
- You can create your CV using this template on [Overleaf](https://www.overleaf.com/latex/templates/murats-cv-template/gfwjwshrzqgd) very easily.
- This CV is inspired by the design of [Awesome CV](https://github.com/posquit0/Awesome-CV). 
- You might think this as a simplified version. I created this project from scratch to learn Latex and the way I wrote might not be the best latex practices. However, it is easy to play with the high level functions provided in [CV.tex](https://github.com/muratcankaracabey/latex_cv/blob/master/CV.tex) file without going too much into the detail to have a certain level of expressiveness in your resume. The simplicity also makes it easy to understand what is going on and also enables to make low level customizations.

### How does it look?

<img src="https://github.com/muratcankaracabey/latex_cv/blob/master/images/example_cv.png" width="425"/> <img src="https://github.com/muratcankaracabey/latex_cv/blob/master/images/coverletter.png" width="425"/> 

### How to use it?
- With minimum effort, you can use the [CV.tex](https://github.com/muratcankaracabey/latex_cv/blob/master/CV.tex) as it is provided with the high level functions such as ```\datedexperience```, ```\explanation```, ```\explanationdetail``` to add elements to your CV. You can create skill elements with ```\newcommand{\skillname{\createskill{<Skill Category>}{<explanation>}}}``` and finally create the list of skills with ```\createskills{<comma seperated skills list>}```. 
- You can also use it for your **cover letter** by just using
  ```
  \setcompanyname{GOOGLE INC.}
  \setcontactperson{Mr.Brown}
  \setclaimedposition{Junior Data Scientist} 
  \coverletter{ %
  <coverlettertext>
  }
  ``` 
  and deleting the rest of sections.
- Of course, if you want to go further you can check the [muratcan_cv.cls](https://github.com/muratcankaracabey/latex_cv/blob/master/muratcan_cv.cls) file. This is my first latex project so it might be error-prone and not as generic as possible(I still have some warnings that needs to be resolved). However I tried to make it understandable for later contributions.
- You can change the header content with the ```set..``` commands in the beginning and also the the color of the theme.
- Just replace the actual texts with your related education/experience and also don't forget to replace ```\lipsum[1][1-12]\par``` with actual texts. That package is just used for illustration reasons. Since I am not sure what to write to those parts of the resume right now.
  
### TODOS

- [ ] Resolve the warnings.

### Warning
- For Mac users, If you use TexShop, you need to locate the AwesomeFont in your file system and load to your system. It is most probably under ```/usr/local/texlive/2019/texmf-dist/fonts/opentype/public```. Just locate it and double-click install. Then you are good to go.
