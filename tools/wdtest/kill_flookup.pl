my $result = `ps -a | grep flookup`;
if($result eq ''){
#  print "Please start flookup using:flookup -S -A 127.0.0.1 hunadj.fst &\n";
  exit;
} else{
  my @arr = split(/\s+/, $result);
  my $tobekilled = $arr[1];
  if($arr[0] > 0){ $tobekilled = $arr[0];}
 # foreach(@arr){
 #   print "$_\n";
 # }
  $result = `kill -9 $tobekilled`;
}
