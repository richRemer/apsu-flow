name = flow
version = $(shell cat version)
installer = install-$(name)-$(version)
bundle = $(name)-$(version).tgz
bundled = bin lib share

default: installer

installer: $(installer)

clean:
	rm -fr *.tgz

distclean: clean
	rm -fr install-*

$(installer): $(bundle)
	bin/mkflow -f --prefix /usr/local $< $@

$(bundle): $(bundled)
	tar czf $@ $^

.PHONY: default installer clean distclean
