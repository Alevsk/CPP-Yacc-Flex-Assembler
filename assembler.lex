%{
#include <stdio.h>
#include "y.tab.h"
extern int yylval;

int getSymbol(char * yytext);

%}
%%

" "                         ;
\n                          { return '\n'; }
;([a-zA-z0-9_])*            { return COMMENT; }
[0-9]+                      { yylval = atoi(yytext); return(NUM); }
[a-zA-Z_]([a-zA-Z0-9_])*    { return getSymbol(yytext); }
.		                        { return yytext[0]; }

%%

int getSymbol(char * yytext) {
    if(!strcmp(yytext,"mov"))
      return MOV;
    else
      return TAG;
}