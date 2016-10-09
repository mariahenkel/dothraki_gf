--# -path=.:../simpleabstract:prelude

concrete PhraseSimpleDot of PhraseSimple = CatSimpleDot ** open Prelude, ResDot in {
	lin
    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;
    UttS s = s ;
    UttQS s = s ;

    UttImpSg pol imp = {s = pol.s ++ imp.s ! pol.p ! ImpF Sg False} ;
    UttImpPl pol imp = {s = pol.s ++ imp.s ! pol.p ! ImpF Pl False} ;
    UttImpPol pol imp = {s = pol.s ++ imp.s ! pol.p ! ImpF Sg True} ;

    UttNP np = {s = np.s ! Nom} ;
    UttAdv adv = adv ;
    UttCN n = {s = n.s ! Sg ! Nom} ;
    UttAP ap = {s = ap.s ! Sg ! ANom} ;
    
    NoPConj = {s = []} ;
    PConjConj conj = {s = conj.p} ;
    
    
    NoVoc = {s = []} ;
    VocNP np = {s = frontComma ++ "zhey" ++ np.s ! Nom} ;

}