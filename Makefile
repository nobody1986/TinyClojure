CC=g++ -std=c++11  -O3

all: tclj

tclj: src/tool.o src/TinyClojure.o
	$(CC) src/*.o -o tclj

src/tool.o: src/tool.cpp src/TinyClojure.h
	$(CC) -c src/tool.cpp -o src/tool.o

src/TinyClojure.o: src/TinyClojure.cpp src/TinyClojure.h
	$(CC) -c src/TinyClojure.cpp -o src/TinyClojure.o

test: triptest

triptest: tclj
	./tclj tests/trip.clj

clean:
	rm -f src/*.o tclj
