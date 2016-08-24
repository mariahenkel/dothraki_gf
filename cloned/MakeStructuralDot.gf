--# -path=.:../common:../abstract

resource MakeStructuralDot = open CatDot, ParadigmsDot, ResDot, MorphoDot, Prelude in {

oper 
  mkSubj : Str -> Subj = \x -> 
    lin Subj {s = x} ;
  mkNP : Str -> ParadigmsDot.Number -> NP = \s,n ->
    lin NP (regNP s n) ;
  mkIDet : Str -> ParadigmsDot.Number -> IDet = \s,n ->
    lin IDet {s = s ; n = n} ;
  mkIQuant : Str -> Str -> IQuant = \s,n ->
    lin IQuant {s = table {Sg => s ; Pl => n}} ;

}
