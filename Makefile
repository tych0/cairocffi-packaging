# make deb ver=$commitish
.PHONY: deb
deb: cairocffi
ifeq (${ver},)
	@echo "no version (ver=) specified, not building"
	false
endif
	cp -r debian/ cairocffi/
	cd cairocffi && git buildpackage --git-upstream-tree=${ver} --git-ignore-new

cairocffi:
	git clone https://github.com/SimonSapin/cairocffi

.PHONY: clean
clean:
	-rm *deb *changes *.tar* *.build *.dsc

.PHONY: distclean
distclean: clean
	-rm -rf cairocffi
