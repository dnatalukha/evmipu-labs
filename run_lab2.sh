#!/bin/bash
N_VALUES=(2000000000 3000000000 4000000000)
OPT_LEVELS=(O0 O1 O2 O3 Os Ofast Og)

for N in "${N_VALUES[@]}"; do
    echo "========================================="
    echo "N = $N"
    sed -i "s/const long long N = .*/const long long N = ${N}LL;/" lab_1.c
    
    for OPT in "${OPT_LEVELS[@]}"; do
        gcc -$OPT -o lab2_$OPT lab_1.c -lrt 2>/dev/null
        echo -n "-$OPT: "
        ./lab2_$OPT | grep "Time" | awk '{print $2}' | sort -n | head -n 1
    done
done
