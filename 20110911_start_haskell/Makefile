SRCS := $(wildcard *.hs)
SRCS_TEST := $(wildcard *Test.hs)
BIN_TEST := $(subst .hs,,$(SRCS_TEST))

$(BIN_TEST):
	ghc --make -Wall $(BIN_TEST).hs

test: $(BIN_TEST)
	@for i in $(BIN_TEST); do \
		./$$i; \
	done

lint:
	hlint -c $(SRCS)

clean:
	rm -rf $(BIN_TEST)
	rm -rf *.hi *.o *~

.PHONY: lint clean test
