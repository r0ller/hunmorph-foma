my @case = ('+Abl',  '+Acc',  '+Ade',  '+All', '+Cau', '+Dat', '+Del', '+Ela', '+Fac', '+For', '+Ill', '+Ine', '+Ins', '+Sub', '+Sup', '+Ter', '+Nom');
my @poss = ('+Posss1s', '+Posss2s', '+Posss3s', '+Possp1s', '+Possp2s', '+Possp3s', '+Posss1p', '+Posss2p', '+Posss3p', '+Possp1p', '+Possp2p', '+Possp3p');
my @gen = ('+Gens', '+Genpl');
my @pl = ('+Plur');
my @fam = ('+Fam');
my @soc = ('+Soc');
my @dis = ('+Dis');
my @tem = ('+Tem');
my @ess = ('+Ess');


#gen_wd("kő");
my @szarr = (  'derék');
# my @szarr = ( 'alapkövi', 'alapkőnyi');

my ($leg, $legesleg);
#$leg = 1;
#$legesleg = 1;

foreach(@szarr){
   gen_wd($_);
   if($leg){gen_wdleg($_);}
   if($legesleg){gen_wdlegesleg($_);}
   gen_wdik($_);
   if($leg){gen_wdlegik($_);}
   if($legesleg){gen_wdlegeslegik($_);}
} 
 

sub gen_wd($){
  my ($szo) = @_;
my $out = "$szo"."+Adj";

 gen_all($out);

$out = "$szo"."+Adj+Mid";
 gen_all($out);
}
sub gen_wdleg($){
  my ($szo) = @_;
  $szo = 'leg'.$szo;
my $out = "$szo"."+Adj+Mid";

 gen_all($out);
}
sub gen_wdlegesleg($){
  my ($szo) = @_;
  $szo = 'legesleg'.$szo;
my $out = "$szo"."+Adj+Mid";

 gen_all($out);
}

sub gen_wdik($){
  my ($szo) = @_;
#my $out = "$szo"."+Adj+Mid+Nom+Ik";
my $out = "$szo"."+Adj+Mid+Ik";

 gen_all($out);
}
sub gen_wdlegik($){
  my ($szo) = @_;
  $szo = 'leg'.$szo;
#my $out = "$szo"."+Adj+Mid+Nom+Ik";
my $out = "$szo"."+Adj+Mid+Ik";

 gen_all($out);
}
sub gen_wdlegeslegik($){
  my ($szo) = @_;
  $szo = 'legesleg'.$szo;
#my $out = "$szo"."+Adj+Mid+Nom+Ik";
my $out = "$szo"."+Adj+Mid+Ik";

 gen_all($out);
}

sub gen_all($){
 my ($out) = @_;
  do_all($out);
}
   
sub do_all($){
  my ($out) = @_;
  my ($plv, $genv, $casev, $possv, $famv);
foreach(@pl){
  $plv = $out.$_;
  foreach(@gen){
    $genv = $_;
    foreach(@case){
      print "$plv$genv$_\n";
    }
  }
}
foreach(@pl){
  $plv =  $out.$_;
    foreach(@case){
      print "$plv$_\n";
    }
}
foreach(@gen){
  $genv =  $out.$_;
    foreach(@case){
      print "$genv$_\n";
    }
}
foreach(@case){
   print "$out$_\n";
}

foreach(@poss){
  $possv =  $out.$_;
  foreach(@gen){
    $genv = $_;
    foreach(@case){
      print "$possv$genv$_\n";
    }
  }
}
foreach(@poss){
  $possv =  $out.$_;
    foreach(@case){
      print "$possv$_\n";
    }
}

foreach(@fam){
  $famv =  $out.$_;
  foreach(@gen){
    $genv = $_;
    foreach(@case){
      print "$famv$genv$_\n";
    }
  }
}
foreach(@fam){
  $famv =  $out.$_;
    foreach(@case){
      print "$famv$_\n";
    }
}

foreach(@soc){
  print "$out$_\n";
}
foreach(@dis){
  print "$out$_\n";
}
foreach(@tem){
  print "$out$_\n";
}
foreach(@ess){
  print "$out$_\n";
}
}   
    