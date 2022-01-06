make clean
make -j64

rm -f /scratch0/kvell/*

./main 1 8 | tee log_ycsb_1

./scripts/parse.pl log_ycsb_1
