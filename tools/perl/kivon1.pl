#
# ami argv[0] -ban benne van, azt listázza stdin-ből
# eredmény: stdin - arg[0]
#
my (%mhash);
open FILE, "<$ARGV[0]";
while(<FILE>){
   chomp;
   my @arr = split(/\s+/, $_);
   $mhash{$arr[0]} = 1;
}
close FILE;
while(<STDIN>){
   chomp;
   my @arr = split(/\s+/, $_);
   if(defined($mhash{$arr[0]})){
       print "$_\n";
   }
}   