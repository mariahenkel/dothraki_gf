--# -path=../simpleabstract

concrete VerbSimpleEng of VerbSimple = CatSimpleEng ** open ResSimpleEng, Prelude in {

  flags optimize=all_subs ;

  lin
    UseV = predV ;

    ComplVV v vp = insertObj (\\a => infVP v.typ vp Simul CPos a) (predVV v) ;

    AdvVP vp adv = insertObj (\\_ => adv.s) vp ;

    PassV2 v = insertObj (\\_ => v.s ! VPPart ++ v.p) (predAux auxBe) ;

    SlashV2a v = predVc v ;
    ComplSlash vp np = case vp.gapInMiddle of {
      True  => insertObjPre (\\_ => vp.c2 ++ np.s ! NPAcc) vp ;
      False => insertObj    (\\_ => vp.c2 ++ np.s ! NPAcc) vp
      } ;

    CompNP np = {s = \\_ => np.s ! NPAcc} ;
    CompAP ap = ap ;
    UseComp comp = insertObj comp.s (predAux auxBe) ;

}
