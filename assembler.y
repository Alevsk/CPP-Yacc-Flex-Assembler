%{
#include <ctype.h>
#include <stdio.h>
%}

%token TAG MOV NUM COMMENT

%%

	list
	: list number
	| list tag
	| list mov
	| number
	| tag
	| mov
	;

	number
	: NUM '\n' { printf ("%d", $1); }
	;

	mov
	: MOV '\n' { printf ("mov"); }
	tag
	: TAG '\n' { printf ("1"); }
	;

%%

int main()
{
 return(yyparse());
}

int yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
  return 0;
}

int yywrap()
{
  return(1);
}