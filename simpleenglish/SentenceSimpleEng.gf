--# -path=.:../simpleabstract

concrete SentenceSimpleEng of SentenceSimple = CatSimpleEng ** open Prelude, ResSimpleEng in {

  flags optimize=all_subs ;

  lin

    PredVP np vp = mkClause (np.s ! npNom) np.a vp ;

    SlashVP np vp = 
      mkClause (np.s ! npNom) np.a vp ** {c2 = vp.c2} ;

    UseCl  t p cl = {
      s = t.s ++ p.s ++ cl.s ! t.t ! t.a ! ctr p.p ! oDir
    } ;
    UseQCl t p cl = {
      s = \\q => t.s ++ p.s ++ cl.s ! t.t ! t.a ! ctr p.p ! q
    } ;
    UseRCl t p cl = {
      s = \\r => t.s ++ p.s ++ cl.s ! t.t ! t.a ! ctr p.p ! r ;
      c = cl.c
    } ;

  oper
    ctr : CPolarity -> CPolarity = \x -> x ;
---    ctr = contrNeg True ;  -- contracted negations

}

