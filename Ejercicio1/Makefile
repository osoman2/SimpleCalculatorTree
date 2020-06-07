all: calc7

y.tab.c: calc7.y
	yacc -d calc7.y

lex.yy.c: calc7.l
	flex calc7.l

calc7: lex.yy.c y.tab.c
	gcc -o calc lex.yy.c y.tab.c

run:
	./calc

clean:
	rm lex.yy.c y.tab.c y.tab.h calc