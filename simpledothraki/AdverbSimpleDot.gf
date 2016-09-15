--# -path=.:../simpleabstract:prelude

concrete AdverbSimpleDot of AdverbSimple = CatSimpleDot ** open ResDot, Prelude in {

  lin

    PrepNP prep np = {s = prep.s ++ np.s!prep.c} ;


}
