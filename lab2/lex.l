/*定义部分，包含c语言的一些宏定义，如文件包含、宏名定义，以及一些变量和类型的定义和声明*/
%{
#include "parser.tab.h"
#include "string.h"
#include "def.h"
#include "stdio.h"
#define enable_display 0
int yycolumn=1;
#define YY_USER_ACTION    	yylloc.first_line=yylloc.last_line=yylineno; \
	yylloc.first_column=yycolumn;	yylloc.last_column=yycolumn+yyleng-1; yycolumn+=yyleng;
typedef union {
	int type_int;
	float type_float;
	char type_char[3];
	char type_id[32];
	struct node *ptr;
} YYLVAL;
#define YYSTYPE YYLVAL

%}
%option yylineno
%x COMMENT
/*正则式宏名的定义*/

/*通用字符名*/
UCN (\\u[0-9a-fA-F]{4}|\\U[0-9a-fA-F]{8})

ID   [A-Za-z][A-Za-z0-9]*  
INT  ([+-]?[0-9]+)|(0[xX][0-9a-fA-F]+)|(0[0-7]+)
FLOAT  ([0-9]*\.[0-9]+)|([0-9]+\.)
CHAR \'([^'\\]|\\['"?\\abfnrtv]|\\[0-7]{1,3}|\\[Xx][0-9A-Fa-f]+|{UCN})+\'

/*规则部分 正则表达式    动作*/
%%

{INT}        {if(enable_display) printf("(%s, INT)\n", yytext);yylval.type_int=strtol(yytext,NULL,0);  return INT;}
{FLOAT}  	 {if(enable_display) printf("(%s, FLOAT)\n", yytext);yylval.type_float=atof(yytext); return FLOAT;}
{CHAR}		 {if(enable_display) printf("(%s, CHAR)\n", yytext);yylval.type_char[0]=yytext[1];if(yytext[2] != '\'') {yylval.type_char[1]=yytext[2];yylval.type_char[2]='\0';} return CHAR;}


"int"        {if(enable_display) printf("(%s, TYPR-INT)\n", yytext);strcpy(yylval.type_id,  yytext);return TYPE;}
"float"      {if(enable_display) printf("(%s, TYPE-FLOAT)\n", yytext);strcpy(yylval.type_id,  yytext);return TYPE;}
"char" 		 {if(enable_display) printf("(%s, TYPE-CHAR)\n", yytext);strcpy(yylval.type_id,  yytext);return TYPE;}

"return"     {if(enable_display) printf("(%s, RETURN)\n", yytext);return RETURN;}
"if"         {if(enable_display) printf("(%s, RETURN)\n", yytext);return IF;}
"else"       {if(enable_display) printf("(%s, ELSE)\n", yytext);return ELSE;}
"while"      {if(enable_display) printf("(%s, WHILE)\n", yytext);return WHILE;}
"for" 		 {if(enable_display) printf("(%s, FOR)\n", yytext);return FOR;}
"break"		 {if(enable_display) printf("(%s, BREAK)\n", yytext);return BREAK;}
"continue"	 {if(enable_display) printf("(%s, CONTINUE)\n", yytext);return CONTINUE;}

{ID}       {if(enable_display) printf("(%s, ID)\n", yytext);strcpy(yylval.type_id,  yytext); return ID;/*由于关键字的形式也符合标识符的规则，所以把关键字的处理全部放在标识符的前面，优先识别*/}
";"			{if(enable_display) printf("(%s, SEMI)\n", yytext);return SEMI;}
","			{if(enable_display) printf("(%s, COMMA)\n", yytext);return COMMA;}
">"|"<"|">="|"<="|"=="|"!=" {if(enable_display) printf("(%s, RELOP)\n", yytext);strcpy(yylval.type_id, yytext);return RELOP;}
"="			{if(enable_display) printf("(%s, ASSIGNOP)\n", yytext);return ASSIGNOP;}
"+"			{if(enable_display) printf("(%s, PLUS)\n", yytext);return PLUS;}
"-"			{if(enable_display) printf("(%s, MINUS)\n", yytext);return MINUS;}
"*"			{if(enable_display) printf("(%s, STAR)\n", yytext);return STAR;}
"/"			{if(enable_display) printf("(%s, DIV)\n", yytext);return DIV;}
"%"			{if(enable_display) printf("(%s, MOD)\n", yytext);return MOD;}

"++" 		{if(enable_display) printf("(%s, AUTOADD)\n", yytext);return AUTOADD;}
"--" 		{if(enable_display) printf("(%s, AUTOSUB)\n", yytext);return AUTOSUB;}
"+=" 		{if(enable_display) printf("(%s, COMADD)\n", yytext);return COMADD;}
"-=" 		{if(enable_display) printf("(%s, COMSUB)\n", yytext);return COMSUB;}
"*="     	{if(enable_display) printf("(%s, COMSUB)\n", yytext);return COMSTAR;}
"/="     	{if(enable_display) printf("(%s, COMDIV)\n", yytext);return COMDIV;}
"%="     	{if(enable_display) printf("(%s, COMMOD)\n", yytext);return COMMOD;}

"&&"        {if(enable_display) printf("(%s, AND)\n", yytext);return AND;}
"||"        {if(enable_display) printf("(%s, OR)\n", yytext);return OR;}
"!"			{if(enable_display) printf("(%s, NOT)\n", yytext);return NOT;}
"("			{if(enable_display) printf("(%s, LP)\n", yytext);return LP;}
")"			{if(enable_display) printf("(%s, RP)\n", yytext);return RP;}
"[" 		{if(enable_display) printf("(%s, LB)\n", yytext);return LB;}
"]" 		{if(enable_display) printf("(%s, RB)\n", yytext);return RB;}
"{"			{if(enable_display) printf("(%s, LC)\n", yytext);return LC;}
"}"			{if(enable_display) printf("(%s, RC)\n", yytext);return RC;}

[\n]           {if(enable_display) printf("(\\n, line feed)\n");yycolumn=1;}   
[ \r\t]          {}  

"//"[^\n]*		 {if(enable_display) printf("(%s, line comment)\n", yytext);}     /*跳过单行注释*/
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {BEGIN INITIAL;}
<COMMENT>([^*]|\n)+|.     /*跳过多行注释*/
<COMMENT><<EOF>> {printf("%s：%d: Unterminated comment\n",yytext,yylineno);return 0;}
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
