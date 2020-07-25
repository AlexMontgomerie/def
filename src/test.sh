
g++ bi.cpp helper.cpp -o encoder
( ./encoder < test.txt -w 8 > test_out_0.txt ) &
( ./encoder < test.txt -w 8 > test_out_1.txt ) &
wait
