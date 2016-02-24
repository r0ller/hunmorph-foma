root=/home/en/program/foma/tktest1
echo verb test start
# testfoma1 creates grammar - change $szo to the word to be checked
perl testverb1.pl > tverb1.txt
# add shell commands to grammar
nohup sh tflstart.sh  $root/hunverb.fst &
sleep 1
perl tfomaflookup.pl tverb1.txt >/tmp/verb
echo verb test finished
