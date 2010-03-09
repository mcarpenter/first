
CC=gcc
COL=/usr/bin/col
MAKEDEPEND=/usr/openwin/bin/makedepend
NEQN=/usr/bin/neqn
NROFF=/usr/bin/nroff
RM=/usr/bin/rm
TBL=/usr/bin/tbl

LIBFLAGS=-L/usr/local/lib -lintl

.PHONY: all
all: first first.cat

first: last.c Makefile
	$(CC) $(LIBFLAGS) -o first last.c

first.cat: first.1
	$(TBL) first.1 | $(NEQN) /usr/share/lib/pub/eqnchar - | $(NROFF) -u0 -Tlp -man - | $(COL) -x > first.cat

.PHONY: clean
clean:
	$(RM) -f core first first.cat last.o Makefile.bak

.PHONY: depend
depend:
	$(MAKEDEPEND) last.c

