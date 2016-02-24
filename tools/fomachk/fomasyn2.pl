#
# fomasyn2.pl
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
my @files = `ls  $root/lexc/$typ/*.lexc`;
my ($filename, $line, $elem, $ms, $inlex);
my (%lexi, %used, %ms);
my $debug = 0;
my $debug1 = 0;
if($debug){
  @files = ();
  push(@files, "$root/lexc/verb/enhuige.lexc");
}
foreach(@files) {
   %lexi = ();
   %used = ();
   %ms = ();
   $elem = '';
   $ms = 0;
   $inlex = 0;
   #print "$_\n";
   $filename = $_;
   open FILE, "<$_" or die $!;
   while (<FILE>) {
      if($_ =~ m/^\s*\#\s*?[^;]/){
         print "file:$filename probably erroneous comment line:$_\n";
      }
      my  @sarr = split(/!/, $_);
      if($sarr[0] eq ''){ next;}
      my $fsor = $sarr[0];
      if($inlex){
         my @arr = split(/\s+/, $_);
         my $as = @arr;
         if($as){
            if($_ !~ m/;/ and lc($_) !~ m/lexicon/ ){
              print "file:$filename  no ; in line $_\n";
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
       my $mtch1 = ($a =~  m/(\W\W)o(\W\W)/);
       #   print "a:$a mtch:$mtch pat=$& rest:$'\n";
       if (!$mtch){$do = 0;}
       else {$a = $';}
       if($mtch and $& ne '.o.'){
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
      if (lc($fsor) =~ m/lexicon /){
       $ms = 0;
       $inlex = 1;
        my @arr = split(/\s+/, $_);
         if(!defined($lexi{$arr[1]})){
            $lexi{$arr[1]} = 1;
            if($debug or $debug1){
                print "$filename:lexi added $arr[1]\n";
            }
         } else{
            print "file:$filename doubly defined lex $arr[1]\n"; 
         }
      }
      if ($fsor =~ m/;/){
       my $mpat =$fsor;
       $mpat = $fsor;
       while($mpat =~ m/^\+(\w+)\+:/){
         my  $seg = "+".$1."+";
         if(!defined($ms{$seg})){
           print "file:$filename Undefined Multichar_symbol:$seg\n";
         } else{
            $ms{$seg} = 2;
         }
         my $ompat = $mpat;
         $mpat = $';
        # print "old mpat:$ompat mpat=$mpat\n";
        }
       while($mpat =~ m/^\+(\w+):/){
         my  $seg = "+".$1;
         if(!defined($ms{$seg})){
           print "file:$filename Undefined Multichar_symbol:$seg\n";
         } else{
            $ms{$seg} = 2;
         }
         my $ompat = $mpat;
         $mpat = $';
        # print "old mpat:$ompat mpat=$mpat\n";
        }
       $mpat = $fsor;
       while($mpat =~ m/^\+(\w+)\+(\w+):/){
         my  $seg = "+".$1;
         if(!defined($ms{$seg})){
           print "file:$filename Undefined Multichar_symbol:$seg\n";
         } else{
            $ms{$seg} = 2;
         }
         my  $seg = "+".$2;
         if(!defined($ms{$seg})){
           print "file:$filename Undefined Multichar_symbol:$seg\n";
         } else{
            $ms{$seg} = 2;
         }
         my $ompat = $mpat;
         $mpat = $';
        # print "old mpat:$ompat mpat=$mpat\n";
        }
       $mpat = $fsor;
       while($mpat =~ m/§(\w+)§/){
         my  $seg = '§'.$1.'§';
         if(!defined($ms{$seg})){
           print "file:$filename Undefined Multichar_symbol:$seg\n";
         } else{
            $ms{$seg} = 2;
         }
         my $ompat = $mpat;
         $mpat = $';
        # print "old mpat:$ompat mpat=$mpat\n";
        }
        $mpat = $fsor;
       while($mpat =~ m/@([\w|\.]+)@/){
        if($1 ne ''){
           my  $seg = '@'.$1.'@';
           if(!defined($ms{$seg})){
             print "file:$filename Undefined Multichar_symbol:$seg\n";
           } else{
              $ms{$seg} = 2;
           }
         }
         my $ompat = $mpat;
         $mpat = $';
        # print "old mpat:$ompat mpat=$mpat\n";
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
          if ($_ =~ m/;/){
         #
         # stray character after ;
         #
          if($ix ne $sa -1){
            print "file:$filename ix:$ix sa:$sa possible error in ; setup: $fsor\n"; 
         }
            $elem = substr($_,0, length($_)-1);
           if($debug > 2 ){
              print "ael:'$elem' elozo:$elozo\n";
            }
            if($elem eq ''){
               $elem = $elozo;
            }
         }
         if($elem ne '' and !defined($used{$elem})){
            $used{$elem} = 1;
            if($debug or $debug1){
               print "$filename: used added elem:'$elem' sor:$sor\n";
            }
         } 
         $elozo = $_;
         ++$ix;
        } # foreach arr
      } #match
      if (lc($fsor) =~ m/multichar_symbols / or $ms){
         $ms = 1;
         $inlex = 0;
         my @arr = split(/\s+/, $fsor);
         foreach(@arr){
           if($_ ne '' and lc($_) ne "multichar_symbols"){
            if(defined($ms{$_})){
               print "$filename: multiply defined multichar symbol:'$_' \n";
            } else {
             $ms{$_} = 1;
            }
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
          if($key ne 'Root'){
             print "file:$filename unused $key\n";
          }
        }
    }
    #
    # Undefined
    #
    while ( my ($key, $value) = each(%used) ) {
        if(!defined($lexi{$key})){
          if($key ne '#'){
             print "file:$filename undefined $key\n";
          }
        }
    }
    while ( my ($key, $value) = each(%ms) ) {
        if($value != 2){
            # comment out below, if too many unexplainable errors
             print "file:$filename unused $key\n";
        }
    }
 
}



