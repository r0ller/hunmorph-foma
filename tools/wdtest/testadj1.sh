root=/home/en/program/foma/tktest1
# create hun41.fst using foma
echo testadj start
# testfoma1 creates grammar - change $szo to the word to be checked
perl testadj1.pl > tfomaadj21.txt
# add shell commands to grammar
nohup sh tflstart.sh $root/hunadj.fst &
sleep 1
perl tfomaflookup.pl tfomaadj21.txt >/tmp/adj
echo testadj finished
