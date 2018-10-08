%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include "SyntaxTree/SyntaxTree.hpp"
#include <iostream>

using namespace compiler;
int yylex (void);
void yyerror (char const *);
%}
%define api.value.type {void *}

%token NAME COLON RIGHT_ARROW LEFT_BRACE RIGHT_BRACE SEMICOLON

%start input

%%
input:
  NAME COLON RIGHT_ARROW LEFT_BRACE statements RIGHT_BRACE   {}
 | %empty

statements:
  statements statement      {}
  | %empty

statement:
  name SEMICOLON        { std::cout << "";}
name:
NAME                     {compiler::SyntaxTree *p=reinterpret_cast<compiler::SyntaxTree *>($1);std::cout << "To code :"<<p->toCode() <<std::endl;}
%%

  std::unique_ptr<compiler::SyntaxTree> root;
void yyerror(char const *x){
printf("erroro %s\n",x);
exit(1);
}
