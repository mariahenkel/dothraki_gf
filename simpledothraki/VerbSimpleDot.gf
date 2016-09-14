--# -path=.:../simpleabstract

concrete VerbSimpleDot of VerbSimple = CatSimpleDot ** open ResDot in {
lin
    UseV v = v ** {compl = []} ;
    
    SlashV2a v = v ;
	
    ComplSlash vpSlash np = vpSlash ** {compl = np.s!vpSlash.objCase} ;
	
}