--# -path= .:../simpleabstract:prelude

concrete ConjunctionSimpleEng of ConjunctionSimple = 
  CatSimpleEng ** open ResSimpleEng, Coordination, Prelude in {

  flags optimize=all_subs ;

  lin

    ConjS = conjunctDistrSS ;

    ConjNP conj ss = conjunctDistrTable NPCase conj ss ** {
      a = conjAgr (agrP3 conj.n) ss.a
      } ;

    ConjRS conj ss = conjunctDistrTable Agr conj ss ** {
      c = ss.c
      } ;

-- These fun's are generated from the list cat's.

    BaseS = twoSS ;
    ConsS = consrSS comma ;
    BaseNP x y = twoTable NPCase x y ** {a = conjAgr x.a y.a} ;
    ConsNP xs x = consrTable NPCase comma xs x ** {a = conjAgr xs.a x.a} ;
    BaseRS x y = twoTable Agr x y ** {c = y.c} ;
    ConsRS xs x = consrTable Agr comma xs x ** {c = xs.c} ;

  lincat
    [S] = {s1,s2 : Str} ;
    [NP] = {s1,s2 : NPCase => Str ; a : Agr} ;
    [RS] = {s1,s2 : Agr => Str ; c : NPCase} ;


}
