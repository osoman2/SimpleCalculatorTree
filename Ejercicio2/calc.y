%{
#include <stdio.h>
#include <ctype.h>
#include "global.c"
%}
%union  {
    struct Node* nodo;
    struct ExpressionTree* expressionTree;
    char car [100];
}

%type <nodo> exp term factor
%type <expressionTree> command
%token NUMBER
%type <car> NUMBER

%%
command: exp{$$ = newTree();
$$->root = $1;
print2DTree($$->root,5);
} ;

exp : exp '+' term {
    $$ = newNode("+");
    $$->left = $1;
    $$->right = $3;
    }
    | exp '-' term {
    $$ = newNode("-");
    $$->left = $1;
    $$->right = $3; 
    }
    | term {$$ = $1;} ;

term : term '*' factor {$$ = newNode("*");
    $$->left = $1;
    $$->right = $3; 
    }
    | factor {$$ = $1;};

factor :  NUMBER {
    $$ = newNode($1);
    $$->left = NULL;
    $$->right = NULL;
}
        | '(' exp ')' {$$ = $2;};


%%

main(){
    yyparse();
    return 0;
}


void yyerror(char * s){
    fprintf(stderr,"%s\n",s);
} 