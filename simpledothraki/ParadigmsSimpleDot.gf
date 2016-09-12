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
    
    mkN : overload {
    	mkN : (qeso:Str) -> Animacy -> N ;
    	mkN : (jelli,jel:Str) -> N			-- irregular accusative (only for inanimate nouns; 
    										-- not sure whether animate nouns can have irregular accusatives)
    } ;
    
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
    
    -- for inanimate nouns with an irregular accusative form
    mk2Ni : Str -> Str -> N = \nom,acc -> case nom of {
    	jell + ("i"|"a"|"e"|"o"|"u") => mk3Ni nom acc (jell + "i") ;
    	os => mk3Ni nom acc (os + "i") 
    } ;
    
	mk1N : Str -> Animacy -> N = \nom,a -> case a of {
		Anim => case nom of {
			(ma@(m+("a"|"e"|"o"|"u"|"i")))+"i" => 
				(mk4Na nom (ma + "isi") (ma + "yes") (ma + "yes")) ; -- when a noun ends in vowel+i, the i gets replaced by y in the accusative
			dav + ("e"|"i"|"a"|"o"|"u") => 
				(mk4Na nom (nom + "si") (nom + "es") (nom + "es")) ;
			chaf =>  
				(mk4Na chaf (chaf + "i") (chaf + "es") (chaf + "is"))
		};
  
		Inanim => case nom of {
			dorv + ("i"|"a"|"e"|"o"|"u") => case dorv of {
				zhal + ("i"|"e"|"a"|"o"|"u") => 			-- noun ends in two vowels, e.g. zhalia-zhalie-zhalii
					mk3Ni nom (dorv + "e") (dorv + "i") ;
				_ => 										-- noun ends in one vowel but not two, e.g. dorvi-dorv-dorvi
					mk3Ni nom (addepenthesis dorv) (dorv + "i")  
			} ;
			os => (mk3Ni os os (os + "i"))
		}
	} ;

    mkN = overload {
    	mkN : Str -> Animacy -> N = mk1N ;
    	mkN : Str -> Str -> N = mk2Ni
    } ;
    
    
	mkV2 = \ezolat -> lin V2 { 
		s = case ezolat of {
	    	ezo + "lat" => table {
				Pers1 Sg => ezo + "k" ;
	      		Pers1 Pl => ezo + "ki" ;
	      		Pers2 => ezo + "e" ;
	      		Pers3 Sg => ezo + "e" ;
	      		Pers3 Pl => ezo + "e"
	    	} ;
	    	em + "at" => table {
	      		Pers1 Sg => em + "ak" ;
	      		Pers1 Pl => em + "aki" ;
	      		Pers2 => em + "i" ;
	      		Pers3 Sg => em + "a" ;
	      		Pers3 Pl => em + "i"
	    	}
    	} ;
    	inf = ezolat
  	} ; 
}