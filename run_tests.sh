#!/bin/bash

for file in rules/*.guard; do
    cfn-guard test -r ${file} -t ${file%%.*}_tests.json
    if [[ $? -ne 0 ]]; then
        fail=1
    fi
done

if [[ $fail == 1 ]]; then
    exit 1
fi