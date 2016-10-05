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


  can8know_VV, can_VV = {
    s = table {
      VVF VInf => ["be able to"] ;
      VVF VPres => "can" ;
      VVF VPPart => ["been able to"] ;
      VVF VPresPart => ["being able to"] ;
      VVF VPast => "could" ;      --# notpresent
      VVPastNeg => "couldn't" ;   --# notpresent
      VVPresNeg => "can't" -- | "cannot"     ---- shouldn't be a variant, but replace "can not"
      } ;
    p = [] ;
    typ = VVAux
    } |
 {
    s = table { 
      VVF VInf => ["be able to"] ;
      VVF VPres => "can" ;
      VVF VPPart => ["been able to"] ;
      VVF VPresPart => ["being able to"] ;
      VVF VPast => "could" ;      --# notpresent
      VVPastNeg => "couldn't" ;   --# notpresent
      VVPresNeg => "cannot"     ---- shouldn't be a variant, but replace "can not"
      } ;
    p = [] ;
    typ = VVAux
    } ;
    
  must_VV = {
    s = table {
      VVF VInf => ["have to"] ;
      VVF VPres => "must" ;
      VVF VPPart => ["had to"] ;
      VVF VPresPart => ["having to"] ;
      VVF VPast => ["had to"] ;      --# notpresent
      VVPastNeg => ["hadn't to"] ;      --# notpresent
      VVPresNeg => "mustn't"
      } ;
    p = [] ;
    typ = VVAux
    } ;


  everywhere_Adv = mkAdv "everywhere" ;
  here_Adv = mkAdv "here" ;
  here7to_Adv = mkAdv ["to here"] ;
  here7from_Adv = mkAdv ["from here"] ;
  quite_Adv = mkAdv "quite" ;
  somewhere_Adv = mkAdv "somewhere" ;
  there_Adv = mkAdv "there" ;
  there7to_Adv = mkAdv "there" ;
  there7from_Adv = mkAdv ["from there"] ;

  almost_AdA = mkAdA "almost" ;
  almost_AdN = mkAdN "almost" ;
  always_AdV = mkAdV "always" ;
  how_IAdv = ss "how" ;
  how8much_IAdv = ss "how much" ;
  less_CAdv = C.mkCAdv "less" "than" ;
  more_CAdv = C.mkCAdv "more" "than" ;
  so_AdA = mkAdA "so" ;
  too_AdA = mkAdA "too" ;
  very_AdA = mkAdA "very" ;
  when_IAdv = ss "when" ;
  where_IAdv = ss "where" ;
  why_IAdv = ss "why" ;
  at_least_AdN = mkAdN "at least" ;
  at_most_AdN = mkAdN "at most" ;
  as_CAdv = C.mkCAdv "as" "as" ;

  and_Conj = mkConj "and" ;
  both7and_DConj = mkConj "both" "and";
  or_Conj = mkConj "or" singular ;
  if_then_Conj = mkConj "if" "then" singular ;
  either7or_DConj = mkConj "either" "or" singular ;

  but_PConj = ss "but" ;
  otherwise_PConj = ss "otherwise" ;
  therefore_PConj = ss "therefore" ;

  everybody_NP = regNP "everybody" singular ;
  everything_NP = regNP "everything" singular ;
  somebody_NP = regNP "somebody" singular ;
  something_NP = regNP "something" singular ;
  nobody_NP = regNP "nobody" singular ;
  nothing_NP = regNP "nothing" singular ;
  
  every_Det = mkDeterminerSpec singular "every" "everyone" False ;
  few_Det = mkDeterminer plural "few" ;
  many_Det = mkDeterminer plural "many" ;
  much_Det = mkDeterminer singular "much" ;
  someSg_Det = mkDeterminer singular "some" ;
  somePl_Det = mkDeterminer plural "some" ;
  

}

