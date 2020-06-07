%{
#include "y.tab.h"    
%}
number [0-9]+


%%
[ ] {}
{number} {strcpy(yylval.car, yytext);
 return(NUMBER);}
\n return 0;
. {return yytext[0];}

%%
int yywrap(void){
    return 1;}