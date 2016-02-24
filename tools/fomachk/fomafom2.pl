#
# fomafom2.pl
# @files: This is the place of the *.lexc files, you want to check
# usage: perl fomasyn2.pl type
#   where type can be for Hungarian: verb noun adj num fxpp misc
# Licence: perl licence
#
# Version 1.00  2012 July - check lexicon types and usage
# Version 1.01  2012 August 19 added multichar_symbols test,
#   including @...@, +..+..: and +...+: type names
# Version 1.02  2012 August 24 added .o. test
#
#binmode(STDOUT, ":utf8");
my $root = "/home/en/program/foma/tktest1";
my $ekezetes="áéíóúöüőűäÁÉÍÓÚÖÜŐŰÄ:";
my $typ = $ARGV[0];
my @files = `ls  $root/*.foma`;
my ($filename, $line, $elem, $ms, $indef);
my (%lexi, %used);
my $debug = 0;
my $debug1 = 0;
if($debug){
  @files = ();
  push(@files, "$root/lexc/verb/enhuige.lexc");
}
foreach(@files) {
   %lexi = ();
   %used = ();
   $elem = '';
   $ms = 0;
   $indef = 0;
   #print "$_\n";
   $filename = $_;
   open FILE, "<$_" or die $!;
   while (<FILE>) {
      chomp;
      if($_ =~ m/^\s*\!\s*?[^;]/){
         print "file:$filename probably erroneous comment line:$_\n";
      }
      $_ =~ s/\.#\./.HASH./g;
      $_ =~ s/%#/%HASH/g;
      my  @sarr = split(/#/, $_);
      if($sarr[0] eq ''){ next;}
      my $fsor = $sarr[0];
      my @farr = split(/\s+/, $_);
      my $fas = @farr;
      if((lc($fsor) =~ m/define / and $fas > 2) or $indef){
         my @arr = split(/\s+/, $fsor);
         my $as = @arr;
         if($as){
            #
            # defined or indef line must end with ,, , .o. or ;
            #
            check_ending($fsor);
         }
         if(lc($fsor) =~ m/define / and $fas > 2){
           if(defined($arr[2])){
              $used{$arr[2]} = 1;
              #print "added $arr[2] to used\n";
           }
         } else{
          if(defined($arr[1])){
             $used{$arr[1]} = 1;
             #print "added $arr[1] to used\n";
          }
         }
            
      }
      #
      # erroneous .o.
      #
      my $do = 1;
      my $a = $fsor;
      chomp $a;
      while($do){
       my $mtch = ($a =~  m/(\W)o(\W)/);
       #print "1:'$1' 2:'$2'\n";
       my $s1 = $1;
       my $s2 = $2;
       my $o  = $&;
       my $mtch1 = ($a =~  m/(\W\W)o(\W\W)/);
       #   print "a:$a mtch:$mtch pat=$& rest:$'\n";
       if (!$mtch){$do = 0;}
       else {$a = $';}
        if($mtch and $& !~ '\[' and $o ne '.o.' and $o ne ' o '
           and $o ne '/o '){
        if (!(($ekezetes =~ $1 or $ekezetes =~ $s1) and 
             ($ekezetes =~ $2 or $ekezetes =~ $s2) )  or
           ($s1 eq '.' and $s2 ne '.') or
           ($s1 ne '.' and $s2 eq '.')  ){
         print "file:$filename probably erroneous .o. line:$fsor\n";
       }
      }
      }
      #
      # Doubly defined
      #
      if (lc($fsor) =~ m/define /){
       $ms = 0;
       if ($fsor !~ m/;/ and $fas > 2){
            $indef = 1;
            #print "indef set at line $fsor\n";
        }
        my @arr = split(/\s+/, $_);
         if(!defined($lexi{$arr[1]})){
            $lexi{$arr[1]} = 1;
            if($debug or $debug1){
                print "$filename:lexi added $arr[1]\n";
            }
         } else{
            print "file:$filename doubly defined lex $arr[1]\n"; 
         }
       #  if(defined($arr[2])){$used{$arr[2]} = 1;}
      }
      if (lc($fsor) =~ m/regex /){
         my $sor = $fsor;
         $sor =~ s/|//g;
         $sor =~ s/;//g;
         my @arr = split(/\s+/, $sor);
         foreach(@arr){
            if(!defined($used{$_})){
              $used{$_} = 1;
            }
         }
      }
     # print "itt, indef:$indef\n";
      #
      # Undefined but used definitions
      #
      if((lc($fsor) =~ m/define / and $fas > 2) or $indef){
       my $sor = $fsor;
       $sor =~ s/\\//g;
       $sor =~ s/\*//g;
       $sor =~ s/\+//g;
       $sor =~ s/;//g;
        my @arr = split(/\s+/, $sor);
        my $as = @arr;
        my $strt = 0;
        if(lc($fsor) =~ m/define /){$strt = 2;}
        for(my $i = $strt; $i < $as; $i++){
         #foreach(@arr){
           #print "elem for used:$arr[$i]\n";
            if(!defined($used{$arr[$i]})){
              $used{$arr[$i]} = 1;
            }
         }
        # print "as:$as sor:$sor\n";
         if ($as == 4){
            if(!defined($lexi{$arr[2]})){
              print "file:$filename  missing definition for $arr[2]\n"; 
            }
        } elsif($as == 2 ){
            if(!defined($lexi{$arr[1]})){
              print "file:$filename  missing definition for $arr[1]\n"; 
            }
        } elsif($as == 3 ){
            if(!defined($lexi{$arr[1]})){
              print "file:$filename  missing definition for $arr[1]\n"; 
            }
        } elsif($ $as == 1){
            if(!defined($lexi{$arr[0]})){
              print "file:$filename  missing definition for $arr[0] \n"; 
            }
        }
      }

     if($indef and $fsor =~ m/;/ ){
         $indef = 0;
       # print "indef reset at line $fsor\n";
     }

       my $sor = $_;
      # print "itt, sor:$sor fsor:$fsor\n";
        my @arr = split(/\s+/, $fsor);
        my  $sa = @arr;
        my ($elozo, $ix);
        $ix = 0;
        foreach(@arr){
          if($_ =~ m/;([^\s])/){
            if($1 ne '!'){
              print "file:$filename stray character after ; fsor:$fsor\n";
            }
          }
      }

     #  print $_; 
   }
   close FILE;
    #
    # Unused
    #
    while ( my ($key, $value) = each(%lexi) ) {
        if(!defined($used{$key})){
          #if($key ne 'Root'){
             print "file:$filename unused $key\n";
          #}
        }
    }
 
}
sub check_ending($){
   my ($fsor) = @_;
   $fsor =~ s/\s+$//; #remove trailing spaces
   my ($e1, $e2,$e3);
   $e1 = substr($fsor, -1);
   $e2 = substr($fsor, -2,2);
   $e3 = substr($fsor, -3,3);
   if($e1 ne ';' and $e2 ne ',,' and $e3 ne '.o.'){
        print "file:$filename  no ; or ,, or .o. in line $_\n";
   }
}


