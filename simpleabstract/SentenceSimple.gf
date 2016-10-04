abstract SentenceSimple = CatSimple ** {

  data
    PredVP    : NP -> VP -> Cl ;         -- John walks

  fun
    UseCl    : Temp -> Pol -> Cl  -> S ;
    UseQCl   : Temp -> Pol -> QCl -> QS ;
    UseRCl   : Temp -> Pol -> RCl -> RS ;


    SlashVP   : NP -> VPSlash -> ClSlash ;      -- (whom) he sees
}
