--# -path=.:../simpleabstract:prelude:../common

resource ParadigmsSimpleEng = open 
  (Predef=Predef), 
  Prelude, 
  MorphoSimpleEng,
  ResSimpleEng,
  CatSimpleEng
  in {
oper
  Gender : Type ; 

  human     : Gender ;
  nonhuman  : Gender ;
  masculine : Gender ; --%
  feminine : Gender ; --%

-- To abstract over number names, we define the following.

  Number : Type ; 

  singular : Number ; 
  plural   : Number ;

-- To abstract over case names, we define the following.

  Case : Type ; --%

  nominative : Case ; --%
  genitive   : Case ; --%

-- Prepositions are used in many-argument functions for rection.
-- The resource category $Prep$ is used.

-- The number of a noun phrase can be extracted with the following
-- function.

  npNumber : NP -> Number ; -- exctract the number of a noun phrase
  ADeg : Type = A;

--2 Nouns

-- Nouns are constructed by the function $mkN$, which takes a varying
-- number of arguments.

  mkN : overload {

-- The regular function captures the variants for nouns ending with
-- "s","sh","x","z" or "y": "kiss - kisses", "flash - flashes"; 
-- "fly - flies" (but "toy - toys"),

    mkN : (flash : Str) -> N ;  -- plural s, incl. flash-flashes, fly-flies 

-- In practice the worst case is to give singular and plural nominative.

    mkN : (man,men : Str) -> N ; -- irregular plural

-- The theoretical worst case: give all four forms.

    mkN : (man,men,man's,men's : Str) -> N ; -- irregular genitives

-- Change gender from the default $nonhuman$.

    mkN : Gender -> N -> N ;  -- default nonhuman

--3 Compound nouns 
--
-- A compound noun is an uninflected string attached to an inflected noun,
-- such as "baby boom", "chief executive officer".

    mkN : Str -> N -> N -- e.g. baby + boom
  } ;
  
  

  mkPN : overload {

    mkPN : Str -> PN ;

-- Sometimes a common noun can be reused as a proper name, e.g. "Bank"

    mkPN : N -> PN --%
  } ;


  mkA : overload {

-- For regular adjectives, the adverbial and comparison forms are derived. This holds
-- even for cases with the variations "happy - happily - happier - happiest",
-- "free - freely - freer - freest", and "rude - rudest".

    mkA : (happy : Str) -> A ; -- regular adj, incl. happy-happier, rude-ruder

-- However, the duplication of the final consonant cannot be predicted,
-- but a separate case is used to give the comparative

    mkA : (fat,fatter : Str) -> A ; -- irreg. comparative

-- As many as four forms may be needed.

    mkA : (good,better,best,well : Str) -> A  -- completely irreg.
    } ;


  mkV : overload {

-- The regular verb function recognizes the special cases where the last
-- character is "y" ("cry-cries" but "buy-buys") or a sibilant
-- ("kiss-"kisses", "jazz-jazzes", "rush-rushes", "munch - munches", 
-- "fix - fixes").

    mkV : (cry : Str) -> V ; -- regular, incl. cry-cries, kiss-kisses etc

-- Give the present and past forms for regular verbs where
-- the last letter is duplicated in some forms,
-- e.g. "rip - ripped - ripping".

    mkV : (stop, stopped : Str) -> V ; -- reg. with consonant duplication

-- There is an extensive list of irregular verbs in the module $IrregularEng$.
-- In practice, it is enough to give three forms, 
-- e.g. "drink - drank - drunk".

    mkV : (drink, drank, drunk  : Str) -> V ; -- ordinary irregular

-- Irregular verbs with duplicated consonant in the present participle.
 
    mkV : (run, ran, run, running  : Str) -> V ; -- irregular with duplication --%

-- Except for "be", the worst case needs five forms: the infinitive and
-- the third person singular present, the past indicative, and the
-- past and present participles.

    mkV : (go, goes, went, gone, going : Str) -> V ; -- totally irregular

-- Adds a prefix to an exisiting verb. This is most useful to create
-- prefix-variants of irregular verbs from $IrregEng$, e.g. "undertake".

    mkV : Str -> V -> V ;  -- fix compound, e.g. under+take
  };


  mkV2 : overload {
    mkV2  : Str -> V2 ;       -- kill --%
    mkV2  : V -> V2 ;         -- transitive, e.g. hit
  };

  mkVV  : V -> VV ; -- e.g. want (to VP)


  mkPrep : Str -> Prep ; -- e.g. "in front of"
  mkPost : Str -> Prep ; -- e.g. "ago"
  noPrep : Prep ;  -- no preposition
  prepV2 : V -> Prep -> V2 ;
  dirV2 : V -> V2 ;

  mkQuant : overload {
    mkQuant : (this, these : Str) -> Quant ; --%
    mkQuant : (no_sg, no_pl, none_sg, non_pl : Str) -> Quant ; --%
  } ;
  
  
  
  Gender = ResSimpleEng.Gender ; 
  Number = ResSimpleEng.Number ;
  Case = ResSimpleEng.NPCase ;
  human = Masc ; 
  nonhuman = Neutr ;
  masculine = Masc ;
  feminine = Fem ;
  singular = Sg ;
  plural = Pl ;
  nominative = npNom ;
  genitive = npGen ;
  
  
  npNumber np = (fromAgr np.a).n ;


  regN = \ray -> 
    let rays = add_s ray
     in
       mk2N ray rays ;


  add_s : Str -> Str = \w -> case w of {
    _ + ("io" | "oo")                         => w + "s" ;   -- radio, bamboo
    _ + ("s" | "z" | "x" | "sh" | "ch" | "o") => w + "es" ;  -- bus, hero
    _ + ("a" | "o" | "u" | "e") + "y"  => w + "s" ;   -- boy
    x + "y"                            => x + "ies" ; -- fly
    _                                  => w + "s"     -- car
    } ;

  duplFinal : Str -> Str = \w -> case w of {
    _ + ("a" | "e" | "o") + ("a" | "e" | "i" | "o" | "u") + ? => w ; -- waited, needed
    _ + ("a" | "e" | "i" | "o" | "u") + 
      c@("b"|"d"|"g"|"m"|"n"|"p"|"r"|"t") => w + c ; -- omitted, manned
    _ => w
    } ;

  mk2N = \man,men -> 
    let mens = case last men of {
      "s" => men + "'" ;
      _   => men + "'s"
      }
    in
    mk4N man men (man + "'s") mens ;

  mk4N = \man,men,man's,men's -> 
    lin N (mkNoun man man's men men's ** {g = Neutr}) ;

  mkPN = overload {
    mkPN : Str -> PN = regPN ;
    mkPN : N -> PN = nounPN
  } ;

  regPN    : Str -> PN ;          
  regGenPN : Str -> Gender -> PN ;     -- John, John's

-- Sometimes you can reuse a common noun as a proper name, e.g. "Bank".

  nounPN : N -> PN ;


  regPN n = regGenPN n human ;
  regGenPN n g = lin PN {s = table {Gen => n + "'s" ; _ => n} ; g = g} ;
  nounPN n = lin PN {s = n.s ! singular ; g = n.g} ;

  genderN g man = lin N {s = man.s ; g = g} ;

  compoundN s n = lin N {s = \\x,y => s ++ n.s ! x ! y ; g=n.g} ;

  mk5V a b c d e = lin V (mkVerb a b c d e ** {s1 = []}) ;

  regV cry = 
    let
      cries = (regN cry).s ! Pl ! Nom ; -- !
      cried : Str = case cries of {
        _ + "es" => init cries + "d" ;
        _        => duplFinal cry + "ed"
        } ;
      crying : Str = case cry of {
        _  + "ee" => cry + "ing" ;
        d  + "ie" => d  + "ying" ;
        us + "e"  => us + "ing" ; 
        _         => duplFinal cry + "ing"
        }
    in mk5V cry cries cried cried crying ;

  reg2V fit fitted =
   let fitt = Predef.tk 2 fitted ;
   in 
     if_then_else V (pbool2bool (Predef.eqStr (last fit) (last fitt)))
       (mk5V fit (fit + "s") (fitt + "ed") (fitt + "ed") (fitt + "ing")) 
       (regV fit) ;

  regDuplV fit = 
    case last fit of {
      ("a" | "e" | "i" | "o" | "u" | "y") => 
        Predef.error (["final duplication makes no sense for"] ++ fit) ;
      t =>
       let fitt = fit + t in
       mk5V fit (fit + "s") (fitt + "ed") (fitt + "ed") (fitt + "ing")
      } ;

  irregV x y z = let reg = (regV x).s in
    mk5V x (reg ! VPres) y z (reg ! VPresPart) ** {s1 = []} ;

  irreg4V x y z w = let reg = (regV x).s in
    mk5V x (reg ! VPres) y z w ** {s1 = []} ;

  irregDuplV fit y z = 
    let 
      fitting = (regDuplV fit).s ! VPresPart
    in
    mk5V fit (fit + "s") y z fitting ;

  us_britishV : Str -> V = \s -> case s of {
    _ + ("el" | "al" | "ol") => regV s | mkV s (s + "s") (s + "led") (s + "led") (s + "ling") ;
    _ + "or" => regV s | regV (Predef.tk 2 s + "our") ;
    _ => regV s
    } ;


  mk4N : (man,men,man's,men's : Str) -> N ;
  regN : Str -> N ;
  mk2N : (man,men : Str) -> N ;
  genderN : Gender -> N -> N ;
  compoundN : Str -> N -> N ;

  mkN = overload {
    mkN : (man,men,man's,men's : Str) -> N = mk4N ;
    mkN : Str -> N = regN ;
    mkN : (man,men : Str) -> N = mk2N ;
    mkN : Gender -> N -> N = genderN ;
    mkN : Str -> N -> N = compoundN
    } ;

  mk5V : (go, goes, went, gone, going : Str) -> V ;
  regV : (cry : Str) -> V ;
  reg2V : (stop, stopped : Str) -> V;
  irregV : (drink, drank, drunk  : Str) -> V ;
  irreg4V : (run, ran, run, running  : Str) -> V ;

  -- Use reg2V instead
  regDuplV : Str -> V ;
  -- Use irreg4V instead
  irregDuplV : (get,   got,   gotten : Str) -> V ;

  mkV = overload {
    mkV : (cry : Str) -> V = regV ;
    mkV : (stop, stopped : Str) -> V = reg2V ;
    mkV : (drink, drank, drunk  : Str) -> V = irregV ;
    mkV : (run, ran, run, running  : Str) -> V = irreg4V ;
    mkV : (go, goes, went, gone, going : Str) -> V = mk5V ;
    mkV : Str -> V -> V = prefixV
  };
  
  mkPrep p = lin Prep {s=p; isPre=True} ;
  mkPost p = lin Prep {s=p; isPre=False} ;
  noPrep = mkPrep [] ;

  prepV2 v p = lin V2 {s = v.s ; p = v.p ; s1 = v.s1 ; c2 = p.s ; isRefl = v.isRefl} ;
  dirV2 v = prepV2 v noPrep ;

  mkVV  v = lin VV {
    s = table {VVF vf => v.s ! vf ; _ => v.s ! VInf} ;
    p = v.p ; 
    typ = VVInf
    } ;


  prefixV : Str -> V -> V = \p,v -> lin V { s = \\vform => p + v.s ! vform; p = v.p ; isRefl = v.isRefl } ;

  mkV2 = overload {
    mkV2  : V -> V2 = dirV2 ;
    mkV2  : Str -> V2 = \s -> dirV2 (regV s) ;
  }; 

  regA : Str -> A ;

    mkA = overload {
    mkA : Str -> A = regA ;
    mkA : (fat,fatter : Str) -> A = \fat,fatter -> 
      mkAdjective fat fatter (init fatter + "st") (adj2adv fat) ;
    mkA : (good,better,best,well : Str) -> A = \a,b,c,d ->
      mkAdjective a b c d
    } ;

  regA a = case a of {
    _ + ("a" | "e" | "i" | "o" | "u" | "y") + ? + _ + 
        ("a" | "e" | "i" | "o" | "u" | "y") + ? + _  => 
         lin A (compoundADeg (regADeg a)) ;
    _ => lin A (regADeg a)
    } ;


  regADeg : Str -> ADeg ;      -- long, longer, longest
  regADeg happy = 
    let
      happ = init happy ;
      y    = last happy ;
      happie = case y of {
        "y" => happ + "ie" ;
        "e" => happy ;
        _   => duplFinal happy + "e"
        } ;
    in mkADeg happy (happie + "r") (happie + "st") (adj2adv happy) ;
    
  adj2adv : Str -> Str = \happy ->
    case happy of {
      _ + "ble" => init happy + "y" ;
      _ + "y"   => init happy + "ily" ;
      _ + "ll"  => happy + "y" ;
      _         => happy + "ly"
      } ;

  mkADeg : (good,better,best,well : Str) -> ADeg ;
  mkADeg a b c d = mkAdjective a b c d ;

  compoundADeg : A -> ADeg ; -- -/more/most ridiculous

  duplADeg : Str -> ADeg ;      -- fat, fatter, fattest
  duplADeg fat = 
    mkADeg fat 
    (fat + last fat + "er") (fat + last fat + "est") (adj2adv fat) ;

  compoundADeg a =
    let ad = (a.s ! AAdj Posit Nom) 
    in mkADeg ad ("more" ++ ad) ("most" ++ ad) (a.s ! AAdv) ;


  mkQuant = overload {
    mkQuant : (this, these : Str) -> Quant = \sg,pl -> mkQuantifier sg pl sg pl;
    mkQuant : (no_sg, no_pl, none_sg, non_pl : Str) -> Quant = mkQuantifier;
  } ;

  mkQuantifier : Str -> Str -> Str -> Str -> Quant = 
   \sg,pl,sg',pl' -> lin Quant {
    s = \\_  => table { Sg => sg ; Pl => pl } ;
    sp = \\_ => table { 
      Sg => \\c => regGenitiveS sg' ! npcase2case c ; Pl => \\c => regGenitiveS pl' ! npcase2case c}
    } ;

} ;
