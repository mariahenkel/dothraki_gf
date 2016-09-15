--# -path=.:../simpleabstract

concrete VerbSimpleDot of VerbSimple = CatSimpleDot ** open ResDot in {
lin
    UseV v = v ** {compl = []} ;
    
    AdvVP vp adv = vp ** {compl = vp.compl ++ adv.s} ;
    SlashV2a v = v ;
	
    ComplSlash vpSlash np = vpSlash ** {compl = np.s!vpSlash.objCase} ;
	
}