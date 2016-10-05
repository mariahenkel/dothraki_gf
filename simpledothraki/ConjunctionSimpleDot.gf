--# -path= .:../simpleabstract:prelude


-- This thing is a bit of a mystery. It uses the undocumented Coordination module
-- (which seems to be one massive ugly hack, with the structure of Conj hardcoded in etc).
-- I just copied from English and fudged things until it worked...


concrete ConjunctionSimpleDot of ConjunctionSimple = 
  CatSimpleDot ** open ResDot, Coordination, Prelude in {

  flags optimize=all_subs ;
  
  param
    RSAgr = RSAg Animacy Number ;
    
  oper
    fromRSAgr : {s : RSAgr => Str } -> {s : Animacy => Number => Str} = \t -> {
    	s = \\a,n => t.s!(RSAg a n)
    };
    toRSAgr : {s : Animacy => Number => Str} -> {s: RSAgr => Str } = \t -> {
    	s = table {
    		RSAg a n => t.s!a!n
    	}
    };

  lin

    ConjS conj ss = conjunctDistrSS {s1 = [] ; s2 = conj.s} ss;

    ConjNP conj ss = conjunctDistrTable Case {s1 = conj.s; s2 = conj.s} ss ** {
      agr = conjAgr (Ag P3 conj.n) ss.agr
    } ;

    ConjRS conj ss = fromRSAgr (conjunctDistrTable RSAgr {s1 = [] ; s2 = conj.s} ss) ;

-- These fun's are generated from the list cat's.

    BaseS = twoSS ;
    ConsS = consrSS comma ;
    BaseNP x y = twoTable Case x y ** {agr = conjAgr x.agr y.agr} ;
    ConsNP xs x = consrTable Case comma xs x ** {agr = conjAgr xs.agr x.agr} ;
    BaseRS x y = twoTable RSAgr (toRSAgr x) (toRSAgr y) ;
    ConsRS xs x = consrTable RSAgr comma (toRSAgr xs) x ;

  lincat
    [S] = {s1,s2 : Str} ;
    [NP] = {s1,s2 : Case => Str ; agr : Agr} ;
    [RS] = {s1,s2 : RSAgr => Str } ;

}
