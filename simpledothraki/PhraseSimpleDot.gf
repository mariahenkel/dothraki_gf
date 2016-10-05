--# -path=.:../simpleabstract:prelude

concrete PhraseSimpleDot of PhraseSimple = CatSimpleDot ** open Prelude, ResDot in {
	lin
    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;
    UttS s = s ;
    UttQS s = s ;
    
    NoPConj = {s = []} ;
    PConjConj conj = {s = conj.p} ;
    
    
    NoVoc = {s = []} ;
    VocNP np = {s = frontComma ++ "zhey" ++ np.s ! Nom} ;

}