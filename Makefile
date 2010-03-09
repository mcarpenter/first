
CC=gcc
COL=/usr/bin/col
MAKEDEPEND=/usr/openwin/bin/makedepend
NEQN=/usr/bin/neqn
NROFF=/usr/bin/nroff
RM=/usr/bin/rm
TBL=/usr/bin/tbl

LIBFLAGS=-L/usr/local/lib -lintl

.PHONY: all
all: first README

first: last.c Makefile
	$(CC) $(LIBFLAGS) -o first last.c

README: first.1
	$(TBL) first.1 | $(NEQN) /usr/share/lib/pub/eqnchar - | $(NROFF) -u0 -Tlp -man - | $(COL) -x > README

.PHONY: clean
clean:
	$(RM) -f core first README last.o Makefile.bak

.PHONY: depend
depend:
	$(MAKEDEPEND) last.c

