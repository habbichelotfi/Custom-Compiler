all:
	$(MAKE) grammar
	$(MAKE) lex
	g++ -std=gnu++11 -c compiler/grammar.tab.c compiler/lex.yy.c
	mv *.o compiler
	ar rvs  compiler/lexgram.a  compiler/grammar.tab.o compiler/lex.yy.o
	g++ -std=gnu++11    compiler/main.cpp compiler/lexgram.a
	mv a.out bin

grammar:
	bison -d compiler/grammar.y
	mv grammar.tab.* compiler
lex:
	flex compiler/lex.l
	mv lex.yy.* compiler
run:
	$(MAKE) all
	./bin/a.out <test/entre.code
