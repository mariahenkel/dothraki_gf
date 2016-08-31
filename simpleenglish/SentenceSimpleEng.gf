concrete SentenceSimpleEng of SentenceSimple = CatSimpleEng ** open Prelude, ResSimpleEng in {

  flags optimize=all_subs ;

  lin

    PredVP np vp = mkClause (np.s ! npNom) np.a vp ;


    UseCl  t p cl = {
      s = t.s ++ p.s ++ cl.s ! t.t ! t.a ! ctr p.p ! oDir
    } ;

  oper
    ctr : CPolarity -> CPolarity = \x -> x ;
---    ctr = contrNeg True ;  -- contracted negations

}

