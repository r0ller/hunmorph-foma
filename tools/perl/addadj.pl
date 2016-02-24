while(<STDIN>){
   chomp;
   my $last = substr($_,-1,1);
   if($last eq 's'){
      print "$_ AddAdjat;\n";
   } elsif('aáeéiíoóöőuúüű' =~ m/$last/){
      print "$_ AddAdji;\n";
   } else{
      print "$_ AddAdj;\n";
   }
}   