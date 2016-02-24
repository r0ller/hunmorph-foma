#
# Test words: foma -l hfnnum.foma
# test  with flookup:
#  kill_flookup.sh
#  /home/en/program/foma/tktest/szokincsteszt/strtfnnum.sh
#  perl /home/en/program/foma/tktest/szokincsteszt/chkwdlist.pl
#

all: hunfnnum.fst
clean: 
	rm *.fst

hunnoun.fst: enhu2.foma  lexc/noun/enhu2.lexc lexc/noun/enhuin.lexc lexc/noun/enhuing.lexc lexc/noun/enhumelytny.lexc lexc/noun/enhuoeae.lexc lexc/noun/enhuazez2.lexc lexc/noun/enhujaje.lexc lexc/noun/enhunfxpp.lexc lexc/noun/enhuoe.lexc lexc/noun/enhuazez.lexc lexc/noun/enhule.lexc lexc/noun/enhuoaae.lexc lexc/noun/enhusator.lexc lexc/noun/enhubokor.lexc lexc/noun/enhumagas.lexc lexc/noun/enhuoaeejaje.lexc lexc/noun/enhuszulo.lexc lexc/noun/enhuderek.lexc lexc/noun/enhumelyae.lexc lexc/noun/enhuoaee.lexc lexc/noun/enhuoaee2.lexc lexc/noun/enhutuz.lexc lexc/noun/enhuero.lexc lexc/noun/enhumelyjaje.lexc lexc/noun/enhuoajaje.lexc lexc/noun/enhuyi.lexc lexc/noun/enhufi.lexc lexc/noun/enhumely.lexc lexc/noun/enhuoa.lexc lexc/noun/enhufnevek.lexc lexc/noun/enhufnige.lexc lexc/noun/enhufnnum.lexc lexc/noun/enhuoamely.lexc lexc/noun/enhuho.lexc lexc/noun/enhumelymasik.lexc lexc/noun/enhuocs.lexc lexc/noun/enhucske.lexc lexc/noun/enhutalan.lexc lexc/noun/enhusag.lexc lexc/noun/enhufnspec.lexc  lexc/noun/enhuyy.lexc  lexc/noun/enhuossz3.lexc 
	foma -l enhu2.foma <savestacknoun.sh
hunverb.fst: enhuige.foma  lexc/verb/enhuige2.lexc lexc/verb/enhuigebik.lexc lexc/verb/enhuigeik.lexc lexc/verb/enhuigep.lexc lexc/verb/enhuige4ik.lexc lexc/verb/enhuigecik.lexc lexc/verb/enhuigeikszt.lexc lexc/verb/enhuigeqik.lexc lexc/verb/enhuige5ik.lexc lexc/verb/enhuigec.lexc lexc/verb/enhuigejik.lexc lexc/verb/enhuiger.lexc lexc/verb/enhuige5.lexc lexc/verb/enhuiged.lexc lexc/verb/enhuigek.lexc  lexc/verb/enhuige6.lexc lexc/verb/enhuigeeik.lexc lexc/verb/enhuige.lexc lexc/verb/enhuiges.lexc lexc/verb/enhuige7ik.lexc lexc/verb/enhuigef.lexc lexc/verb/enhuigel.lexc lexc/verb/enhuigeszt.lexc lexc/verb/enhuige7.lexc lexc/verb/enhuigefo.lexc lexc/verb/enhuigemik.lexc lexc/verb/enhuiget.lexc lexc/verb/enhuige8ik.lexc lexc/verb/enhuigegik.lexc lexc/verb/enhuigem.lexc lexc/verb/enhuigeu.lexc lexc/verb/enhuige8.lexc lexc/verb/enhuigeg.lexc lexc/verb/enhuigen.lexc lexc/verb/enhuigev.lexc lexc/verb/enhuigeaik.lexc lexc/verb/enhuigeh.lexc lexc/verb/enhuigeoik.lexc lexc/verb/enhuigea.lexc lexc/verb/enhuigeiik.lexc lexc/verb/enhuigeo.lexc
	foma -l enhuige.foma <savestackverb.sh
hunadj.fst: enhuadj2.foma  lexc/adj/enhuadj1.lexc lexc/adj/enhuadjing.lexc lexc/adj/enhuadjobb.lexc lexc/adj/enhuadja.lexc lexc/adj/enhuadjmely.lexc lexc/adj/enhuadjoe.lexc lexc/adj/enhuadjigem.lexc  lexc/adj/enhuadjlegi.lexc lexc/adj/enhuadjmnevek.lexc lexc/adj/enhuadjmnspec.lexc lexc/adj/enhuadjmnspec1.lexc lexc/adj/enhuadjsok.lexc lexc/adj/enhuadjfnmn.lexc lexc/adj/enhuadjmelyige.lexc lexc/adj/enhuadjbator.lexc lexc/adj/enhuadjmnossz.lexc
	foma -l enhuadj2.foma <savestackadj.sh
hunnum.fst:  enhunum.foma lexc/num/enhunum1.lexc lexc/num/enhunum2.lexc lexc/num/enhunum3.lexc lexc/num/enhunum4.lexc
	foma -l enhunum.foma <savestackn.sh
hunfxpp.fst: enhufxpp.foma lexc/fxpp/enhufxpp.lexc
	foma -l enhufxpp.foma <savestackfx.sh
hunmisc.fst: enhumisc.foma  lexc/misc/enhuadv1.lexc  lexc/misc/enhuadvige.lexc lexc/misc/enhucon.lexc lexc/misc/enhudet.lexc lexc/misc/enhuneg.lexc lexc/misc/enhupost.lexc lexc/misc/enhusentint.lexc lexc/misc/enhuvbpfx.lexc
	foma -l enhumisc.foma <savestackmisc.sh
hunfnnum.fst: hunnoun.fst hunverb.fst hunnum.fst hunadj.fst hunfxpp.fst hunmisc.fst
	foma -l hfnnum.foma <savestackfnnum.sh
