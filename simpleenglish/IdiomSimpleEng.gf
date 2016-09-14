--# -path=.:../simpleabstract:prelude

concrete IdiomSimpleEng of IdiomSimple = CatSimpleEng ** open Prelude, ResSimpleEng in {

  flags optimize=all_subs ;

  lin
    ExistNP np = 
      mkClause "there" (agrP3 (fromAgr np.a).n) 
        (insertObj (\\_ => np.s ! NPAcc) (predAux auxBe)) ;

}

