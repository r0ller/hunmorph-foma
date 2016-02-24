root=/home/en/program/foma/tktest1
echo noun test start
# testfoma1 creates grammar - change $szo to the word to be checked
perl testnoun1.pl > tnoun1.txt
# add shell commands to grammar
echo  $root/hunnoun.fst
nohup sh tflstart.sh $root/hunnoun.fst &
sleep 1
perl tfomaflookup.pl tnoun1.txt >/tmp/noun
echo noun test finished
