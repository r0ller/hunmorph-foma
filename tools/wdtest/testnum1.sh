root=/home/en/program/foma/tktest1
# testfoma1 creates grammar - change $szo to the word to be checked
perl testnum1.pl > tfoman1.txt
# add shell commands to grammar
nohup sh tflstart.sh $root/hunnum.fst &
sleep 1
perl tfomaflookup.pl tfoman1.txt >/tmp/num
