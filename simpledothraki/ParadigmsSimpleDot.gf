--# -path=.:prelude:../common:../simpleabstract

resource ParadigmsSimpleDot = open 
  (Predef=Predef), 
  Prelude, 
  MorphoSimpleDot,
  ResDot,
  CatSimpleDot
  in {
    oper
    
    -- Declarations 
    
    Animacy : Type ;
    
    inanimate : Animacy ;
    animate : Animacy ;
    
    Number : Type ;
    
    singular : Number ;
    plural : Number ;
    
    Case : Type ;
    
    nominative, genitive, accusative, allative, ablative : Case ;
    
    mkN : Str -> Animacy -> N ;
    
    mkV2 : Str -> V2 ;
    
    
    -- Implementation
    
    Animacy = ResDot.Animacy ;
    inanimate = Inanim ;
    animate = Anim ;
    
    Number = ResDot.Number ;
    singular = Sg ;
    plural = Pl ;
    
    Case = ResDot.Case ;
    nominative = Nom ;
    genitive = Gen ;
    accusative = Acc ;
    allative = All ;
    ablative = Abl;
    
  mkN = \lajak,a -> case a of {
      Anim => case lajak of { 
        adra + ("i"|"a"|"e"|"o"|"u") => lin N {s = table {
        Sg => table {
          Nom => lajak ;
          Acc => lajak + "es" ;
          Gen => lajak + "si" ;
          All => lajak + "saan" ;
          Abl => lajak + "soon"
        } ;
        Pl => table {
          Nom => lajak + "si";
          Acc => lajak + "es" ; -- when to use -es and when -(i)s?
          Gen => lajak + "si" ;
          All => lajak + "sea" ;
          Abl => lajak + "soa"
        }
      } ; a = Anim} ;
        chaf => lin N {s = table {
        Sg => table {
          Nom => lajak ;
          Acc => lajak + "es" ;
          Gen => lajak + "i" ;
          All => lajak + "aan" ;
          Abl => lajak + "oon"
        } ;
        Pl => table {
          Nom => lajak + "i";
          Acc => lajak + "es" ;
          Gen => lajak + "i" ;
          All => lajak + "ea" ;
          Abl => lajak + "oa"
        }
      } ; a = Anim } 
 };
      
      Inanim => case lajak of {
        dorv + ("i"|"a"|"e"|"o"|"u") => lin N {s = table {
        _ => table {
          Nom => lajak ;
          Acc => dorv;   -- epenthesis -e not implemented yet (check with vocabulary list, which has acc forms, in the end)
          Gen => dorv + "i" ;
          All => dorv + "aan" ;
          Abl => dorv + "oon"
        }
        } ; a = Inanim} ;
        os => lin N {s = table {
        _ => table {
          Nom => os ;
          Acc => os ;
          Gen => os + "i" ;
          All => os + "aan" ;
          Abl => os + "oon"
        }
        } ; a = Inanim}
      }
    } ;
    
    mkV2 = \ezolat -> case ezolat of {
    ezo + "lat" => let ezo = Predef.tk 3 ezolat in lin V2 {s = table {   -- Predef.tk 3 seems redundant since ezo variable takes no suffix anyways
      Pers1 Sg => ezo + "k" ;
      Pers1 Pl => ezo + "ki" ;
      Pers2 => ezo + "e" ;
      Pers3 Sg => ezo + "e" ;
      Pers3 Pl => ezo + "e"
    } ; inf = ezolat };
    ezol + "at" => lin V2 {s = table {    -- i deleted Predef.tk 2 here. still works. dunno it it is the most efficient way (if ...else tk 2  above?)
      Pers1 Sg => ezol + "ak" ;
      Pers1 Pl => ezol + "aki" ;
      Pers2 => ezol + "i" ;
      Pers3 Sg => ezol + "a" ;
      Pers3 Pl => ezol + "i"
    } ; inf = ezolat }
  } ; 
}