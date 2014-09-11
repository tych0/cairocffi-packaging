# make deb ver=$commitish
.PHONY: deb
deb: cairocffi
ifeq (${ver},)
	@echo "no version (ver=) specified, not building"
	false
endif
	cd cairocffi && git buildpackage --git-upstream-tree=${ver} --git-ignore-new

cairocffi:
	git clone https://github.com/SimonSapin/cairocffi
	ln -s ../debian cairocffi/debian

.PHONY: clean
clean:
	-rm *deb *changes *.tar.gz *.build

.PHONY: distclean
distclean: clean
	-rm -rf cairocffi
