

.PHONY:
	@true

all:	mod_xsendfile


mod_xsendfile:	mod_xsendfile.c
	apxs2 -Wc,-Werror $(DEF) -ca mod_xsendfile.c

clean:
	@find . -name '*.o' -exec rm \{\} \;
	@find . -name '*.la' -exec rm \{\} \;
	@find . -name '*.lo' -exec rm \{\} \;
	@find . -name '*.slo' -exec rm \{\} \;
	@if [ -d ./.libs ]; then rm -rf ./.libs ; fi
	@find . -name '*~' -exec rm \{\} \;
	@find . -name '.#*' -exec rm \{\} \;
	@if [ -e ./test-strip ]; then rm -f ./test-strip ; fi
	@find . -name 'configure-stamp' -exec rm \{\} \;
	@find . -name 'build-stamp' -exec rm \{\} \;


install:
	apxs2 -cia -Wc,-Werror $(DEF) mod_xsendfile.c
