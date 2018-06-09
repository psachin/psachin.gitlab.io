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
(package-install 'org-plus-contrib)
(package-install 'htmlize)

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
<link rel='stylesheet' href='css/stylesheet.css' type='text/css'/>")

(defvar psachin-website-html-postamble
  "<div class='footer'>
Copyright 2018 %a.<br>
Last updated: %C. <br>
Built with %c.
</div>")

(defvar site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js" "woff" "html" "pdf"))
  "File types that are published as static files.")

(setq org-publish-project-alist
      (list
       (list "org"
             :base-directory "."
             :base-extension "org"
             :recursive t
             :publishing-function '(org-html-publish-to-html)
             :publishing-directory "./public"
             :exclude (regexp-opt '("README" "draft"))
             :auto-sitemap t
             :sitemap-filename "index.org"
             :sitemap-file-entry-format "%d *%t*"
             :sitemap-style 'list
             :sitemap-sort-files 'anti-chronologically
	     :html-head psachin-website-html-head
	     :html-postamble psachin-website-html-postamble)
       (list "css"
             :base-directory "./css"
             :base-extension "css"
             :publishing-directory "./public/css"
             :publishing-function 'org-publish-attachment
             :recursive t)
       (list "images"
	     :base-directory "./images"
             :base-extension site-attachments
             :publishing-directory "./public/images"
             :publishing-function 'org-publish-attachment
             :recursive t)
       (list "all" :components '("org" "css" "images"))))

(provide 'publish)
;;; publish.el ends here
