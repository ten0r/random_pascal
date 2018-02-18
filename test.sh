#!/usr/bin/env bash

passed=0
failed=0
for i in $(ls tests); do
	echo "Running: ./main tests/${i}/in.txt tests/${i}/out.txt"
	./main "tests/${i}/in.txt" "tests/${i}/out.txt"
	diff "tests/${i}/out.txt" "tests/${i}/out_exp.txt"
	if [[ $? -ne 0 ]]; then
		echo -e "\nOutput differs\nTest $i failed\n";
		failed=$((failed+1));
	else
		echo -e "\nTest $i passed\n";
		passed=$((passed+1));
	fi
done

echo "Passed: ${passed}"
echo "Failed: ${failed}"
