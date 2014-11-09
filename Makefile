assembler: y.tab.c lex.yy.c tsim.h tsim.c
	gcc -g y.tab.c lex.yy.c -o assembler 

lex.yy.c: y.tab.h assembler.lex tsim.h
	flex assembler.lex

y.tab.c: assembler.y tsim.h
	yacc -v -d -t assembler.y

clean:
	rm -rf assembler y.tab.c lex.yy.c assembler.dSYM y.output

backup:
	tar -cvzf respaldo.tgz *.c *.lex *.h *.y