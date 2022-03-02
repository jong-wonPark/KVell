#!/bin/sh

make clean
make -j64

for threads in 8 
do
	rm -f /scratch0/kvell/*
	./main 1 $threads | tee log_ycsb_t$threads
done

for threads in 8
do
        ./scripts/parse.pl log_ycsb_t$threads
done


:<<"END"
rm -f /scratch0/kvell/*

./main 1 8 | tee log_ycsb_1
#./main 1 1

./scripts/parse.pl log_ycsb_1
END
