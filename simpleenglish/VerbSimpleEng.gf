concrete VerbSimpleEng of VerbSimple = CatSimpleEng ** open ResSimpleEng, Prelude in {

  flags optimize=all_subs ;

  lin
    UseV = predV ;

    SlashV2a v = predVc v ;
    ComplSlash vp np = case vp.gapInMiddle of {
      True  => insertObjPre (\\_ => vp.c2 ++ np.s ! NPAcc) vp ;
      False => insertObj    (\\_ => vp.c2 ++ np.s ! NPAcc) vp
      } ;

}
