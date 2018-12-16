---
layout: post
title: Emacs Still rocks
tags: emacs
category: article
permalink: /article/emacs-still-rocks/
author: sachin
comments: true
---


GNU Emacs has been around since 1976 and has been a popular choice
amongst Software developers and Writers. Its main focus was
extensible, customizable, self-documenting and real-time display.
Never before a text-editor was designed having a functionality of an
Operating System(Yes for me its an Operating System). Its core was
written in C and the wrapper around is written in <a
href="https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html"
target="_blank">elisp</a> -- a dialect of lisp programming language.
<a
href="https://en.wikipedia.org/wiki/Lisp_%28programming_language%29"
target="_blank">lisp</a> is also a favorable language for Artificial
Intelligence research.

![splash-screen]({{ site.baseurl }}/images/emacs-opensource.com/fig-1.png "Emacs Splash screen")

**Splash screen**: Emacs Splash screen when emacs is started.


I came across Emacs when I was working as a Research Student at the
University. My work involved performing Physics simulations. The
simulation code was written in Python. While all my colleagues were
using VIM, I started with VIM too but soon found terrible to work with
VIM modes. I wanted something simpler, one which should act as a
simple editor but be powerful when needed. I saw few Linux kernel
developers using Emacs and decided to give it a try. Emacs was started
by <a href="https://www.stallman.org/" target="_blank">Richard
Stallman</a>. Without any second thought I installed it. It was
simple, it had menu-bar just like any other editor. I could use a
mouse if required but was also highly customizable. Soon I customized
it for Python(the primary language I used) and got acquainted with the
keystrokes. As time passed my Emacs was configured to my needs and I
was much faster with keyboard than mouse.

Today I don't even need to get out of Emacs to respond to emails, read
news, chat, browse files/directory, run commands, access files on
remote server, blog, and play songs. Emacs has all built-in. I even
program my <a href="https://www.raspberrypi.org/"
target="_blank">Raspberry-Pi</a> and write/burn a code in <a
href="https://www.arduino.cc/" target="_blank">Arduino</a>/Atmega32
micro-controllers from Emacs.


Emacs readily supports all the major programming languages. From
syntax highlighting, auto-completion to help & documentation are some
of the features available to developers. Installing additional
plugins(extensions) can be done using 'package-install'. Emacs binds
with the system so well that one hardly needs to open a terminal to
run commands. If configured, it can be an ideal IDE for developers.

For non-technical tasks like note-taking, agenda and blogs, Emacs
provides a (killer)mode known as <a href="http://orgmode.org/"
target="_blank">org-mode</a>. I manage all my notes and TODO list in
org-mode. Recently I used artist-mode with <a
href="http://ditaa.sourceforge.net/" target="_blank">ditaa</a> for
block diagrams and was surprised with the results. An org-file can be
exported to different formats such as HTML, <a
href="http://www.latex-project.org/" target="_blank">LaTeX</a>, Open
Document, and Markdown.

![artist-mode]({{ site.baseurl }}/images/emacs-opensource.com/fig-2.png "Emacs artist-mode with ditaa")

**artist-mode**: Emacs artist-mode on left-side with finished image
  converted using ditaa on right.


For those who are new to Emacs, It is not just an editor but also a
file browser. Consider it just like any other editor. Use mouse and
menu-bar. Try to get familiar with it and then try its built-in
tutorial(or I would say 'self-tutorial'). After spending some time,
try to learn keystrokes and avoid using mouse eventually. You won't
need mouse unless you are using 'artist-mode'. Emacs does not impose
all the complexity at once, but all the functionality is made
available when needed.


### Some of the Emacs extensions I use:

- <a href="http://magit.vc/" target="_blank">magit</a>: A Git
  Porcelain inside Emacs. Using magit one can handle <a href="http://www.git-scm.com/" target"_blank">Git</a> repository
  within Emacs.
- <a href="https://github.com/pidu/git-timemachine" target="_blank">git-timemachine</a>: Browse
  through historic version of a git-controlled file.
- <a href="https://github.com/capitaomorte/yasnippet"
  target="_blank">yasnippet</a>: Emacs template system.
- <a href="https://tkf.github.io/emacs-jedi/latest/" target="_blank">emacs-jedi</a>: Python auto-completion library.
- <a href="https://github.com/magnars/multiple-cursors.el"
  target="_blank">multiple-cursors</a>: Multiple cursors for Emacs.
- <a href="https://github.com/jekor/hidepw" target="_blank">hidepw</a>: Emacs minor mode for hiding passwords (anti-shoulder-surfing).
- <a href="https://company-mode.github.io/"
  target="_blank">company</a>: Complete anything. One can complete any
  word using company-mode.


![magit]({{ site.baseurl }}/images/emacs-opensource.com/fig-3.png "Magit interface showing commit logs")

**magit**: magit-log buffer showing Git commit logs.


### People who inspired me to Emacs:

- <a href="http://sachachua.com/blog/" target="_blank">Sacha Chua</a>:
  Her blog site has plenty of posts on Emacs. Specially she writes
  excellent posts on org-mode and agenda. She also hosts Emacs Hangout
  where she regularly interviews Emacs users and developers.

- <a href="http://xahlee.org/" target="_blank">Xah Lee</a>: Xah is the
  most inspiring person in Emacs world. He regularly posts on <a
  href=""https://plus.google.com/u/0/113859563190964307534/posts"
  target="_blank">Google-plus</a>. His tutorials on Emacs and elisp
  are most recommended for newbies.

- <a href="http://jekor.com/" target="_blank">Chris Frono</a>: Chris
  wrote hidepw and co-hosts <a href="http://www.haskellcast.com/"
  target="_blank">The Haskell Cast</a>. His <a
  href="https://www.youtube.com/playlist?list=PLxj9UAX4Em-IiOfvF2Qs742LxEK4owSkr"
  target="_blank">YouTube</a> videos tutorials on Emacs can be of
  great advantage.

- <a href="https://github.com/magnars" target="_blank">Magnar
  Sveen</a>: Author and maintainer of multiple-cursors. Check out his
  Emacs videos at <a href="http://emacsrocks.com/"
  target="_blank">emacsrocks.com</a>

- <a href="https://github.com/jwiegley" target="_blank">John
  Wiegley</a>: John is current Emacs maintainer. His Emacs hangout
  video on <a href="https://www.youtube.com/watch?v=QRBcm6jFJ3Q"
  target="_blank">Emacs Lisp Development Tips</a> is must watch.


I was lazy enough to write the shebang line at the top of a script so
I wrote <a href="https://github.com/psachin/insert-shebang"
target="_blank">insert-shebang</a> which can insert a shebang line at
the top. It works with most scripting languages like Python, Ruby, and
Bash. It can be customized to insert a header line in a C-program as
well. Besides, I maintain a site <a href="http://haqiba.org"
target="_blank">haqiba.org</a> which hosts Emacs config snippets.
Recently I wrote a function which capture screen-shot of a window or a
region using mouse. The code is hosted at <a
href="https://gist.github.com/psachin/6e42d303bc54a5d38798"
target="_blank">https://gist.github.com</a>.


Emacs has lot much to offer than just an editor. It is recommended for
both new users and core developers. Everyday I discover something new
in Emacs and this has never stopped. For many of us an OS is just a
bootloader for Emacs.
