--# -path=.:../simpleabstract

concrete PhraseSimpleEng of PhraseSimple = CatSimpleEng ** open Prelude, ResSimpleEng in {

  lin
    PhrUtt pconj utt voc = {s = pconj.s ++ utt.s ++ voc.s} ;
    UttS s = s ;
    UttQS qs = {s = qs.s ! QDir} ;
    UttImpSg pol imp = {s = pol.s ++ imp.s ! pol.p ! ImpF Sg False} ;
    UttImpPl pol imp = {s = pol.s ++ imp.s ! pol.p ! ImpF Pl False} ;
    UttImpPol pol imp = {s = pol.s ++ imp.s ! pol.p ! ImpF Sg True} ;
    
    NoPConj = {s = []} ;
    PConjConj conj = {s = conj.s2} ; ---

    NoVoc = {s = []} ;
    VocNP np = {s = frontComma ++ np.s ! npNom} ;

}
