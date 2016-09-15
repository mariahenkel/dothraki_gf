--# -path=.:../simpleabstract:prelude

concrete PhraseSimpleDot of PhraseSimple = CatSimpleDot ** open Prelude, ResDot in {
	lin
    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;
    UttS s = s ;
    
    NoPConj = {s = []} ;

    NoVoc = {s = []} ;
    VocNP np = {s = frontComma ++ np.s ! Nom} ;

}