%option noyywrap

%{
#include "grammar.tab.h"
#include "SyntaxTree/SyntaxTree.hpp"
#include "SyntaxTree/Name.hpp"
%}
alpha [a-zA-Z]
name  {alpha}([0-9]*{alpha}*)+
whitespace [ \r\t\v\f]
linefeed \n

%%
{name}    { yylval=reinterpret_cast<void *>( new compiler::Name(yytext)); return NAME;}
";"       {return SEMICOLON;}
":"       {return COLON;}
"->"      {return RIGHT_ARROW;}
"{"       {return LEFT_BRACE;}
"}"       {return RIGHT_BRACE;}
{whitespace}
{linefeed}      ++yylineno;
%%
#include <stdio.h>
