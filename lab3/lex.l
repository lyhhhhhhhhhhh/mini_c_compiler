%{
#include "parser.tab.h"
#include "string.h"
#include "def.h"
int yycolumn=1;
#define YY_USER_ACTION    	yylloc.first_line=yylloc.last_line=yylineno; \
	yylloc.first_column=yycolumn;	yylloc.last_column=yycolumn+yyleng-1; yycolumn+=yyleng;
typedef union {
	int type_int;
	int type_float;
	char type_char;
	char type_id[32];
	struct node *ptr;
} YYLVAL;
#define YYSTYPE YYLVAL

%}
%option yylineno

id   [A-Za-z][A-Za-z0-9]*  
int [1-9]+[0-9]*|0
float  ([0-9]*\.[0-9]+)|([0-9]+\.)
char  .
Hex 0x[0-9a-fA-F]+
Oct 0[0-7]+

%%
{int}        {yylval.type_int=atoi(yytext); return INT;}
{float}      {yylval.type_float=atof(yytext); return FLOAT;}
"'"{char}"'"       {yylval.type_char=yytext[1]; return CHAR;} 
"int"        {strcpy(yylval.type_id,  yytext);return TYPE;}
"float"      {strcpy(yylval.type_id,  yytext);return TYPE;}
"char"       {strcpy(yylval.type_id,  yytext);return TYPE;}
{Hex}        {yylval.type_int=strtol(yytext,NULL,16); return INT;}
{Oct}        {yylval.type_int=strtol(yytext,NULL,8); return INT;}



"return"     {return RETURN;}
"if"         {return IF;}
"else"       {return ELSE;}
"while"      {return WHILE;}

{id}       {strcpy(yylval.type_id,  yytext); return ID;/*由于关键字的形式也符合表示符的规则，所以把关键字的处理全部放在标识符的前面，优先识别*/}
";"			{return SEMI;}
","			{return COMMA;}
">"|"<"|">="|"<="|"=="|"!=" {strcpy(yylval.type_id, yytext);;return RELOP;}
"="			{return ASSIGNOP;}
"+"			{return PLUS;}
"-"			{return MINUS;}
"*"			{return STAR;}
"/"			{return DIV;}
"&&"         {return AND;}
"||"            {return OR;}
"!"			{return NOT;}
"("			{return LP;}
")"			{return RP;}
"{"			{return LC;}
"}"			{return RC;}
"++"        {return PP;}
"--"        {return MM;}
"+="        {return PA;}
"-="        {return MA;}


[\n]           {yycolumn=1;}   
[ \r\t]          {}   
"//".*  {}
"/*"(.|\n)*"*/" {}
.			{printf("Error type A :Mysterious character \"%s\"\n\t at Line %d\n",yytext,yylineno);}
%%

/* 和bison联用时，不需要这部分
void main()
{
yylex();
return 0;
}

*/
int yywrap()
{
return 1;
}
