abstract PhraseSimple = CatSimple ** {

  fun

    PhrUtt   : PConj -> Utt -> Voc -> Phr ; -- but come here, my friend
    UttS      : S   -> Utt ;                -- John walks
    UttQS     : QS  -> Utt ;                -- is it good
    UttImpSg  : Pol -> Imp -> Utt;          -- (don't) love yourself
    UttImpPl  : Pol -> Imp -> Utt;          -- (don't) love yourselves
    UttImpPol : Pol -> Imp -> Utt ;         -- (don't) sleep (polite)
    
    NoPConj   : PConj ;                      
    PConjConj : Conj -> PConj ;             -- and

-- The vocative is optional. Any noun phrase can be made into vocative,
-- which may be overgenerating (e.g. "I").

    NoVoc   : Voc ;
    VocNP   : NP -> Voc ;                   -- my friend



}
