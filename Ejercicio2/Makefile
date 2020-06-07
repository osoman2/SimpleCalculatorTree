all: calc

y.tab.c: calc.y
	yacc -d calc.y

lex.yy.c: calc.l
	flex calc.l

calc: lex.yy.c y.tab.c
	gcc -o calc lex.yy.c y.tab.c
run: 
	./calc < test.txt

clean:
	rm calc lex.yy.c y.tab.c y.tab.h