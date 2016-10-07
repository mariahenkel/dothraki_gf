--# -path=.:../simpleabstract:prelude

concrete IdiomSimpleDot of IdiomSimple = CatSimpleDot ** open Prelude, ResDot, VerbSimpleDot, SentenceSimpleDot, ExtraDot in {

  flags optimize=all_subs ;

  lin
    ExistNP np = {s = \\t,a,p => 
		np.s!Gen                         -- vekhat triggers genitive agreement in the subject!
		++ (verbStr vekhat_V t a p np.agr)
	} ;
}

