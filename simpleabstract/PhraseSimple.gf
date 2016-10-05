abstract PhraseSimple = CatSimple ** {

  fun

    PhrUtt   : PConj -> Utt -> Voc -> Phr ; -- but come here, my friend
    UttS      : S   -> Utt ;                -- John walks
    UttQS     : QS  -> Utt ;                -- is it good
    
    NoPConj   : PConj ;                      
    PConjConj : Conj -> PConj ;             -- and

-- The vocative is optional. Any noun phrase can be made into vocative,
-- which may be overgenerating (e.g. "I").

    NoVoc   : Voc ;
    VocNP   : NP -> Voc ;                   -- my friend



}
