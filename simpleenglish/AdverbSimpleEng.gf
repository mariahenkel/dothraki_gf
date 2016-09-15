--# -path=.:prelude:../simpleabstract

concrete AdverbSimpleEng of AdverbSimple = CatSimpleEng ** open ResSimpleEng, Prelude in {

  lin

    PrepNP prep np = {s = preOrPost prep.isPre prep.s (np.s ! NPAcc)} ;
}
