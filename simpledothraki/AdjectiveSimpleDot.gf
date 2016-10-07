--# -path=.:prelude:../simpleabstract

concrete AdjectiveSimpleDot of AdjectiveSimple = CatSimpleDot ** open ResDot, Prelude in {

  lin

    PositA  a = {
      s = a.s!Posit ;
      pred = a.pred
      } ;
  
}
