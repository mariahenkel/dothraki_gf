--# -path=.:../simpleabstract:../simpleenglish

resource CombinatorsSimpleEng = CombinatorsSimple with 
  (CatSimple = CatSimpleEng),
  (StructuralSimple = StructuralSimpleEng),
  (NounSimple = NounSimpleEng),
  (ConstructorsSimple = ConstructorsSimpleEng) ;