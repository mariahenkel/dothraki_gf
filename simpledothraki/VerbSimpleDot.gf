--# -path=.:../simpleabstract

concrete VerbSimpleDot of VerbSimple = CatSimpleDot ** open ResDot in {
lin
    UseV v = v ** {compl = []; subjpost = []} ;
    
    AdvVP vp adv = vp ** {compl = vp.compl ++ adv.s} ;
    SlashV2a v = v ** {subjpost = []} ;
	
    ComplSlash vpSlash np = vpSlash ** {compl = np.s!vpSlash.objCase} ;

    CompNP np = {s = table {
    	APast _ _ => np.s!Abl ;
    	APresent _ _ => np.s!Nom ;
    	AFuture _ _ => np.s!All 
    }} ;   
    UseComp comp = {s = comp.s; compl = []; inf=[]; part=[] ; subjpost = []} ;
    
	
}