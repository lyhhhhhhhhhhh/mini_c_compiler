%{
#include "parse.tab.h"
#include "string.h"
#include "def.h"
int yycolumn=1;
#define YY_USER_ACTION    	yylloc.first_line=yylloc.last_line=yylineno; \
	yylloc.first_column=yycolumn;	yylloc.last_column=yycolumn+yyleng-1; yycolumn+=yyleng;
typedef union {
	int type_int;
	char type_char;
	float type_float;
	char type_id[32];
	struct node *ptr;
} YYLVAL;
#define YYSTYPE YYLVAL

%}
%option yylineno
%x COMMENT

ID   [A-Za-z][A-Za-z0-9]*  
INT [1-9][0-9]*|[0]
FLOAT [0-9]*[.][0-9]+([eE][-+]?([1-9][0-9*]|[0]))?
CHAR ['][^\n][']

%%
{INT} {printf("(%s, INT)\n", yytext);yylval.type_int=atoi(yytext); return INT;}
{FLOAT}  {printf("(%s, FLOAT)\n", yytext);yylval.type_float=atof(yytext); return FLOAT;}
{CHAR}   {printf("(%s, CHAR)\n", yytext);yylval.type_char=yytext[1];return CHAR;}
"int"    {printf("(%s, TYPEINT)\n", yytext);strcpy(yylval.type_id, yytext);return TYPE;}
"float"  {printf("(%s, TYPEFLOAT)\n", yytext);strcpy(yylval.type_id, yytext);return TYPE;}
"char"   {printf("(%s, TYPECHAR)\n", yytext);strcpy(yylval.type_id, yytext);return TYPE;}
"return" {printf("(%s, RETURN)\n", yytext);return RETURN;}

"if"     {printf("(%s, IF)\n", yytext);return IF;}
"else"   {printf("(%s, ELSE)\n", yytext);return ELSE;}
"while"  {printf("(%s, WHILE)\n", yytext);return WHILE;}
"break"	 {printf("(%s, BREAK)\n", yytext);return BREAK;} // break
"continue" {printf("(%s, CONTINUE)\n", yytext);return CONTINUE;} //continue

{ID}     {printf("(%s, IDENTIFIER)\n", yytext);strcpy(yylval.type_id,  yytext); return ID;}
":"		 {printf("(%s,COLON)\n",yytext);return COLON;}
";"		 {printf("(%s, SEMI)\n", yytext);return SEMI;}
","		 {printf("(%s, COMMA)\n", yytext);return COMMA;}
">"|"<"|">="|"<="|"=="|"!=" {printf("(%s, RELOP)\n", yytext);strcpy(yylval.type_id, yytext);return RELOP;}
"="		 {printf("(%s, ASSIGNOP)\n", yytext);return ASSIGNOP;}
"+"		 {printf("(%s, PLUS)\n", yytext);return PLUS;}
"-"		 {printf("(%s, MINUS)\n", yytext);return MINUS;}
"*"		 {printf("(%s, STAR)\n", yytext);return STAR;}
"/"		 {printf("(%s, DIV)\n", yytext);return DIV;}
"."      {printf("(%s, DOT)\n", yytext);return DOT;}
"%"      {printf("(%s, MOD)\n", yytext);return MOD;}
"&&"     {printf("(%s, AND)\n", yytext);return AND;}
"||"     {printf("(%s, OR)\n", yytext);return OR;}
"!"		 {printf("(%s, NOT)\n", yytext);return NOT;}
"++"     {printf("(%s, AUTOPLUS)\n", yytext); return AUTOPLUS;}//自增
"--"     {printf("(%s, AUTOMINUS)\n", yytext); return AUTOMINUS;}//自减
"("		 {printf("(%s, LP)\n", yytext);return LP;}
")"		 {printf("(%s, RP)\n", yytext);return RP;}
"{"		 {printf("(%s, LC)\n", yytext);return LC;}
"}"		 {printf("(%s, RC)\n", yytext);return RC;}
"["      {printf("(%s, LB)\n", yytext);return LB;}
"]"      {printf("(%s, RB)\n", yytext);return RB;}
[\n]     {printf("(\\n, EOL)\n");yycolumn=1;}   
[ \r\t]  {}   
.		 {printf("Error type A :Mysterious character \"%s\"\n\t at Line %d\n",yytext,yylineno);}
\/\/[^\n]*  {printf("(%s, LINECOMMENT)\n", yytext);}//匹配注释

"/*"		{BEGIN(COMMENT);}
<COMMENT>"*/" {BEGIN(INITIAL);}
<COMMENT>([^*]|\n)+|.
<COMMENT><<EOF>>	{printf("%s: %d: Unterminated comment\n", yytext, yylineno);return 0;}
%%
int yywrap()
{
    return 1;
}