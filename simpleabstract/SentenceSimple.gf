abstract SentenceSimple = CatSimple ** {

  data
    PredVP    : NP -> VP -> Cl ;         -- John walks

  fun
    UseCl    : Temp -> Pol -> Cl  -> S ;
}
