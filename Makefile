# Makefile for psachin.gitlab.io

.PHONY: all publish publish_no_init

all: publish

publish: publish.el
	@echo "Publishing... with current Emacs configurations."
	~/github/emacs/src/emacs --batch --load publish.el --funcall org-publish-all

publish_no_init: publish.el
	@echo "Publishing... with --no-init."
	~/github/emacs/src/emacs --batch --no-init --load publish.el --funcall org-publish-all

clean:
	@echo "Cleaning up.."
	rm -rv public/*
	rm -rv ~/.org-timestamps/*
