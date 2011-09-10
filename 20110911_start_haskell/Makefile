SRCS := $(wildcard *.hs)

AllTest: $(SRCS)
	ghc --make -Wall AllTest.hs

test: AllTest
	./AllTest

lint:
	hlint -c $(SRCS)

clean:
	rm -rf AllTest
	rm -rf *.hi *.o *~

.PHONY: lint clean test
