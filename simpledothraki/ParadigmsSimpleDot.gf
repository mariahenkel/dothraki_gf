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
  		Anim => {s = table {
  			Sg => table {
  				Nom => lajak ;
  				Acc => lajak + "es" ;
  				Gen => lajak + "i" ;
  				All => lajak + "aan" ;
  				Abl => lajak + "oon"
  			} ;
  			Pl => table {
  				Nom => lajak + "i";
  				Acc => lajak + "is" ;
  				Gen => lajak + "i" ;
  				All => lajak + "ea" ;
  				Abl => lajak + "oa"
  			}
  		} ; a = Anim} ;
  		Inanim => case lajak of {
  			dorv + "i" => {s = table {
  			_ => table {
  				Nom => dorv + "i" ;
  				Acc => dorv + "e" ;
  				Gen => dorv + "i" ;
  				All => dorv + "aan" ;
  				Abl => dorv + "oon"
  			}
  			} ; a = Inanim} ;
  			os => {s = table {
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
  	
  	mkV2 = \ezolat -> let ezo = Predef.tk 3 ezolat in lin V2 {s = table {
  		Pers1 Sg => ezo + "k" ;
  		Pers1 Pl => ezo + "ki" ;
  		Pers2 => ezo + "e" ;
  		Pers3 Sg => ezo + "e" ;
  		Pers3 Pl => ezo + "e"
  	} ; inf = ezolat } ;
}