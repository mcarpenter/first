
CC=gcc
COL=/usr/bin/col
EQNCHAR=/usr/share/lib/pub/eqnchar
MAKEDEPEND=/usr/openwin/bin/makedepend
NEQN=/usr/bin/neqn
NROFF=/usr/bin/nroff
RM=/usr/bin/rm
TBL=/usr/bin/tbl

LDFLAGS=-lintl

.PHONY: all
all: first README

first: first.c Makefile
	$(CC) $(LDFLAGS) -o first first.c

README: first.1
	$(TBL) first.1 | $(NEQN) $(EQNCHAR) - | $(NROFF) -u0 -Tlp -man - | $(COL) -b -x > README

.PHONY: clean
clean:
	$(RM) -f core first README first.o Makefile.bak

.PHONY: depend
depend:
	$(MAKEDEPEND) first.c

