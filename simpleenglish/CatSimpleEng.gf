--# -path=.:../simpleabstract:../common

concrete CatSimpleEng of CatSimple = CommonX - [Pol] ** open ResSimpleEng, Prelude in {

  flags optimize=all_subs ;

  lincat

    Pol = {s : Str ; p : CPolarity} ;

    S  = {s : Str} ;
    QS = {s : QForm => Str} ;
    RS = {s : Agr => Str ; c : NPCase} ; -- c for it clefts

    Cl = {s : ResSimpleEng.Tense => Anteriority => CPolarity => Order => Str} ;
    ClSlash = {
      s : ResSimpleEng.Tense => Anteriority => CPolarity => Order => Str ;
      c2 : Str
      } ;

    QCl = {s : ResSimpleEng.Tense => Anteriority => CPolarity => QForm => Str} ;

    RCl = {
      s : ResSimpleEng.Tense => Anteriority => CPolarity => Agr => Str ; 
      c : NPCase
      } ;
    RP = {s : RCase => Str ; a : RAgr} ;

    VP = ResSimpleEng.VP ;
    VPSlash = ResSimpleEng.SlashVP ;

    CN = {s : Number => Case => Str ; g : Gender} ;
    NP = {s : NPCase => Str ; a : Agr} ;
    PN = {s : Case => Str ; g : Gender} ;

    Pron = {s : NPCase => Str ; sp : Case => Str ; a : Agr} ;

    Det = {s : Str ; sp : NPCase => Str ; n : Number ; hasNum : Bool} ;
    Num  = {s : Case => Str ; n : Number ; hasCard : Bool} ;
    Quant = {s : Bool => Number => Str ; sp : Bool => Number => NPCase => Str} ;
	
    Conj = {s1,s2 : Str ; n : Number} ;
    Prep = {s : Str; isPre : Bool} ;

    V = Verb ; -- = {s : VForm => Str} ;
    V2 = Verb ** {c2 : Str} ;
    VV = {s : VVForm => Str ; p : Str ; typ : VVType} ;

    N = {s : Number => Case => Str ; g : Gender} ;

    A = {s : AForm => Str} ;
    AP = {s : Agr => Str ; isPre : Bool} ; 

    Comp = {s : Agr => Str} ; 

  lindef

    VP = \s -> predV {s = \\_ => s; p = ""; isRefl = False} ;

    V = \s -> {s = \\_ => s; p = ""; isRefl = False} ;
    V2 = \s -> {s = \\_ => s; p = ""; isRefl = False; c2=""} ;

    N = \s -> {s = \\_,_ => s; g = Neutr} ;

  linref

    VP = \vp -> infVP VVAux vp Simul CPos (agrP3 Sg) ;

    V = \v -> infVP VVAux (predV v) Simul CPos (agrP3 Sg);
    V2 = \v -> infVP VVAux (predV v) Simul CPos (agrP3 Sg) ++ v.c2;

    N = \n -> n.s ! Sg ! Nom ;

}
