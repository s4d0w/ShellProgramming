#!/bin/bash

Error() {
    echo "[ FAIL ]: 잘못된 $OP를 입력했습니다."
    exit 2
}

echo -n "Enter A: "
read A

echo -n "OP     : "
read OP

echo -n "Enter B: "
read B

case $OP in
    '+') echo "$A + $B = $(expr $A + $B)" ;;
    '-') echo "$A - $B = $(expr $A - $B)" ;;
    '*') echo "$A x $B = $(expr $A \* $B)";;
    '/') echo "$A / $B = $(expr $A / $B)" ;;
    *) Error ;;
esac
