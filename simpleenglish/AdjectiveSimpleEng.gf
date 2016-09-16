--# -path=.:prelude:../simpleabstract

concrete AdjectiveSimpleEng of AdjectiveSimple = CatSimpleEng ** open ResSimpleEng, Prelude in {

  lin

    PositA  a = {
      s = \\_ => a.s ! AAdj Posit Nom ;
      isPre = True
      } ;
  
}
