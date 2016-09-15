--# -path=.:../simpleabstract

concrete StructuralSimpleEng of StructuralSimple = CatSimpleEng ** 
  open MorphoSimpleEng, ResSimpleEng, ParadigmsSimpleEng, (C = ConstructX), Prelude in {

  flags optimize=all ;

lin 
  i_Pron  = mkPron "I" "me" "my" "mine" singular P1 human ;
  youSg_Pron = mkPron "you" "you" "your" "yours" singular P2 human ;
  youPol_Pron = mkPron "you" "you" "your" "yours" singular P2 human ;
  he_Pron = mkPron "he" "him" "his" "his" singular P3 masculine ;
  she_Pron = mkPron "she" "her" "her" "hers" singular P3 feminine ;
  it_Pron  = mkPron "it" "it" "its" "its" singular P3 nonhuman ;
  we_Pron = mkPron "we" "us" "our" "ours" plural P1 human ;
  youPl_Pron = mkPron "you" "you" "your" "yours" plural P2 human ;
  they_Pron = mkPron "they" "them" "their" "theirs" plural P3 human ;
  
  that_Quant = mkQuant "that" "those" ;
  this_Quant = mkQuant "this" "these" ;

  above_Prep = mkPrep "above" ;
  after_Prep = mkPrep "after" ;
  before_Prep = mkPrep "before" ;
  behind_Prep = mkPrep "behind" ;
  between_Prep = mkPrep "between" ;
  by8agent_Prep = mkPrep "by" ;
  by8means_Prep = mkPrep "by" ;
  during_Prep = mkPrep "during" ;
  for_Prep = mkPrep "for" ;
  from_Prep = mkPrep "from" ;
  in8front_Prep = mkPrep ["in front of"] ;
  in_Prep = mkPrep "in" ;
  on_Prep = mkPrep "on" ;
  part_Prep = mkPrep "of" ;
  possess_Prep = mkPrep "of" ;
  through_Prep = mkPrep "through" ;
  to_Prep = mkPrep "to" ;
  under_Prep = mkPrep "under" ;
  without_Prep = mkPrep "without" ;
  with_Prep = mkPrep "with" ;
  except_Prep = mkPrep "except" ;

}

