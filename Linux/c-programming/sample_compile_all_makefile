CC = cc
CFLAGS = 
LIBS = 
SRCS = $(wildcard *.c)

PROGS = $(patsubst %.c,%,$(SRCS))

all: $(PROGS)

%: %.c
	$(CC) $(CFLAGS)  -o $@ $<  $(LIBS)
clean: 
	rm -f $(PROGS)
