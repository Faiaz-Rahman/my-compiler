%{
#include<stdio.h>
#include "my.tab.h"
#include<stdlib.h>
#include<math.h>
extern int yylval;
%}

LINE .*[\n]
SINGLE_LINE_COMMENT [/][/]{LINE}
MULTI_LINE_COMMENT [/][*](([*]+[^/*])|[^*])*[*]+[/]
%%

"purno"	return (INT);
"float"	return (FLOAT);
"character"	return (CHAR);
"super" return (MAIN);
"(" return LP;
")" return RP;
"{" return LB;
"}" return RB;

";" return SM;
"," return CM;


[a-z] { yylval=*yytext-'a';
		return VAR;}
		
[0-9]+ {
		yylval=atoi(yytext);
		return NUM; 
		}
[0-9]+[.][0-9]+ {
		yylval=atof(yytext);
		return DNUM; 
		}
["][^"\n]*["]   {
return STRING;
                 
}

		
"eq" return ASSIGN;
"either" return IF;
"or" return ELSE;
"lt" return LT;
"gt" return GT;
"lt=" return LTE;
"gt=" return GTE;
"add" return PLUS;
"sub" return MINUS;
"mult" return MULT;
"div" return DIV;	

"ghurao" return FOR;
"upto" return TO;
":" return COLON;
"ini" return INIT;
"ini2" return INIT2;
"math_gcd" return GCD;
"math_lcm" return LCM;
"math_max" return MAX;
"math_min" return MIN;
"show" return PRINT;
"fact" return FACTORIAL;
"expo" return POWER;
"math_sqrt" return SQRT;
"prime_check" return PRIMECHECK;
"%" return MOD;
"ek_barao" return INC;
"komano" return DEC;



{SINGLE_LINE_COMMENT}	{printf("single line comment\n");}
{MULTI_LINE_COMMENT}	{printf("multiple line comment\n");}
%%