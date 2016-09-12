--# -path=.:../simpleabstract

concrete SentenceSimpleDot of SentenceSimple = CatSimpleDot ** open ResDot in {
lin
	PredVP np vp = {s = table {
		Pres => \\_ => table {
			Pos => np.s!Nom ++ vp.s!(APresent Pos np.agr) ++ vp.compl ;
			Neg => np.s!Nom ++ "vos" ++ vp.s!(APresent Neg np.agr) ++ vp.compl
		} ;
		Past => \\_ => table {
			Pos => np.s!Nom ++ vp.s!(APast Pos Sg) ++ vp.compl ;
			Neg => np.s!Nom ++ "vos" ++ vp.s!(APast Neg Sg) ++ vp.compl 
		} ;
		Fut => \\_ => table {
			Pos => np.s!Nom ++ vp.s!(AFuture Pos np.agr) ++ vp.compl ;
			Neg => np.s!Nom ++ "vos" ++ vp.s!(AFuture Neg np.agr) ++ vp.compl
		} ;
		Cond => \\a,p => []
	}
	} ;

    UseCl temp pol cl = {s = cl.s!temp.t!temp.a!pol.p} ;
	
}