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
      org-html-validation-link nil
      org-html-doctype "html5")

(defvar psachin-website-html-head
  "<link rel='icon' type='image/x-icon' href='/images/favicon.ico'/>
<link rel='stylesheet' href='https://code.cdn.mozilla.net/fonts/fira.css'>
<link rel='stylesheet' href='/css/site.css?v=2' type='text/css'/>
<link rel='stylesheet' href='/css/custom.css' type='text/css'/>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://code.jquery.com/jquery-3.0.0.js'></script>
<script src='https://code.jquery.com/jquery-migrate-3.0.1.js'></script>
<link href='https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>")

(defvar psachin-website-html-preamble
  "<div class='intro'>
<img src='/images/about/profile.png' alt='Sachin Patil' class='no-border'/>
<h1>Sachin</h1>
<p>Free software deeloper & Emacser</p>
</div>

<div class='nav'>
<ul>
<li><a href='/'>Home</a>.</li>
<li><a href='http://gitlab.com/psachin'>GitLab</a>.</li>
<li><a href='https://plus.google.com/u/0/+Sachinp'>Google Plus</a>.</li>
<li><a href='https://youtube.com/user/iclcoolsterU'>YouTube</a>.</li>
<li><a href='mailto:iclcoolster@gmail.com'>Contact</a>.</li>
<li><a href='/about/about.html'>About</a>.</li>
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
Copyright © 2012-2018 Sachin Patil.<br>
Last updated: %C. <br>
Built with %c.
</div>")

(defvar site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js" "woff" "html" "pdf"))
  "File types that are published as static files.")

(setq org-publish-project-alist
      `(("posts"
         :base-directory "posts"
         :base-extension "org"
         :recursive t
         :publishing-function org-html-publish-to-html
         :publishing-directory "./public"
         :exclude ,(regexp-opt '("README" "draft"))
         :auto-sitemap t
         :sitemap-filename "index.org"
	 :sitemap-title "Sachin's homepage"
	 :sitemap-file-entry-format "%d *%t*"
         :sitemap-style list
         :sitemap-sort-files anti-chronologically
	 :html-head ,psachin-website-html-head
	 :html-preamble ,psachin-website-html-preamble
	 :html-postamble ,psachin-website-html-postamble)
       ("about"
        :base-directory "."
        :base-extension "org"
	;;:exclude ,(regexp-opt '("README" "draft"))
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
        :publishing-function org-rss-publish-to-rss
        :publishing-directory "./public"
	:html-link-home "https://psachin.gitlab.io"
	:html-link-use-abs-url t)
       ("all" :components ("posts" "about" "css" "images" "rss"))))

(provide 'publish)
;;; publish.el ends here
