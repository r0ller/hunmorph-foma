#
# ahol az utolsó magh i, és előtte mély, nyomtatni
# i argumenttel hívva invertál, azaz ahol nem i az utolsó
#  vagy nem mély az i előtt, azt nyomja
#
my $mh = 'aáeéiíoóuúüűöőAÁEÉIÍOÓUÚÜŰÖŐäÄ';
my $mely = 'aáoóuúAÁOÓU';
my $debug = 0;
my $inv = 0;
my $did_print = 0;
if(lc($ARGV[0]) eq 'i'){
   $inv = 1;
}
#print "$ARGV[0] $ARGV[1] $ARGV[2]\n";
while(<STDIN>){
   chomp;
   $did_print = 0;
   my @arr = split(/\s+/, $_);
   if($debug){print "szo:$arr[0]\n";}
   my @arr1 = split(//, $arr[0]);
   my $as = @arr1;
   my $j = 0;
   for(my $i = $as -1; $i >= 0; $i--){
          if($mh =~ $arr1[$i]){
              if($j ==0 or $j == 1){
                if($arr1[$i] ne 'i') {last;}
                ++$j;
              }elsif($j == 2){
                 if($mely =~ $arr1[$i]){
                    if(!$inv){print "$_\n";}
                    $did_print = 1;
                 }
                 last;
              }
              if($debug){print "mh $arr1[$i]\n";}
          }
   }
   if(!$did_print){
                    if($inv){print "$_\n";}
   }
         
}