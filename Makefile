NAME ?= kernel-flasher

VERSION ?= 5.1

DATE := $(shell busybox date +"%Y%m%d-%H%M")

ZIP := $(NAME)-$(VERSION)-$(DATE).zip

EXCLUDE := -x!Makefile -x!README.md -x!*.git* -x!$(NAME)-*.zip*

all: $(ZIP)

$(ZIP):
	@echo Creating ZIP: $(ZIP)
	@7z -mx9 -tzip a $@ * $(EXCLUDE)
	@echo Generating SHA1...
	@busybox sha1sum $@ > $@.sha1
	@type $@.sha1
	@echo Done.

clean:
	@del /f "$(NAME)-"*.zip* 2>nul
	@echo Done.
