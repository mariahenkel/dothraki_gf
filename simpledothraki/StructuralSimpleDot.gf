--# -path=.:../simpleabstract:../common

concrete StructuralSimpleDot of StructuralSimple = CatSimpleDot ** open ParamX, MorphoSimpleDot, ResDot, ParadigmsSimpleDot in {
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
  
}