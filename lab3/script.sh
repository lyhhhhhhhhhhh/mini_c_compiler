#! /bin/zsh

flex lex.l
if [ $? -eq 0 ]
then
    echo "FLEX success"
fi

bison -d -v parser.y
if [ $? -eq 0 ]
then
    echo "BISON success"
fi

gcc -o parser lex.yy.c parser.tab.c ast.c semantic_analysis.c -w
if [ $? -eq 0 ]
then
    echo "GCC success"
fi

echo "------------------------------- Result -------------------------------"
./parser test2.c