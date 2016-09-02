--# -path=.:../simpleabstract

concrete VerbSimpleDot of VerbSimple = CatSimpleDot ** open ResDot in {
lin
    UseV v = v ** {compl = []} ;
    
    SlashV2a v = v ** {compl = []} ;
	
    ComplSlash vp np = {s = vp.s ; inf = vp.inf ; compl = np.s!Acc} ;
	
}