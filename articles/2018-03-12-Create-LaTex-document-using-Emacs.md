


I'm impressed by the post titled [A introduction to creating documents
in LaTeX](https://opensource.com/article/17/6/introduction-latex) by
[Aaron Cocker](https://opensource.com/users/aaroncocker) where he
introduces [LaTeX typesetting system](https://www.latex-project.org)
and also explains creating LaTeX document using
[TexStudio](http://www.texstudio.org/). He also explains few LaTeX
editors which users find comfortable for creating LaTeX documents.

What derived my attention was the first comment to the post by [Greg
Pittman](https://opensource.com/users/greg-p) where is says "_LaTeX
seems like an awful lot of typing when you first start..._". In a way
this is true. For beginners, LaTeX is a lot if typing and debugging(if
you missed to escape a special character like an exclamation mark!).
Those reason are enough for a beginner to start searching for a
replacement. So in this post let me introduce you to GNU Emacs to
create LaTeX documents. I promise this will be fast and easy.

## Create your first document.

Launch Emacs by typing,
```
emacs -q --no-splash helloworld.org
```

`-q` flag ensures not to load any Emacs initialization if present. The
`--no-splash-screen` flag prevents displaying splash screen to ensure
you have only one window opened with file `helloworld.org`.

[IMAGE: emacs_startup.png]
(Caption: GNU Emacs with file helloworld.org opened in a buffer window.)

Its time to put some LaTeX headers. We do this the Emacs way. Go to
**Org** in menu-bar and select **Export/Publish**.

[IMAGE: insert_template_flow.png]
(Caption: Images illustrating how to insert a default template.)

In next window, Emacs give options to either export or insert a
template, insert the template by entering **#**([#] Insert template).
This will move a cursor to mini-buffer where the prompt says **Options
category:**. At this time you may not know the category names.
Pressing TAB will show possible completions. Type "default" and press
Enter. Following content will be inserted.


```
#+TITLE: helloworld
#+DATE: <2018-03-12 Mon>
#+AUTHOR:
#+EMAIL: makerpm@nubia
#+OPTIONS: ':nil *:t -:t ::t <:t H:3 \n:nil ^:t arch:headline
#+OPTIONS: author:t c:nil creator:comment d:(not "LOGBOOK") date:t
#+OPTIONS: e:t email:nil f:t inline:t num:t p:nil pri:nil stat:t
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:t todo:t |:t
#+CREATOR: Emacs 25.3.1 (Org mode 8.2.10)
#+DESCRIPTION:
#+EXCLUDE_TAGS: noexport
#+KEYWORDS:
#+LANGUAGE: en
#+SELECT_TAGS: export
```

Change the title, date, author and email as you wish. Mine looks like
below.
```
#+TITLE: Hello World! My first LaTeX document
#+DATE: \today
#+AUTHOR: Sachin Patil
#+EMAIL: psachin@redhat.com
```

I don't want table of content to be created for now, hence I change value of
`toc` from `t` to `nil` in line as shown below.
```
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:nil todo:t |:t
```

Its time for a section and paragraphs. A section starts with an
asterisk(*). I'll copy content of paragraphs from Aaron's post,
```
* Introduction

  \paragraph{}
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras lorem
  nisi, tincidunt tempus sem nec, elementum feugiat ipsum. Nulla in
  diam libero. Nunc tristique ex a nibh egestas sollicitudin.

  \paragraph{}
  Mauris efficitur vitae ex id egestas. Vestibulum ligula felis,
  pulvinar a posuere id, luctus vitae leo. Sed ac imperdiet orci, non
  elementum leo. Nullam molestie congue placerat. Phasellus tempor et
  libero maximus commodo.
```

[IMAGE: helloworld_file.png]
(Caption: Contents of helloworld.org file)

With content in place, its time to export the content as PDF. Select
**Export/Publish** from **Org** menu again but this time type
**l**(**[l] Export to LaTeX**) followed by **o**(**[o] As PDF file and
open**). This not only opens PDF file for you to view but also save
file as `helloworld.pdf` in the same path as `helloworld.org`.

[IMAGE: org_to_pdf.png]
(Caption: Export helloworld.org to helloworld.pdf)

[IMAGE: org_and_pdf_file.png]
(Caption: helloworld.pdf file opened at the bottom)

You can also export org to PDF by pressing `Alt + x` followed by
typing "org-latex-export-to-pdf". Use TAB to auto-complete.

Guess what's more? Emacs also creates `helloworld.tex` file for you to
have fine control over the content.

[IMAGE: org_tex_pdf.png]
(Caption: Emacs with LaTeX, org and PDF file opened in three different windows)

You can compile `.tex` file to `.pdf` using the
command,
```
pdflatex helloworld.tex
```

The `.org` file as more to offer. It can be exported to HTML or as
simple text file. What I like about org files is they can be pushed to
[GitHub](https://github.com) where they are rendered just like any
other markdown formats.


## Create LaTeX Beamer presentation

Lets go a step ahead and see how to create a LaTeX beamer presentation
using the same file with some modifications as below,
```
#+TITLE: LaTeX Beamer presentation
#+DATE: \today
#+AUTHOR: Sachin Patil
#+EMAIL: psachin@redhat.com
#+OPTIONS: ':nil *:t -:t ::t <:t H:3 \n:nil ^:t arch:headline
#+OPTIONS: author:t c:nil creator:comment d:(not "LOGBOOK") date:t
#+OPTIONS: e:t email:nil f:t inline:t num:t p:nil pri:nil stat:t
#+OPTIONS: tags:t tasks:t tex:t timestamp:t toc:nil todo:t |:t
#+CREATOR: Emacs 25.3.1 (Org mode 8.2.10)
#+DESCRIPTION:
#+EXCLUDE_TAGS: noexport
#+KEYWORDS:
#+LANGUAGE: en
#+SELECT_TAGS: export
#+LATEX_CLASS: beamer
#+BEAMER_THEME: Frankfurt
#+BEAMER_INNER_THEME: rounded


* Introduction
*** Programming
    - Python
    - Ruby

*** Paragraph one

    Lorem ipsum dolor sit amet, consectetur adipiscing
    elit. Cras lorem nisi, tincidunt tempus sem nec, elementum feugiat
    ipsum. Nulla in diam libero. Nunc tristique ex a nibh egestas
    sollicitudin.

*** Paragraph two

    Mauris efficitur vitae ex id egestas. Vestibulum
    ligula felis, pulvinar a posuere id, luctus vitae leo. Sed ac
    imperdiet orci, non elementum leo. Nullam molestie congue
    placerat. Phasellus tempor et libero maximus commodo.

* Thanks
*** Links
    - Link one
    - Link two
```

I have just added three more lines to header,
```
#+LATEX_CLASS: beamer
#+BEAMER_THEME: Frankfurt
#+BEAMER_INNER_THEME: rounded
```

To export to PDF press `Alt + x` followed by typing
"org-beamer-export-to-pdf".

[IMAGE: LaTeX_Beamer_presentation.png]
(Caption: Latex Beamer presentation created using Emacs and Org mode)

Hope it was fun creating a LaTeX and Beamer document using Emacs. It
is faster when using keyboard shortcuts than a mouse. Emacs Org-mode
has lot more to offers than we covered in this post. Please refer
[orgmode.org](https://orgmode.org/worg/org-tutorials/org-latex-export.html)
to learn more.
