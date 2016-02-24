my @case = ('+IndefSg1',  '+IndefSg2', '+IndefSg12', '+IndefSg3',  '+IndefPl1', '+IndefPl2', '+IndefPl3','+DefSg1',  '+DefSg2',  '+DefSg3',  '+DefPl1', '+DefPl2', '+DefPl3','+ConjIndefSg1',  '+ConjIndefSg2',  '+ConjIndefSg3',  '+ConjIndefPl1', '+ConjIndefPl2', '+ConjIndefPl3','+ConjDefSg1',  '+ConjDefSg2',  '+ConjDefSg3', '+ConjDefSg12', '+ConjDefPl1', '+ConjDefPl2', '+ConjDefPl3', '+PastIndefSg1',  '+PastIndefSg2',  '+PastIndefSg3',  '+PastIndefPl1', '+PastIndefPl2', '+PastIndefPl3','+PastDefSg1',  '+PastDefSg2',  '+PastDefSg3', '+PastDefSg12', '+PastDefPl1', '+PastDefPl2', '+PastDefPl3', '+CondIndefSg1',  '+CondIndefSg2',  '+CondIndefSg3',  '+CondIndefPl1', '+CondIndefPl2', '+CondIndefPl3','+CondDefSg1',  '+CondDefSg2',  '+CondDefSg3', '+CondDefSg12', '+CondDefPl1', '+CondDefPl2', '+CondDefPl3' );

my @cond = ('+Pot');
my @rep = ('+Rep');
my @imper = ('+Imper');
my @nrep = ('+Rep');
my @inf = ('+Inf', '+Adv', '+Advan', '+Inf11','+Inf12','+Inf13','+Inf21','+Inf22','+Inf23' );
my @adv = ('+Adv', '+Advan');

my $hunspell = 0;

#gen_wd("kő");
# ábrándoz

my @szarr = ( 
'veszik'
#'dulakszik',
#'menekszik',
#'szándékszik',
#'telepszik',
#'ülepszik',
#'vastagszik',
#'vetekszik'
);


#my @szarr = ('Sztevanovity', 'támaszték');
#my @szarr = ('kapa', 'rege', 'rém', 'dob', 'ajtó', 'derék', 'hó', 'ín', 'has', 'könyv', 'nyél', 'szamár', 'szél', 'szülő');

foreach(@szarr){
   gen_wd($_);
} 
 

sub gen_wd($){
  my ($szo) = @_;
  my $out = "$szo"."+Verb";


my ($condv, $repv, $imperv, $nrepv);
if(!$hunspell){
 foreach(@rep){
   $repv = $out.$_;
   foreach(@imper){
     $imperv = $_;
     foreach(@nrep){
       $nrepv = $_;
       foreach(@cond){
         $condv = $_;
         foreach(@case){
           print "$repv$imperv$nrepv$condv$_\n";
         }
      }
    }
  }
}
} # hunspell
foreach(@rep){
  $repv =  $out.$_;
    foreach(@case){
      print "$repv$_\n";
    }
}
foreach(@rep){
  $repv =  $out.$_;
    foreach(@inf){
      print "$repv$_\n";
    }
}
foreach(@rep){
  $repv =  $out.$_;
   foreach(@imper){
     $imperv = $_;
    foreach(@case){
      print "$repv$imperv$_\n";
    }
  }
}
foreach(@rep){
  $repv =  $out.$_;
   foreach(@imper){
     $imperv = $_;
    foreach(@inf){
      print "$repv$imperv$_\n";
    }
  }
}
if(!$hunspell){
foreach(@rep){
  $repv =  $out.$_;
   foreach(@imper){
     $imperv = $_;
     foreach(@nrep){
       $nrepv = $_;
      foreach(@case){
      print "$repv$imperv$nrepv$_\n";
    }
   }
  }
}
} # hunspell
foreach(@rep){
  $repv =  $out.$_;
   foreach(@imper){
     $imperv = $_;
     foreach(@cond){
       $condv = $_;
      foreach(@case){
      print "$repv$imperv$condv$_\n";
    }
   }
  }
}
if(!$hunspell){
foreach(@imper){
  $imperv =  $out.$_;
   foreach(@nrep){
     $nrepv = $_;
     foreach(@cond){
       $condv = $_;
      foreach(@case){
      print "$imperv$nrepv$condv$_\n";
    }
   }
  }
}
} # hunspell
foreach(@imper){
  $imperv =  $out.$_;
     foreach(@cond){
       $condv = $_;
      foreach(@case){
       print "$imperv$condv$_\n";
    }
   }
}
foreach(@imper){
  $imperv =  $out.$_;
      foreach(@case){
       print "$imperv$_\n";
    }
}
foreach(@imper){
  $imperv =  $out.$_;
      foreach(@inf){
       print "$imperv$_\n";
    }
}
foreach(@imper){
  $repv =  $out.$_;
   foreach(@rep){
     $imperv = $_;
    foreach(@case){
      print "$repv$imperv$_\n";
    }
  }
}
foreach(@imper){
  $repv =  $out.$_;
   foreach(@rep){
     $imperv = $_;
    foreach(@inf){
      print "$repv$imperv$_\n";
    }
  }
}

foreach(@nrep){
  $nrepv =  $out.$_;
    foreach(@cond){
      $condv = $_;
      foreach(@case){
       print "$nrepv$condv$_\n";
    }
  }
}
foreach(@cond){
  $condv =  $out.$_;
      foreach(@case){
       print "$condv$_\n";
    }
}
foreach(@case){
  print "$out$_\n";
}
foreach(@inf){
  print "$out$_\n";
}

}
