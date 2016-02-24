type make >/tmp/xyzabc
a=`grep / /tmp/xyzabc`
if [ "$a" != "" ];
then
  echo "Make seems to be installed"
else
  echo "Make seems not to be installed"
fi
type foma >/tmp/xyzabc
a=`grep / /tmp/xyzabc`
if [ "$a" != "" ];
then
  echo "Foma seems to be installed"
else
  echo "Foma seems not to be installed"
fi
