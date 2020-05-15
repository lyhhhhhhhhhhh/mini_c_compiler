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
     STRING = 262,
     RELOP = 263,
     TYPE = 264,
     FLOAT = 265,
     RETURN = 266,
     FOR = 267,
     SWITCH = 268,
     CASE = 269,
     COLON = 270,
     DEFAULT = 271,
     CASE_STMT = 272,
     CASE_STMT_LIST = 273,
     DEFAULT_STMT = 274,
     FOR_DEC = 275,
     FOR_EXP1 = 276,
     FOR_EXP2 = 277,
     FOR_EXP3 = 278,
     DPLUS = 279,
     LP = 280,
     RP = 281,
     LC = 282,
     RC = 283,
     LB = 284,
     RB = 285,
     SEMI = 286,
     COMMA = 287,
     DOT = 288,
     PLUS = 289,
     MINUS = 290,
     STAR = 291,
     DIV = 292,
     MOD = 293,
     ASSIGNOP = 294,
     AND = 295,
     OR = 296,
     NOT = 297,
     AUTOPLUS = 298,
     AUTOMINUS = 299,
     IF = 300,
     ELSE = 301,
     WHILE = 302,
     BREAK = 303,
     CONTINUE = 304,
     EXT_DEF_LIST = 305,
     EXT_VAR_DEF = 306,
     FUNC_DEF = 307,
     FUNC_DEC = 308,
     EXT_DEC_LIST = 309,
     PARAM_LIST = 310,
     PARAM_DEC = 311,
     VAR_DEF = 312,
     DEC_LIST = 313,
     DEF_LIST = 314,
     COMP_STM = 315,
     STM_LIST = 316,
     EXP_STMT = 317,
     IF_THEN = 318,
     IF_THEN_ELSE = 319,
     FUNC_CALL = 320,
     ARGS = 321,
     FUNCTION = 322,
     PARAM = 323,
     ARG = 324,
     CALL = 325,
     LABEL = 326,
     GOTO = 327,
     JLT = 328,
     JLE = 329,
     JGT = 330,
     JGE = 331,
     EQ = 332,
     NEQ = 333,
     ARRAY_LIST = 334,
     DMINUS = 335,
     UMINUS = 336,
     LOWER_THEN_ELSE = 337
   };
#endif
/* Tokens.  */
#define CHAR 258
#define INT 259
#define ID 260
#define ERRORID 261
#define STRING 262
#define RELOP 263
#define TYPE 264
#define FLOAT 265
#define RETURN 266
#define FOR 267
#define SWITCH 268
#define CASE 269
#define COLON 270
#define DEFAULT 271
#define CASE_STMT 272
#define CASE_STMT_LIST 273
#define DEFAULT_STMT 274
#define FOR_DEC 275
#define FOR_EXP1 276
#define FOR_EXP2 277
#define FOR_EXP3 278
#define DPLUS 279
#define LP 280
#define RP 281
#define LC 282
#define RC 283
#define LB 284
#define RB 285
#define SEMI 286
#define COMMA 287
#define DOT 288
#define PLUS 289
#define MINUS 290
#define STAR 291
#define DIV 292
#define MOD 293
#define ASSIGNOP 294
#define AND 295
#define OR 296
#define NOT 297
#define AUTOPLUS 298
#define AUTOMINUS 299
#define IF 300
#define ELSE 301
#define WHILE 302
#define BREAK 303
#define CONTINUE 304
#define EXT_DEF_LIST 305
#define EXT_VAR_DEF 306
#define FUNC_DEF 307
#define FUNC_DEC 308
#define EXT_DEC_LIST 309
#define PARAM_LIST 310
#define PARAM_DEC 311
#define VAR_DEF 312
#define DEC_LIST 313
#define DEF_LIST 314
#define COMP_STM 315
#define STM_LIST 316
#define EXP_STMT 317
#define IF_THEN 318
#define IF_THEN_ELSE 319
#define FUNC_CALL 320
#define ARGS 321
#define FUNCTION 322
#define PARAM 323
#define ARG 324
#define CALL 325
#define LABEL 326
#define GOTO 327
#define JLT 328
#define JLE 329
#define JGT 330
#define JGE 331
#define EQ 332
#define NEQ 333
#define ARRAY_LIST 334
#define DMINUS 335
#define UMINUS 336
#define LOWER_THEN_ELSE 337




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
#line 221 "parse.tab.h"
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
