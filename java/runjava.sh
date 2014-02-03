#!/usr/bin/env sh
###
##  A simple command line to run non-package java class or testcase class.
#   @Author: diligence.cs@gmail.com
#   @QQ: 86350181
#

CurDir=$(dirname $0)
CD=$(pwd)
CurDir=$CD/$CurDir
LibDir=$CurDir/lib

ClassName=${1%.*}
#echo $ClassName

Jars=$(find $LibDir -type f -name '*.jar'|tr '\n' ':')
echo $Jars

echo "\nCompiling ..."
echo "<------------ compile ------------------"
javac -cp ".:$Jars" -d . $1
errno=$?
echo "--------------------------------------->"

if [ $errno -eq 0 ]; then
echo "Compiling Succeeded !\n"
    if  [[ $ClassName == 'Test'* ]]; then
        echo "\nTesting ..."
        echo ">--------------- test ------------------"
        java -cp ".:$Jars" org.junit.runner.JUnitCore $ClassName  
        errno=$?
        echo "---------------------------------------<"
        if [ $errno -eq 1 ]; then
            echo "Edit ( Press [Enter] to continue ) ..."
            read keypress
            vim $1
        else
            echo "Testing Succeeded !\n"
        fi

    else
        echo "\nRunning ..."
        echo ">--------------- run -------------------"
        java -cp ".:$Jars" $ClassName  

        echo "---------------------------------------<"
        echo "Running Succeeded !\n"
    fi
    rm $ClassName.class
else
    echo "Edit ( Press [Enter] to continue ) ..."
    read keypress
    vim $1

fi

