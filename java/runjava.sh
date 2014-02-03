#!/usr/bin/env sh

CurDir=$(dirname $0)
CD=$(pwd)
CurDir=$CD/$CurDir
LibDir=$CurDir/lib

ClassName=${1%.*}

echo $ClassName


for jar in $(find $LibDir -type f -name '*.jar')
do
    echo $jar
done

echo "\nCompiling ..."
echo "<------------ compile ------------------"
javac -cp .:$LibDir/*.jar -d . $1
errno=$?
echo "--------------------------------------->"

if [ $errno -eq 0 ]; then

    echo "\nRunning ..."
    echo ">--------------- run -------------------"
    java -cp .:$LibDir/*.jar $ClassName  
    echo "---------------------------------------<"
    rm $ClassName.class
else
    echo "Edit ( Press [Enter] to continue ) ..."
    read keypress
    vim $1

fi

