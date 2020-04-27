

%{
#include <stdio.h>
  #include <stdlib.h>
void yyerror(char *c);
int yylex(void);
%}

%token STRING FLOAT INT
%token '{' '}' '[' ']' ',' ':' 

%%
JSON:
    S {printf("VALIDO\n");}
    ;

S:
 '{' CONTEUDO '}' {}
 ;

CONTEUDO:
    CONTEUDO ',' CONTEUDO {}
    |STRING ':' VALOR {}
    ;

VALOR:
    S {}
    |INT {}
    |FLOAT {}
    |STRING {}
    |LISTA {}
    ;


LISTA:
    '[' ELEMENTO ']' {}
    |'[' ']'
    ;

ELEMENTO:
    ELEMENTO ',' ELEMENTO {}
    |LISTA {}
    |STRING {}
    |INT {}
    |FLOAT {}
    ;


%%

void yyerror(char *s) {
    printf("INVALIDO\n");
}

int main() {
  yyparse();
    return 0;

}
