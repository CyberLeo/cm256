CFLAGS:=-O2 -Wall -march=native -fPIC -g

all: libcm256.so

libcm256.so: gf256.o cm256.o
	$(CC) -shared gf256.o cm256.o -o libcm256.so

#libcm256.a: gf256.o cm256.o
#	$(AR) Dcvrs libcm256.a gf256.o cm256.o

gf256.o: gf256.h gf256.cpp
	$(CC) $(CFLAGS) -c gf256.cpp

cm256.o: cm256.h cm256.cpp
	$(CC) $(CFLAGS) -c cm256.cpp

cm256.h: gf256.h

test.o: test.c++
	$(CXX) $(CFLAGS) -c test.c++

test: gf256.o cm256.o test.o
	$(CXX) $(CFLAGS) gf256.o cm256.o test.o -o test

clean:
	-rm -f gf256.o cm256.o libcm256.so libcm256.a test.o test

