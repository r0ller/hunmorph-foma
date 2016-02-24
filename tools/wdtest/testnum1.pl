my @case = ('+Abl',  '+Acc',  '+Ade',  '+All', '+Cau', '+Dat', '+Del', '+Ela', '+Fac', '+For', '+Ill', '+Ine', '+Ins',  '+Nom', '+Sub', '+Sup', '+Ter');
my @poss = ('+Posss1s', '+Posss2s', '+Posss3s', '+Possp1s', '+Possp2s', '+Possp3s', '+Posss1p', '+Posss2p', '+Posss3p', '+Possp1p', '+Possp2p', '+Possp3p');
my @gen = ('+Gens', '+Genpl');
my @pl = ('+Plur');
my @fam = ('+Fam');
my @soc = ('+Soc');
my @dis = ('+Dis');
my @tem = ('+Tem');
my @ess = ('+Ess');
my @par = ('+Par', '+Par+Tmp', '+Par+Ik', '+Par+Tmp+Sub', '+Par+Tmp+Iadj', '+Par+Tmp+Kas');
my @tmp = ('+Tmp', '+Tmp+Sub', '+Tmp+Iadj', '+Tmp+Kas');


#gen_wd("kő");
my @szarr = (  'kettő');
#my @szarr = ('Sztevanovity', 'támaszték');

foreach(@szarr){
   gen_wd($_);
} 
 

sub gen_wd($){
  my ($szo) = @_;
my $out = "$szo"."+Num";


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
foreach(@par){
  print "$out$_\n";
}
foreach(@tmp){
  print "$out$_\n";
}

}
      
    