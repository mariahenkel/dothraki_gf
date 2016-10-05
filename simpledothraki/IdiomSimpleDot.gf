--# -path=.:../simpleabstract:prelude

concrete IdiomSimpleDot of IdiomSimple = CatSimpleDot ** open Prelude, ResDot, VerbSimpleDot, SentenceSimpleDot, ExtraDot in {

  flags optimize=all_subs ;

  lin
    ExistNP np = {s = \\t,a,p => let vf = (tapaToVForm t a p np.agr) in 
		np.s!Gen ++                         -- vekhat triggers genitive agreement in the subject!
		case <t,a> of {
			<Present,Anter> => "ray" ; 		-- the perfect tense marker
			_ => []		
		} ++
		case p of {
			Pos => []  ;
			Neg => "vos" 
		} ++
		vekhat_V.s!vf ;
	} ;
}

