--# -path=.:../simpleabstract

concrete SentenceSimpleDot of SentenceSimple = CatSimpleDot ** open ResDot, Prelude in {
lin
	PredVP np vp = {s = \\t,a,p =>
		np.s!Nom
		++ vp.subjpost 
		++ verbStr vp t a p np.agr
		++ vp.compl ;
	} ;
	
    ImpVP vp = {
      s = \\pol => let vos = case pol of {Pos => [] ; Neg => "vos"} in
        table {
        	ImpF _ True => vos ++ vp.s!ImpFormal pol ++ vp.compl;
        	ImpF _ False => vos ++ vp.s!ImpInformal pol ++ vp.compl
        }
    } ;

    AdvS a s = {s = a.s ++ s.s} ;
    ExtAdvS a s = {s = a.s ++ frontComma ++ s.s} ;

	SlashVP np vpsl = {
		s = \\t,a,p => verbStr vpsl t a p np.agr ;
		subj = np.s!Nom ++ vpsl.subjpost;
		objCase = vpsl.objCase
	} ;

    UseCl temp pol cl = {s = temp.s ++ pol.s ++ cl.s!temp.t!temp.a!pol.p} ;
    UseQCl temp pol cl = {
      s = "hash" ++ temp.s ++ pol.s ++ cl.s ! temp.t ! temp.a ! pol.p
    } ;
    UseRCl t p cl = {
      s = cl.s ! t.t ! t.a ! p.p 
    } ;
	
}