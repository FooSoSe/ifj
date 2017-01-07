CFLAGS=-std=c99 -Wall -pedantic -Wextra -g
CC=gcc
all: main.o precedence.o ilist.o scanner.o parser.o str.o ial.o interpret.o garbage_collector.o stack.o frame.o
	$(CC) main.o precedence.o ilist.o scanner.o parser.o str.o ial.o interpret.o stack.o garbage_collector.o frame.o -o ifj16
*.o: main.c precedence.c scanner.c parser.c
	$(CC) $(CFLAGS) -c main.c
	$(CC) $(CFLAGS) -c precedence.c
	$(CC) $(CFLAGS) -c ilist.c
	$(CC) $(CFLAGS) -c scanner.c
	$(CC) $(CFLAGS) -c parser.c
	$(CC) $(CFLAGS) -c str.c
	$(CC) $(CFLAGS) -c ial.c
	$(CC) $(CFLAGS) -c interpret.c
	$(CC) $(CFLAGS) -c stack.c
	$(CC) $(CFLAGS) -c garbage_collector.c
	$(CC) $(CFLAGS) -c frame.c
clean:
	rm *.o 
test:
	make clean
	make
	./ifj16 adding.java
valgrind:
	valgrind --track-origins=yes ./ifj16 adding.java
