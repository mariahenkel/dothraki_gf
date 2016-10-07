--# -path=.:../simpleabstract

concrete VerbSimpleDot of VerbSimple = CatSimpleDot ** open ResDot in {
lin
    UseV v = v ** {compl = []; subjpost = []} ;
    
    ComplVV vv vp = vp ** {subjpost = vv.s ++ vp.subjpost} ;
    
    AdvVP vp adv = vp ** {compl = vp.compl ++ adv.s} ;
    SlashV2a v = v ** {subjpost = []} ;
    
    PassV2 v = v ** {compl = []; subjpost = "nem"} ;
	
    ComplSlash vpSlash np = vpSlash ** {compl = np.s!vpSlash.objCase} ;

    CompAP ap = {s = ap.pred} ;
    CompNP np = {s = table {
    	APast _ _ => np.s!Abl ;
    	APresent _ _ => np.s!Nom ;
    	AFuture _ _ => np.s!All ;
    	
    	ImpFormal _ => [] ;     -- Currently there is no information available on 
    	ImpInformal _ => []     -- how an imperative like "Be the warrior!" would be
    	                        -- expressed in Dothraki
    }} ;
    
    UseComp comp = {s = comp.s; compl = []; inf=[]; part=[] ; subjpost = []} ;
    
	
}