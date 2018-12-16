# How to use magit to manage Git projects?

We all use [Git](https://git-scm.com) as a command line tool to manage
projects. Git is an excellent [version
control](https://git-scm.com/book/en/v2/Getting-Started-About-Version-Control)
tool but for novice learning Git can be hard. Especially from the
command line when they are unaware of the flags & options. This may be
discuraging sometimes and lead them to stuck with very limited usage
of Git. Luckily most IDEs these days provide git extensions which
makes operating git a lot easier. One of such git extension is
available in Emacs called **Magit**.

The Magit project defines itself as "A Git Porcelain inside Emacs" or
rather an interface where every action can be managed by pressing some
key. In this post I'll walk you through Magit interface and how to
manage a git project using Magit. This post assumes that you already
have Emacs installed. Follow the steps on this
[page](https://magit.vc/manual/magit/Installing-from-Melpa.html#Installing-from-Melpa)
to install Magit and you are good to go.

## Introdution to Magit's interface

Start by visiting a project directory in Emacs dired mode. For the
sake of this post I'll visit the directory which has my Emacs
configurations `~/.emacs.d/` which is managed by Git.


Image: visiting_a_git_project.png

In command-line we also use the command `git status` to know the
current status of the project. Well Magit has something similar
function know as `magit-status`. One can call this function using `M-x
magit-status` shortform for the keys 'Alt + x magit-status'. As a
result one can see pop-up something like below

Image: magit_status.png

As noticed, Magit is capable of showing much more than the command
`git status`. It shows list of untracked files, files which are not
staged along with staged files. It also shows the stash list and
recent commits. All this in a single window.

This is not where it stops, one can check "what changed?" using a TAB.
For example I moved the cursor to one of the unstaged file
`custom_functions.org` and pressed TAB and below is what it displayed.

Image: show_unstaged_content.png

Similarly one can use a TAB to show the `git diff..` like output.
Staging a file is even easier by typing **s** over a file. Simply move
the cursor and press the **s** key. The file will be quickly moved to
the staged file list as show below

Image: staging_a_file.png


To unstage, use the **u** key. Using **s** & **u** instead of `git add
-u <file>` & `git reset HEAD <file>` was never that timesaving & fun.


## Commit changes

On the same Magit window, pressing the key **c** will popup a commit
window which provides flags like `--all` to stage all files or
`--signoff` to add a signoff line in a commit message.

Image: magit_commit_popup.png


I'll move the cursor to the line which enables signoff flag and press
ENTER. This will highligh the **--signoff** text which indicates that
the flag is enabled.

Image: magit_signoff_commit.png

Pressing **c** again will popup the window to write the commit message

Image: magit_commit_message.png


Finally use `C-c C-c`(shortform for keys Ctrl + cc) to commit the
changes.

Image: magit_commit_message_2.png

## Push changes

Once the changes are commited, the commit line will appear under
_Recent commits_ section. Place the cursor on that commit and press
**p** to push changes.

Image: magit_commit_log.png

I've uploaded the demonstration on YouTube just to get a feel of
Magit. Please see the video on this link --
https://youtu.be/Vvw75Pqp7Mc. Magit is been around since 10 years and
has mush more to offer. Please vist https://magit.vc to learn more.
