# Intro

This is a very simple compiler for a custom language using Flex and Bison tools and C programming language.

## Functions
This compiler detects loops when it gets specific keywords as **ghurao**, to find the mathematical GCD and LCM it uses **math_gcd** or, **math_lcm** respectively. To find exponential value it uses **expo**. **ek_barao** implies incrementing by one and **komano** implies decrement. Check the **my.l** file for better understanding. 

The file to compile : **b.txt**

The code for parser is generated in yacc file which is **my.y**

### Underlying work
First we run flex, which translates the scanner into a C program called lex.yy.c, then we compiler the C program, and finally we run it.

```bash
flex my.l
gcc lex.yy.c -lfl
./a.out
``` 
