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
  

}

