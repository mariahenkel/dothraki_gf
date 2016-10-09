--# -path=.:../simpleabstract

concrete SentenceSimpleEng of SentenceSimple = CatSimpleEng ** open Prelude, ResSimpleEng in {

  flags optimize=all_subs ;

  lin

    PredVP np vp = mkClause (np.s ! npNom) np.a vp ;

    ImpVP vp = {
      s = \\pol,n => 
        let 
          agr   = AgP2 (numImp n) ;
          verb  = infVP VVAux vp Simul CPos agr ;
          dont  = case pol of {
            CNeg True => "don't" ;
            CNeg False => "do" ++ "not" ;
            _ => []
            }
        in
        dont ++ verb
    } ;

    AdvS a s = {s = a.s ++ s.s} ;
    ExtAdvS a s = {s = a.s ++ frontComma ++ s.s} ;

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

