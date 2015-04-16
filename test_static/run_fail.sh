pass=0
tot=0

> fail_output.txt  # empty the file

for FILE in fail_*.adele
do
    echo "===========" >> fail_output.txt
    echo $FILE >> fail_output.txt
    java -cp ../lib/antlr-4.5-complete.jar:../lib/ST-4.0.8.jar:../build/ AdeleRT $FILE 2> tmp.txt

    err_line=$(grep -n err $FILE | cut -f1 -d:)  # err line number in test file
    line_detected=$(grep line tmp.txt| grep -o '[0-9][0-9]*')  # err line number reported

    if [[ -n $line_detected ]]      # if some error is detected
    then
        if [[ $err_line == $line_detected ]]
        then
            pass=$((pass+1))
        else
            echo $FILE: error mismatch
        fi
    else
        echo $FILE: failed to detect error
    fi

    cat tmp.txt >> fail_output.txt
    tot=$((tot+1))
done

echo "==========="
echo "tests passed:" $pass"/"$tot