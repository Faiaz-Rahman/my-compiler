%{
#include<stdio.h>
#include<math.h>
int yylex(void);
int sym[26],store[26];
int initial,j;
int a,b,t,d,e,f;
int c,d;
%}
%token MAIN,LP,RP,LB,RB,INT,FLOAT,CHAR,SM,CM,VAR,ASSIGN,NUM,DNUM,IF,ELSE,LT,GT,PLUS,MINUS,MULT,DIV,FOR,TO,COLON,INIT,INIT2,GCD
%token MAX,MIN,SQRT,LCM,PRINT,FACTORIAL,POWER,PRIMECHECK,MOD,LTE,GTE,STRING,INC,DEC
%nonassoc IF 
%nonassoc ELSE
%left LT GT
%left LTE GTE
%left PLUS MINUS
%left MULT DIV
%left MOD
%left INC
%left DEC

%%
program:MAIN LP RP LB cstatement RB  {printf("Successful compilation\n");}
cstatement:
		|cstatement statement
		|cdeclaration
		;
cdeclaration:TYPE ID1 SM  {printf("Valid declaration\n");}
			;
TYPE:INT
	|FLOAT
	|CHAR
	;
	

ID1:ID1 CM VAR{
				if(store[$3]==1)
				printf("%c is already declared.\n",$3+97);
				else
				store[$3]=1;
			}
	|VAR {
			if(store[$1]==1)
			printf("%c is already declared.\n",$1+97);
			else
			store[$1]=1;
		}		
	;


statement:SM
		|VAR ASSIGN expression SM {
									sym[$1]=$3;
									//printf("value of the variable = %d \n",$3);
									}
																
		|IF LP expression RP LB expression SM RB    {
														if($3)
														{
															printf("\nValue of expression in IF : %d\n",$6);
														}
														else
														{
															printf("\nCondition value is zero in IF block\n");
														}
													}
		|IF LP expression RP LB PRINT expression SM RB    {
														if($3)
														{
															printf("\nValue of expression in IF : %d\n",$7);
														}
														else
														{
															printf("\nCondition value is zero in IF block\n");
														}
													}											
													
		|IF LP expression RP LB expression SM RB ELSE LB expression SM RB
													{
														if($3)
														{
															printf("\nValue of expression in IF : %d\n",$6);
														}
														else
														{
															printf("\nValue of expression in ELSE block : %d\n", $11);
														}
													}
		|IF LP expression RP LB expression SM expression SM RB    {
														if($3)
														{
															printf("\nValue of expression in IF : %d\n",$6);
															printf("\nValue of expression in IF : %d\n",$8);
														}
														else
														{
															printf("\nCondition value is zero in IF block\n");
														}
													}
		
		|IF LP expression RP LB expression SM RB ELSE LB expression SM expression SM RB
													{
														if($3)
														{
															printf("\nValue of expression in IF : %d\n",$6);
														}
														else
														{
															printf("\nValue of expression in ELSE block : %d\n", $11);
															printf("\nValue of expression in ELSE block : %d\n", $13);
														}
													}
													
		|IF LP expression RP LB IF LP expression RP LB expression SM RB ELSE LB expression SM RB RB ELSE LB expression SM RB
													{
														if($3)
														{
														if($8){
														printf("\nValue of expression in inner IF : %d\n",$11);
														}
														else{
														printf("\nValue of expression in inner else IF : %d\n",$16);
														}
															//printf("\nValue of expression in IF : %d\n",$6);
														}
														else
														{
															printf("\nValue of expression in ELSE block : %d\n", $22);
															//printf("\nValue of expression in ELSE block : %d\n", $13);
														}
													}										
													
													
													
		|FOR LP INIT COLON NUM TO NUM RP LB expression_plus SM RB {
															for(initial=$5;initial<=$7;initial++)
															{
																//sym[$3]=initial;
																printf("%dth expression = %d\n",initial+1,$10+initial);
																//expression;
															}
													}
																				
													
		|FOR LP INIT COLON NUM TO NUM RP LB INIT SM RB {
															for(initial=$5;initial<=$7;initial++)
															{
																//sym[$3]=initial;
																printf("Value of I= %d\n",initial);
															}
													}
													
	    |FOR LP INIT COLON NUM TO NUM RP LB INIT SM FOR LP INIT2 COLON NUM TO NUM RP LB INIT2 SM RB RB {
															for(initial=$5;initial<=$7;initial++)
															{
																//sym[$3]=initial;
																printf("Value of I= %d\n",initial);
																for(j=$16;j<=$18;j++){
																printf("Value of J= %d\n",j);
																}
															}
													}											
													
		|GCD LP expression CM expression RP SM  {
													a=$3;
													b=$5;
													while(b)
													{
														a=a%b;
														t=a;
														a=b;
														b=t;
													}
													printf("MATH_GCD= %d\n",a);
													
												}
												
		|LCM LP expression CM expression RP SM  {
													a=$3;
													b=$5;
													d=a*b;
													
													while(b)
													{
														a=a%b;
														t=a;
														a=b;
														b=t;
													}
													c=d/a;
													printf("MATH_LCM= %d\n",c);
													
						}
						
						
		|MAX LP expression CM expression RP SM  {
													a=$3;
													b=$5;
													if(a>=b){
													
													printf("MAX NUMBER = %d\n",a);
												
													}
													else{
													printf("MAX NUMBER = %d\n",b);
													}
												}
												
		|MIN LP expression CM expression RP SM  {
													a=$3;
													b=$5;
													if(a<=b){
													
													printf("MIN NUMBER = %d\n",a);
												
													}
													else{
													printf("MIN NUMBER = %d\n",b);
													}
												}
        |FACTORIAL LP expression RP SM {
		                            a=$3;
									b=1;
									while(a>0){
									b=b*a;
									a=a-1;
									}
		                            printf("FACTORIAL = %d\n",b);
		
		                               }
									  
									  
		|POWER LP expression CM expression RP SM {
		                            a=$3;
									b=$5;
									d=b;
									c=1;
									while(b)
									{
									c=c*a;
									b=b-1;
									}
									printf("%d to the power %d is %d\n",a,d,c);
		                               }
	    							  
		|SQRT LP expression RP SM {
		                            a=$3;
									b=1;
									while((b*b)<=a)
									{
									b=b+1;
									}
									printf("square root is %d\n",b-1);
		                               }

		|PRIMECHECK LP expression RP SM {
		                            a=$3;
									b=1;
									while((b*b)<=a)
									{
									b=b+1;
									}
									b=b-1;
									c=0;
									for(initial=1;initial<=b;initial++){
									if(a%initial==0){
									d=initial;
									e=a/initial;
									if(d==e){c=c+1;}
									else{c=c+2;}
									}
									}
									if(c==2){printf("%d is prime\n",a);}
									else{printf("%d is not prime\n",a);}
		                               }

		|PRINT expression   {
								printf("Value of the expression= %d\n",$2);
							}
												
																															
												
		;
		
expression:|NUM
        |STRING
        |DNUM
		|VAR		{$$=sym[$1];}
		|INIT      {$$=sym[$1];}
		|INIT2      {$$=sym[$1];}
		|expression PLUS expression		{$$=$1+$3;}
		|expression MINUS expression	{$$=$1-$3;}
		|expression MULT expression		{$$=$1*$3;}
		|expression DIV expression  {
										if($3)
												{
													$$=$1/$3;
												}
												else
												{
													$$=0;
													printf("\nDivision by zero is not possible\n");
												}
									}
		|expression MOD expression	{
												if($3)
												{
													$$ = $1 % $3;
												}
												else
												{
													$$ = 0;
													printf("\nmod error\n");
												}
											}
		
		|expression GTE expression	{ $$ = $1 >= $3;}
		|expression LTE expression	{ $$ = $1 <= $3;}
		|expression INC				{ $$+= 1; printf("increment: %d\n",$$);} 
		|expression DEC				{ $$+= 1; printf("decrement: %d\n",$$);}							
									
									
		|expression LT expression		{$$=$1<$3;}
		|expression GT expression	{$$=$1>$3;}
		|LP expression RP		{$$=$2;}
		;
expression_plus:NUM
				|VAR  {$$=sym[$1];}
				|INIT  {$$=sym[$1];}
				|INIT2  {$$=sym[$1];}
				|expression PLUS expression  {$$=$1+$3;}

%%

int yywrap()
{
	return 1;
}
int yyerror(char *s)
{
	fprintf(stderr,"%s\n",s);
}
int main()
{
	freopen("b.txt","r",stdin);
	yyparse();
}