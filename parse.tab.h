/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CHAR = 258,
     INT = 259,
     ID = 260,
     ERRORID = 261,
     RELOP = 262,
     TYPE = 263,
     FLOAT = 264,
     RETURN = 265,
     FOR = 266,
     SWITCH = 267,
     CASE = 268,
     COLON = 269,
     DEFAULT = 270,
     CASE_STMT = 271,
     CASE_STMT_LIST = 272,
     DEFAULT_STMT = 273,
     FOR_DEC = 274,
     FOR_EXP1 = 275,
     FOR_EXP2 = 276,
     FOR_EXP3 = 277,
     DPLUS = 278,
     LP = 279,
     RP = 280,
     LC = 281,
     RC = 282,
     LB = 283,
     RB = 284,
     SEMI = 285,
     COMMA = 286,
     DOT = 287,
     PLUS = 288,
     MINUS = 289,
     STAR = 290,
     DIV = 291,
     MOD = 292,
     ASSIGNOP = 293,
     AND = 294,
     OR = 295,
     NOT = 296,
     AUTOPLUS = 297,
     AUTOMINUS = 298,
     IF = 299,
     ELSE = 300,
     WHILE = 301,
     BREAK = 302,
     CONTINUE = 303,
     EXT_DEF_LIST = 304,
     EXT_VAR_DEF = 305,
     FUNC_DEF = 306,
     FUNC_DEC = 307,
     EXT_DEC_LIST = 308,
     PARAM_LIST = 309,
     PARAM_DEC = 310,
     VAR_DEF = 311,
     DEC_LIST = 312,
     DEF_LIST = 313,
     COMP_STM = 314,
     STM_LIST = 315,
     EXP_STMT = 316,
     IF_THEN = 317,
     IF_THEN_ELSE = 318,
     FUNC_CALL = 319,
     ARGS = 320,
     FUNCTION = 321,
     PARAM = 322,
     ARG = 323,
     CALL = 324,
     LABEL = 325,
     GOTO = 326,
     JLT = 327,
     JLE = 328,
     JGT = 329,
     JGE = 330,
     EQ = 331,
     NEQ = 332,
     ARRAY_LIST = 333,
     DMINUS = 334,
     UMINUS = 335,
     LOWER_THEN_ELSE = 336
   };
#endif
/* Tokens.  */
#define CHAR 258
#define INT 259
#define ID 260
#define ERRORID 261
#define RELOP 262
#define TYPE 263
#define FLOAT 264
#define RETURN 265
#define FOR 266
#define SWITCH 267
#define CASE 268
#define COLON 269
#define DEFAULT 270
#define CASE_STMT 271
#define CASE_STMT_LIST 272
#define DEFAULT_STMT 273
#define FOR_DEC 274
#define FOR_EXP1 275
#define FOR_EXP2 276
#define FOR_EXP3 277
#define DPLUS 278
#define LP 279
#define RP 280
#define LC 281
#define RC 282
#define LB 283
#define RB 284
#define SEMI 285
#define COMMA 286
#define DOT 287
#define PLUS 288
#define MINUS 289
#define STAR 290
#define DIV 291
#define MOD 292
#define ASSIGNOP 293
#define AND 294
#define OR 295
#define NOT 296
#define AUTOPLUS 297
#define AUTOMINUS 298
#define IF 299
#define ELSE 300
#define WHILE 301
#define BREAK 302
#define CONTINUE 303
#define EXT_DEF_LIST 304
#define EXT_VAR_DEF 305
#define FUNC_DEF 306
#define FUNC_DEC 307
#define EXT_DEC_LIST 308
#define PARAM_LIST 309
#define PARAM_DEC 310
#define VAR_DEF 311
#define DEC_LIST 312
#define DEF_LIST 313
#define COMP_STM 314
#define STM_LIST 315
#define EXP_STMT 316
#define IF_THEN 317
#define IF_THEN_ELSE 318
#define FUNC_CALL 319
#define ARGS 320
#define FUNCTION 321
#define PARAM 322
#define ARG 323
#define CALL 324
#define LABEL 325
#define GOTO 326
#define JLT 327
#define JLE 328
#define JGT 329
#define JGE 330
#define EQ 331
#define NEQ 332
#define ARRAY_LIST 333
#define DMINUS 334
#define UMINUS 335
#define LOWER_THEN_ELSE 336




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 20 "parse.y"
{
	int    type_int;
        char   type_char;
	float  type_float;
	char   type_id[32];
	struct ASTNode *ptr;
}
/* Line 1529 of yacc.c.  */
#line 219 "parse.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
} YYLTYPE;
# define yyltype YYLTYPE /* obsolescent; will be withdrawn */
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif

extern YYLTYPE yylloc;
