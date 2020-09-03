#!/usr/bin/env bash
a=$(pwd)
command='java Challenge'
myVar=`echo $a | sed 's/ *$//g'`
cd /home/theia
echo "Executing the test.."
:> $myVar/.testcaseop2 &&  java -classpath './json-simple-1.1.1.jar:./' Test  $myVar "$command"> $myVar/.testcaseop2
if grep -q 'error: ' $myVar/.testcaseop2; then
   echo "SYNTAXERROR"
else if grep -q 'Great job' $myVar/.testcaseop2; then
   echo "SUCCESS"
else if grep -q 'Uh-oh' $myVar/.testcaseop2; then
   echo "TESTCASEFAILED"
else
   echo "UNKNOWNERROR"
fi
fi
fi
echo ""
echo "!done!"