--# -path=.:../simpleabstract

concrete SentenceSimpleDot of SentenceSimple = CatSimpleDot ** open ResDot in {
lin
	PredVP np vp = {s = \\t,a,p => np.s!Nom ++ vp.s!np.agr ++ vp.compl };

    UseCl temp pol cl = {s = cl.s!temp.t!temp.a!pol.p} ;
	
}