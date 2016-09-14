--# -path=.:../simpleabstract

concrete SentenceSimpleDot of SentenceSimple = CatSimpleDot ** open ResDot in {
lin
	PredVP np vp = {s = table {
		Pres => \\_ => table {
			Pos => np.s!Nom ++ vp.s!(APresent Pos (agrToVFormPN np.agr)) ++ vp.compl ;
			Neg => np.s!Nom ++ "vos" ++ vp.s!(APresent Neg (agrToVFormPN np.agr)) ++ vp.compl
		} ;
		Past => \\_ => table {
			Pos => np.s!Nom ++ vp.s!(APast Pos (extrNum np.agr)) ++ vp.compl ;
			Neg => np.s!Nom ++ "vos" ++ vp.s!(APast Neg (extrNum np.agr)) ++ vp.compl 
		} ;
		Fut => \\_ => table {
			Pos => np.s!Nom ++ vp.s!(AFuture Pos (agrToVFormPN np.agr)) ++ vp.compl ;
			Neg => np.s!Nom ++ "vos" ++ vp.s!(AFuture Neg (agrToVFormPN np.agr)) ++ vp.compl
		} ;
		Cond => \\a,p => []
	}
	} ;

    UseCl temp pol cl = {s = cl.s!temp.t!temp.a!pol.p} ;
	
}