--# -path= .:../simpleabstract:prelude

concrete ConjunctionSimpleEng of ConjunctionSimple = 
  CatSimpleEng ** open ResSimpleEng, Coordination, Prelude in {

  flags optimize=all_subs ;

  lin

    ConjNP conj ss = conjunctDistrTable NPCase conj ss ** {
      a = conjAgr (agrP3 conj.n) ss.a
      } ;


-- These fun's are generated from the list cat's.

    BaseNP x y = twoTable NPCase x y ** {a = conjAgr x.a y.a} ;
    ConsNP xs x = consrTable NPCase comma xs x ** {a = conjAgr xs.a x.a} ;

  lincat
    [NP] = {s1,s2 : NPCase => Str ; a : Agr} ;


}
