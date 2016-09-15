abstract PhraseSimple = CatSimple ** {

  fun

    PhrUtt   : PConj -> Utt -> Voc -> Phr ; -- but come here, my friend
    UttS      : S   -> Utt ;                -- John walks
    
    NoPConj   : PConj ;                      

-- The vocative is optional. Any noun phrase can be made into vocative,
-- which may be overgenerating (e.g. "I").

    NoVoc   : Voc ;
    VocNP   : NP -> Voc ;                   -- my friend



}
