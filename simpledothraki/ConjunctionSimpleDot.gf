--# -path= .:../simpleabstract:prelude


-- This thing is a bit of a mystery. It uses the undocumented Coordination module
-- (which seems to be one massive ugly hack, with the structure of Conj hardcoded in etc).
-- I just copied from English and fudged things until it worked...


concrete ConjunctionSimpleDot of ConjunctionSimple = 
  CatSimpleDot ** open ResDot, Coordination, Prelude in {

  flags optimize=all_subs ;

  lin

    ConjNP conj ss = conjunctDistrTable Case conj ss ** {
      agr = Ag P3 Pl -- FIX
    } ;


-- These fun's are generated from the list cat's.

    BaseNP x y = twoTable Case x y ** {agr = Ag P3 Pl} ;
    ConsNP xs x = consrTable Case comma xs x ** {agr = Ag P3 Pl} ;

  lincat
    [NP] = {s1,s2 : Case => Str ; agr : Agr} ;

}
