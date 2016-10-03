--# -path=.:../simpleabstract

concrete SentenceSimpleDot of SentenceSimple = CatSimpleDot ** open ResDot in {
lin
	PredVP np vp = {s = \\t,a,p => let vf = (tapaToVForm t a p np.agr) in 
		np.s!Nom ++
		vp.subjpost ++ 
		case <t,a> of {
			<Present,Anter> => "ray" ; 		-- the perfect tense marker
			_ => []		
		} ++
		case p of {
			Pos => []  ;
			Neg => "vos" 
		} ++
		vp.s!vf ++ vp.compl ;
	} ;
	
	SlashVP np vpsl = {s = \\t,a,p => let vf = (tapaToVForm t a p np.agr) in 
		case <t,a> of {
			<Present,Anter> => "ray" ; 		-- the perfect tense marker
			_ => []		
		} ++
		case p of {
			Pos => []  ;
			Neg => "vos" 
		} ++
		vpsl.s!vf ;
		subj = np.s!Nom ++ vpsl.subjpost;
		objCase = vpsl.objCase
	} ;

    UseCl temp pol cl = {s = cl.s!temp.t!temp.a!pol.p} ;
    UseRCl t p cl = {
      s = cl.s ! t.t ! t.a ! p.p 
    } ;
	
}