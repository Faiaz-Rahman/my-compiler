
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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
     MAIN = 258,
     LP = 259,
     RP = 260,
     LB = 261,
     RB = 262,
     INT = 263,
     FLOAT = 264,
     CHAR = 265,
     SM = 266,
     CM = 267,
     VAR = 268,
     ASSIGN = 269,
     NUM = 270,
     DNUM = 271,
     IF = 272,
     ELSE = 273,
     LT = 274,
     GT = 275,
     PLUS = 276,
     MINUS = 277,
     MULT = 278,
     DIV = 279,
     FOR = 280,
     TO = 281,
     COLON = 282,
     INIT = 283,
     INIT2 = 284,
     GCD = 285,
     MAX = 286,
     MIN = 287,
     SQRT = 288,
     LCM = 289,
     PRINT = 290,
     FACTORIAL = 291,
     POWER = 292,
     PRIMECHECK = 293,
     MOD = 294,
     LTE = 295,
     GTE = 296,
     STRING = 297,
     INC = 298,
     DEC = 299
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


