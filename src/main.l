
%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

/* Definicoes */

DIGITO [0-9]
INT    {DIGITO}+
FLOAT  {DIGITO}+\.{DIGITO}+


%%

	       /* Regras */

\"([A-Za-z0-9]|\ )+\" { return(STRING);}

{INT} { return(INT);}

{FLOAT} {return(FLOAT);}

\: {return(':');}

\, {return(',');}

\[ {return('[');}

\] {return(']');}

\{ {return('{');}

\} {return('}');}

\n ;

. ;
%%

int yywrap() {
  return 1;
}
