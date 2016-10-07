--# -path=.:../simpleabstract:../common:prelude

concrete StructuralSimpleDot of StructuralSimple = CatSimpleDot ** open Prelude, ParamX, MorphoSimpleDot, ResDot, ParadigmsSimpleDot in {
lin
-- This choice of pronouns is dictated by the abstract StructuralSimple.gf
-- (which just copies the one from the original RGL).

-- They fit the actual range of personal pronouns in Dothraki only somewhat
-- roughly (Dothraki has no distinction between "he"/"she"/"it").

  i_Pron = mkPron "anha" "anna" "anni" "anhaan" "anhoon" P1 Sg ;
  youSg_Pron = mkPron "yer" "yera" "yeri" "yeraan" "yeroon" P2 Sg ; -- you (singular)
  youPol_Pron = mkPron "shafka" "shafka" "shafki" "shafkea" "shafkoa" P3 Pl ; -- you (polite)
  he_Pron = mkPron "me" "mae" "mae" "maan" "moon" P3 Sg ;
  it_Pron = mkPron "me" "mae" "mae" "maan" "moon" P3 Sg ;
  she_Pron = mkPron "me" "mae" "mae" "maan" "moon" P3 Sg ;
  we_Pron = mkPron "kisha" "kisha" "kishi" "kishaan" "kishoon" P1 Pl ;
  youPl_Pron = mkPron "yeri" "yeri" "yeri" "yerea" "yeroa" P2 Pl ; -- you (plural)
  they_Pron = mkPron "mori" "mora" "mori" "morea" "moroa" P3 Pl ;
  
  this_Quant = mkQuant "jin" ;
  that_Quant = mkQuant "rek" ;
  
  above_Prep = mkPrep "oleth" Gen ;  
  after_Prep = mkPrep "irge" Gen ;
  before_Prep = mkPrep "hatif" Gen ;
  behind_Prep = mkPrep "irge" Gen ;
  by8agent_Prep = mkPrep "ki" Gen ; -- by (agent) -- ??
  by8means_Prep = mkPrep "ki" Gen ; -- by (means of) -- ??
  during_Prep = mkPrep "kash" Gen ; -- ??
  for_Prep = mkPrep "ha" All ;
  from_Prep = mkPrep "ha" Abl ;
  in8front_Prep = mkPrep "hatif" Gen ; -- in front of
  in_Prep = mkPrep "mra" Nom ;
  on_Prep = mkPrep "she" Nom ;
  part_Prep = mkPrep "ki" Gen ;
  possess_Prep = mkPrep [] Gen ; -- of (possessive)
  								 -- the preposition "ki" can apparently be used to denote possessorship,
  								 -- but using genitive case with no explicit preposition seems to be preferable 
  through_Prep = mkPrep "vi" All ;
  to_Prep = mkPrep [] All ; -- ?? There does not seem to be an explicit preposition for this
  							-- The wiki gives the example "Kisha veraki krazaajaan" -- "We are travelling to the mountain"
  							-- With "krazaaj" -- "the mountain" in allative case to denote "movement towards" 
  under_Prep = mkPrep "torga" Gen ;
  with_Prep = mkPrep "ma" Abl ;
  without_Prep = mkPrep "oma" Abl ;

  can8know_VV, can_VV = {s = "laz"} ;
  must_VV = {s = "eth"} ;


  -- the entries that are commented out, do not seem to be known at this point

  here_Adv = mkAdv "jinne" ;
  there_Adv = mkAdv "hazze" ;
  here7to_Adv = mkAdv "jinnaan" ;   -- from analyzing dialogue
  -- everywhere_Adv = mkAdv "everywhere" ;
  -- here7to_Adv = mkAdv ["to here"] ;
  -- here7from_Adv = mkAdv ["from here"] ;
  -- quite_Adv = mkAdv "quite" ;
  -- somewhere_Adv = mkAdv "somewhere" ;
  -- there7to_Adv = mkAdv "there" ;
  -- there7from_Adv = mkAdv ["from there"] ;
  
  always_AdV = mkAdV "ayyey" ;   -- "ayyey" seems to inflect sometimes, but the details are
                                 -- not clear to me from examples and are not explained anywhere 
  how_IAdv = mkIAdv "kifinosi" "kirekosi" ;
  how8much_IAdv = mkIAdv "finsanney" "reksanney";  -- "reksanney" is a guess; probably this would not be used and the sentence reworded
  so_AdA = mkAdA "sekke" ;
  too_AdA = mkAdA "sekke" ;
  very_AdA = mkAdA "sekke" ;   -- "sekke" seems to mean "very" as well as "too"
  when_IAdv = mkIAdv "affin" "arrek" ;
  where_IAdv = mkIAdv "finne" "rekke" ;
  why_IAdv = mkIAdv "kifindirgi" "kirekdirgi" ;
  -- at_least_AdN : AdN ;
  -- at_most_AdN : AdN ;
  -- as_CAdv : CAdv ;

  and_Conj = mkConj "ma" "majin" ;
  both7and_DConj = mkConj "ma" "majin" ; -- both...and
  either7or_DConj = mkConj "che" ; -- either...or
  or_Conj = mkConj "che" ;
  if_then_Conj = mkConj "hash" ;

  but_PConj = mkPConj "vosma" ;
  -- otherwise_PConj : PConj ;
  therefore_PConj = mkPConj "majin" ;


  everybody_NP = {
  	s = table {
  		Nom => "eyak" ;    -- declension is sort of guessed (by analogy with "vosak")
  		Acc => "eyakes" ;
  		Gen => "eyaki" ;
  		All => "eyakaan" ;
  		Abl => "eyakoon"
  	} ;
  	agr = Ag P3 Sg ;    -- not sure about this; there are no examples so far, 
  						-- which show unambiguously whether "everybody" triggers 
  						-- singular or plural agreement 
  } ;
  -- everything_NP : NP ;
  somebody_NP = {                 -- "someone" is used exactly once in the corpus,
  	s = table {                   -- in the nominative. I do not know how it inflects,
  		Nom => "ato" ;            -- so this is more of a best guess.
  		Acc => "atoes" ;
  		Gen => "atosi" ;
  		All => "atosaan" ;
  		Abl => "atosoon"
  	} ;
  	agr = Ag P3 Sg ;
  };
  -- something_NP : NP ;
  nobody_NP = {
  	s = table {
  		Nom => "vosak" ;
  		Acc => "vosakes" ;
  		Gen => "vosaki" ;
  		All => "vosakaan" ;
  		Abl => "vosakoon"
  	} ;
  	agr = Ag P3 Sg ;
  } ;
  nothing_NP = {
  	s = table {
  		Nom => "vosi" ;
  		Acc => "vos" ;
  		Gen => "vosi" ;
  		All => "vosaan" ;
  		Abl => "vosoon"
  	} ;
  	agr = Ag P3 Sg ;
  } ;


  every_Det = {s = \\_,_ => "ei" ; n = Pl ; s2 = []} ;  -- "ei" does not seem to inflect at all.
  											  -- Number agreement seems to be inconsistent in the corpus.
  											  -- Both "Ei zhavvorsa drivi" ("All the dragons are dead" with "drivi" showing plural agreement),
  											  -- and "Ei khal okke sen dothrakhqoy" ("Every khal chose three bloodriders" with both
  											  -- "khal" and "okke" showing singular agreement) appear.
  											  
  -- "loy" is not really explained anywhere. The sentence
  -- "loyi qoyi avekha ayyey", which is supposed to translate as "there is always
  -- a little blood", indicates that it is "loyi" is the genitive form ("vekhat" assigns
  -- genitive case to the subject). But it does not seem to agree with animacy.
  few_Det, someSg_Det = {s = \\_ => table {
  	Nom => "loy" ;
  	Acc => "loy" ;
  	Gen => "loyi" ;
  	All => "loyaan" ;
  	Abl => "loyoon"
  } ; n = Sg ; s2 = []} ;
                                                         
                                                         
  -- "san" is weird. It behaves like a determiner but supposedly "assigns genitive
  -- case", which determiners do not do. 
  many_Det, much_Det = {s = \\_ => table {
  	Nom => "san" ;
  	Acc => "san" ;
  	Gen => "sani" ;
  	All => "sanaan" ;
  	Abl => "sanoon"
  } ; n = Pl ; s2 = []} ;
  


  -- the following words do not seem to be known at this time
  
  
  -- almost_AdA : AdA ;   
  -- almost_AdN : AdN ;   
  -- less_CAdv : CAdv ;
  -- more_CAdv : CAdv ;
  
}