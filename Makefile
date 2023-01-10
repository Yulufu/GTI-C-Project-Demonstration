CXX=clang++
INCLUDES=-Iincludes/
CXXFLAGS=-std=c++20 -gdwarf-4 -fstandalone-debug -Wall -Wextra -Werror -pedantic $(INCLUDES)

exec: bin/exec
tests: bin/tests

bin/exec: ./src/driver.cc ./src/illini_book.cc ./src/utilities.cc 
	$(CXX) $(CXXFLAGS) $^ -o $@

bin/tests: ./tests/tests.cc ./src/illini_book.cc ./src/utilities.cc 
	$(CXX) $(CXXFLAGS) $^ -o $@

.DEFAULT_GOAL := exec
.PHONY: clean exec tests

clean:
	rm -fr bin/* obj/*