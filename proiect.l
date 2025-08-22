%{
    #include "proiect.tab.h"
    #include <iostream>
%}
%option noyywrap
%%
";" {std::cout<<"Recognnized semicolon\n"; return ';';}
"{" {std::cout<<"Recognized left_parantheses\n"; return '{';}
"}" {std::cout<<"Recognized right_parantheses\n"; return '}';}
"(" {std::cout<<"Recognnized round left parantheses\n"; return '(';}
")" {std::cout<<"Recognnized round right parantheses\n"; return ')';}
"," {std::cout<<"Recognnized comma\n"; return ',';}
"[" {std::cout<<"Recognnized [\n"; return '[';}
"]" {std::cout<<"Recognnized ]\n"; return ']';}
"." {std::cout<<"Recognnized .\n"; return '.';}
"*" {std::cout<<"Recognized multiplication\n"; return '*';}
"/" {std::cout<<"Recognized division\n"; return '/';}
"+" {std::cout<<"Recognized addition\n"; return '+';}
"-" {std::cout<<"Recognized substraction\n"; return '-';}
"int" {std::cout<<"Recognnized int\n"; return TYPE_INT;}
"float" {std::cout<<"Recognnized float\n"; return TYPE_FLOAT;}
"char" {std::cout<<"Recognnized char\n"; return TYPE_CHAR;}
"string" {std::cout<<"Recognnized string\n"; return TYPE_STRING;}
"bool" {std::cout<<"Recognnized bool\n"; return TYPE_BOOL;}
"start_point" {std::cout<<"Recognnized start_point\n"; return BGIN;}
"end_point" {std::cout<<"Recognnized end_point\n";return END;}
"const" {std::cout<<"Recognnized const\n"; return CONST;}
"structure" {std::cout<<"Recognized structure\n"; return STRUCTURE;}
"vec" {std::cout<<"Recognized array\n"; return ARRAY;}
"fn" {std::cout<<"Recognnized function\n"; return FUNCTION;}
":=" {std::cout<<"Recognnized assignment\n"; return ASSIGN;}
"condition" {std::cout<<"Recognnized condition\n"; return CONDITION;}
"then" {std::cout<<"Recognnized then\n"; return THEN;}
"else" {std::cout<<"Recognnized else\n"; return ELSE;}
"while" {std::cout<<"Recognnized while\n"; return WHILE;}
"loop" {std::cout<<"Recognnized loop\n"; return LOOP;}
"AND" {std::cout<<"Recognnized and\n"; return AND;}
"OR" {std::cout<<"Recognnized or\n"; return OR;}
"true" {std::cout<<"Recognnized true\n"; return BVALUE;}
"false" {std::cout<<"Recognnized false\n"; return BVALUE;}
"==" {std::cout<<"Recognnized equality\n"; return EQ;}
"<>" {std::cout<<"Recognnized non equality\n"; return NEQ;}
"<=" {std::cout<<"Recognnized lower or equal\n"; return LEQ;}
">=" {std::cout<<"Recognnized greater or equal\n"; return GEQ;}
"!" {std::cout<<"Recognnized not\n"; return NOT;}
"Eval" {std::cout<<"Recognnized eval\n"; return EVAL;}
"TypeOf" {std::cout<<"Recognnized typeof\n"; return TYPEOF;}
[0-9]+ {std::cout<<"Recognnized positive integer\n"; return POSITIVEINT;}
[-]?([0-9]*[.])?[0-9]+ {std::cout<<"Recognnized number\n"; return NR;}
[a-zA-Z][a-zA-Z0-9_]* {std::cout<<"Recognized callsign\n"; return CALLSIGN;}
[ \t] ;
\n {yylineno++;}
. {std::cout<<"Recognized character: "<<yytext<<std::endl;}
%%