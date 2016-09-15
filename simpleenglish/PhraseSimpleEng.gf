--# -path=.:../simpleabstract

concrete PhraseSimpleEng of PhraseSimple = CatSimpleEng ** open Prelude, ResSimpleEng in {

  lin
    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;
    UttS s = s ;
    
    NoPConj = {s = []} ;

    NoVoc = {s = []} ;
    VocNP np = {s = frontComma ++ np.s ! npNom} ;

}
