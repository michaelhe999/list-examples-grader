CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

FILE=/Users/michaelhe/Documents/GitHub/list-examples-grader/student-submission/ListExamples.java
if test -f "$FILE"; then
    echo "$FILE exists."
else 
    echo "wrong file"
    exit
fi

cp -r student-submission/ListExamples.java GradeServer.java Server.java TestListExamples.java grading-area
rm student-submission/ListExamples.java

set +e

cd grading-area/
javac -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar *.java
java -cp .:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples &> errors.txt


NUMBER=$(grep "Tests run:" errors.txt | grep -o -E '[0-9]+') ; 
echo $NUMBER

# echo $(((${newarr[0]}-${newarr[1]})*100/${newarr[0]}))%
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
