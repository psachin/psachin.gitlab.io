;; publish.el --- Publish org-mode project on Gitlab Pages
;; Author: Sachin

;;; Commentary:
;; This script will convert the org-mode files in this directory into
;; html.

;;; Code:
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-refresh-contents)
(package-install 'htmlize)
(package-install 'org-plus-contrib)

(require 'org)
(require 'ox-publish)
(require 'htmlize)
(require 'ox-rss)


;; setting to nil, avoids "Author: x" at the bottom
(setq org-export-with-section-numbers nil
      org-export-with-smart-quotes t
      org-export-with-toc nil)

(setq org-html-divs '((preamble "header" "top")
                      (content "main" "content")
                      (postamble "footer" "postamble"))
      org-html-container-element "section"
      org-html-metadata-timestamp-format "%Y-%m-%d"
      org-html-checkbox-type 'html
      org-html-html5-fancy t
      org-html-validation-link t
      org-html-doctype "html5"
      org-html-htmlize-output-type 'css
      org-src-fontify-natively nil)

(defvar psachin-website-html-head
  "<link rel='icon' type='image/x-icon' href='/images/favicon.jpg'/>
<link rel='stylesheet' href='https://code.cdn.mozilla.net/fonts/fira.css'>
<link rel='stylesheet' href='/css/site.css?v=2' type='text/css'/>
<link rel='stylesheet' href='/css/custom.css' type='text/css'/>
<link rel='stylesheet' type='text/css; href='http://www.pirilampo.org/styles/bigblow/css/bigblow.css'/>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.0.0.js'></script>
<script src='https://code.jquery.com/jquery-migrate-3.0.1.js'></script>
<link href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>")

(defvar psachin-website-html-preamble
  "<div class='intro'>
<img src='/images/about/profile.png' alt='Sachin Patil' class='no-border'/>
<h1>Sachin</h1>
<p>Free software developer & Emacser</p>
</div>

<div class='nav'>
<ul>
<li><a href='/'>Blog</a>.</li>
<li><a href='http://gitlab.com/psachin'>GitLab</a>.</li>
<li><a href='http://github.com/psachin'>GitHub</a>.</li>
<li><a href='https://www.reddit.com/user/psachin'>Reddit</a>.</li>
<li><a href='https://plus.google.com/u/0/+Sachinp'>G+</a>.</li>
<li><a href='https://youtube.com/user/iclcoolsterU'>YouTube</a>.</li>
<li><a href='/about/'>About</a>.</li>
<li><a href='/index.xml'>RSS feed</a></li>
</ul>
</div>")

(defvar psachin-disqus
"<div class='comments'>
	<div id='disqus_thread'></div>
	<script type='text/javascript'>

	    var disqus_shortname = 'darkstar';

	    (function() {
	        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
	        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
	        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
	    })();

	</script>
	<noscript>Please enable JavaScript to view the <a href='http://disqus.com/?ref_noscript'>comments powered by Disqus.</a></noscript>
</div>")

(defvar psachin-website-html-postamble
  "<div class='footer'>
Copyright © 2012-2018 <a href='mailto:iclcoolster@gmail.com'>Sachin Patil</a>. <br>
GnuPG fingerprint: 28C5 A1F3 221B 949D B651 FC47 E5F9 CE48 62AA 06E2 <br>
Adapted from <a href='https://nicolas.petton.fr'>https://nicolas.petton.fr</a> <br>
Last updated on %C using %c
</div>")

(defvar site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js" "woff" "html" "pdf"))
  "File types that are published as static files.")

(defun psachin-org-sitemap-format-entry (entry style project)
  "Format posts with author and published data.

ENTRY: file-name
STYLE:
PROJECT: `posts in this case."
  (cond ((not (directory-name-p entry))
         (format "*[[file:%s][%s]]*
                  #+HTML: <p class='pubdate'>by %s on %s</p>"
		 entry
		 (org-publish-find-title entry project)
		 (car (org-publish-find-property entry :author project))
		 (format-time-string "%b %d, %Y"
				     (org-publish-find-date entry project))))
        ((eq style 'tree) (file-name-nondirectory (directory-file-name entry)))
        (t entry)))


(setq org-publish-project-alist
      `(("posts"
         :base-directory "posts"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :publishing-directory "./public"
         :exclude ,(regexp-opt '("README.org" "draft"))
         :auto-sitemap t
         :sitemap-filename "index.org"
	 :sitemap-title "Posts"
	 :sitemap-file-entry-format "%d *%t*"
	 :sitemap-format-entry psachin-org-sitemap-format-entry
         :sitemap-style list
         :sitemap-sort-files anti-chronologically
	 :html-head ,psachin-website-html-head
	 :html-preamble ,psachin-website-html-preamble
	 :html-postamble ,psachin-website-html-postamble)
       ("about"
        :base-directory "about"
        :base-extension "org"
	:exclude ,(regexp-opt '("README.org" "draft"))
	:index-filename "index.org"
        :recursive nil
        :publishing-function org-html-publish-to-html
        :publishing-directory "./public/about"
	:html-head ,psachin-website-html-head
	:html-preamble ,psachin-website-html-preamble
	:html-postamble ,psachin-website-html-postamble)
       ("css"
        :base-directory "./css"
        :base-extension "css"
        :publishing-directory "./public/css"
        :publishing-function org-publish-attachment
        :recursive t)
       ("images"
	:base-directory "./images"
        :base-extension ,site-attachments
        :publishing-directory "./public/images"
        :publishing-function org-publish-attachment
        :recursive t)
       ("rss"
	:base-directory "posts"
        :base-extension "org"
	:html-link-home "https://psachin.gitlab.io/"
	:rss-link-home "https://psachin.gitlab.io/"
	:html-link-use-abs-url t
	:rss-extension "xml"
	:publishing-directory "./public"
	:publishing-function (org-rss-publish-to-rss)
	:section-number nil
	:exclude ".*"
	:include ("index.org")
	:table-of-contents nil)
       ("all" :components ("posts" "about" "css" "images" "rss"))))

(provide 'publish)
;;; publish.el ends here
