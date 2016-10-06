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
    
    mkPN : overload {
    	mkPN : Str -> PN ; 					-- Drogo
        mkPN : Str -> Str -> PN				-- Khal Drogo
    } ;
    
    mkV : Str -> V ;
    
    mkV2 : overload {
    	mkV2 : Str -> Case -> V2 ;
    	mkV2 : Str -> V2 ; 					-- convenience method for transitive verbs assigning accusative case
    } ;
    
    mkAdv : Str -> Adv ;
    mkAdV : Str -> AdV ;
    mkAdA : Str -> AdA ; 
    mkAdN : Str -> AdN ;
    
    mkPConj : Str -> PConj ;
    
    mkConj : overload {
    	mkConj : Str -> Conj ;
    	mkConj : Str -> Number -> Conj ;
    	mkConj : Str -> Str -> Conj ;
    } ;
    mkIAdv : Str -> Str -> IAdv ;
    
    
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
    	jell + ("i"|"a"|"e"|"o") => mk3Ni nom acc (jell + "i") ;
    	os => mk3Ni nom acc (os + "i") 
    } ;
    
	mk1N : Str -> Animacy -> N = \nom,a -> case a of {
		Anim => case nom of {
			(ma@(m+("a"|"e"|"o"|"i")))+"i" => 
				(mk4Na nom (ma + "isi") (ma + "yes") (ma + "yes")) ; -- when a noun ends in vowel+i, the i gets replaced by y in the accusative
			dav + ("e"|"i"|"a"|"o") => 
				(mk4Na nom (nom + "si") (nom + "es") (nom + "es")) ;
			chaf =>  
				(mk4Na chaf (chaf + "i") (chaf + "es") (chaf + "is"))
		} ;
  
		Inanim => case nom of {
			dorv + ("i"|"a"|"e"|"o") => case dorv of {
				zhal + ("i"|"e"|"a"|"o") => 			-- noun ends in two vowels, e.g. zhalia-zhalie-zhalii
					mk3Ni nom (dorv + "e") (dorv + "i") ;
				_ => 										-- noun ends in one vowel but not two, e.g. dorvi-dorv-dorvi
					mk3Ni nom (addepenthesis dorv) (dorv + "i")  
			} ;
			os => (mk3Ni os os (os + "i"))
		}
	} ;
	
	mk2N : Str -> Str -> Animacy -> N = \nom,acc,a -> case a of {
		Anim => mk1N nom Anim ;
		Inanim => mk2Ni nom acc
	} ;

    mkN = overload {
    	mkN : Str -> Animacy -> N = mk1N ;
    	mkN : Str -> Str -> Animacy -> N = mk2N ;
    	mkN : Str -> Str -> N = mk2Ni
    } ;
    
    mkPN = overload {
    	mkPN : Str -> PN = regPN ;			-- Drogo
        mkPN : N -> Str -> PN = titlePN		-- Khal Drogo
    } ;


    regPN : Str -> PN = \n -> lin PN {s = \\c => n} ;
    titlePN : N -> Str -> PN = \title,name -> lin PN {
    	s = \\c => title.s!Sg!c ++ name
    } ;
    
    
    
    -- Finds the stem of a verb based on the infinitive and sg past.
    -- The stem cannot always be derived from the infinitive alone, when
    -- the word ends in -lat, since the l might be part of the stem or not. 
    -- Usually, the sg past IS the stem of the verb, but this is complicated
    -- by epenthesis: "rissat" has sg past "risse", because words cannot end in -ss.
    -- So if the sg past ends in "e", then the "e" might be part of the stem
    -- (e.g. eyelat-eye) or not (e.g. rissat-risse).
    stemV : Str -> Str -> Str = \zalat,zal -> case zal of {
    	riss + "e" => case zalat of {	-- if the sg past ends in "e"
    		eye + "lat" => eye ;		-- the -e might belong to the stem,
    		_ => riss 					-- or be forced by epenthesis
    	} ;
    	_ => zal
    } ;
    
    presForm : Str -> Polarity -> VFormPN -> Str = \stem,pol,pn -> case stem of {
    	fati@(fat + ("a"|"e"|"i"|"o")) => case <pol,pn> of {
    		<Pos, Pers1 Sg> => fati + "k" ;
    		<Pos, Pers1 Pl> => fati + "ki" ;
    		<Pos, Pers2> => fati + "e" ;
    		<Pos, Pers3 Sg> => fati + "e" ;
    		<Pos, Pers3 Pl> => fati + "e" ;
    		
    		<Neg, Pers1 Sg> => fat + "ok" ;
    		<Neg, Pers1 Pl> => fat + "oki" ;
    		<Neg, Pers2> => fati + "o" ;
    		<Neg, Pers3 Sg> => fati + "o" ;
    		<Neg, Pers3 Pl> => fati + "o"
   		} ;
   		em => case <pol,pn> of {
    		<Pos, Pers1 Sg> => em + "ak" ;
    		<Pos, Pers1 Pl> => em + "aki" ;
    		<Pos, Pers2> => em + "i" ;
    		<Pos, Pers3 Sg> => em + "a" ;
    		<Pos, Pers3 Pl> => em + "i" ;
    		
    		<Neg, Pers1 Sg> => em + "ok" ;
    		<Neg, Pers1 Pl> => em + "oki" ;
    		<Neg, Pers2> => em + "i" ;
    		<Neg, Pers3 Sg> => em + "o" ;
    		<Neg, Pers3 Pl> => em + "i"
   		}
   	} ;
    
    mk2V : Str -> Str -> Verb = \zalat,zal -> let {stem = stemV zalat zal} in {
    	inf = zalat ;
    	s = case stem of {
    		fati@(fat + ("a"|"e"|"i"|"o")) => table {
    			APast Pos Sg => zal ;
    			APast Pos Pl => fati + "sh" ;
    			APast Neg Sg => fat + "o" ;
    			APast Neg Pl => fat + "osh" ;
    			
    			APresent pol pn => presForm fati pol pn ; 
    			
    			AFuture Pos pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "a"} + fati) Pos pn ;
    			AFuture Neg pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "o"} + fati) Neg pn ;
    			
    			ImpFormal Pos => stem ;
    			ImpFormal Neg => fat + "o" ;
    			
    			ImpInformal Pos => fati + "s" ;
    			ImpInformal Neg => fat + "os"
    		} ;
    		em => table {
    			APast Pos Sg => zal ;
    			APast Pos Pl => em + "ish" ;
    			APast Neg Sg => em + "o" ;
    			APast Neg Pl => em + "osh" ;
    			
    			APresent pol pn => presForm em pol pn ;
    			
    			AFuture Pos pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "a"} + em) Pos pn ;
    			AFuture Neg pn => presForm (pre {"a"|"e"|"i"|"o" => "v" ; _ => "o"} + em) Neg pn ;
    			
    			ImpFormal Pos => em + "i" ;
    			ImpFormal Neg => em + "o" ;
    			
    			ImpInformal Pos => em + "as" ;
    			ImpInformal Neg => em + "os"
    		} 
    	} ;
    	part = case stem of {
    		fat + ("a"|"e"|"i"|"o") => stem + "y" ;
    		_ => stem + "ay"
    	}
    } ;
    
    mk1V : Str -> Verb = \w -> case w of {
    	ezo + "lat" => mk2V w ezo ;
    	riss + "at" => mk2V w (addepenthesis riss) 
    } ;
    
    mkV : Str -> V = \w -> mk1V w ** {lock_V=<>};
    
    mkV2def : Str -> Case -> V2 = \w,objCase -> (mk1V w) ** {objCase = objCase ; lock_V2=<>};
    
	mkV2 = overload {
		mkV2 : Str -> Case -> V2 = mkV2def ;
		mkV2 : Str -> V2 = \w -> mkV2def w Acc ; 
	} ;

    mkAnc : Str -> (Number => ACase => Str) = \haj -> table {
            Sg => table {
                ANom => haj ;
                AOther => case haj of {
                    samv + ("a"|"e"|"i"|"o") => haj ;
                    _ => haj + "a" 
                }
            } ;
            Pl => case haj of {
                samv + ("a"|"e"|"i"|"o") => \\_ => haj ;
                _ => \\_ => (haj + "i") 
            }
        } ;

    prefixA : Str -> Str = \haj -> pre {"a"|"e"|"i"|"o" => "as" ; _ => "a"} + haj ;
    postfixA : Str -> Str = \ahaj -> case ahaj of {
            ahakeso@(ahakes + ("a"|"e"|"i"|"o")) => ahakeso + "n" ;
            x => x + "an"
        } ;

    mkA : Str -> A = \haj -> let {compar = postfixA (prefixA haj)} in lin A { 
    	s = table {
        	Posit => mkAnc haj ;
        	Compar => mkAnc compar ;
        	Superl => mkAnc (compar + "az")
    	} ;
    	v = mkV (case haj of {
    		samva@(samv + ("a"|"e"|"i"|"o")) => samva + "lat" ;
    		_ => haj + "at"
    	}) ;
    } ;
	
	mkPrep : Str -> Case -> Prep = \s,c -> lin Prep {s = s; c = c} ;
	
	mkAdv : Str -> Adv = \s -> lin Adv (ss s);
    mkAdV : Str -> AdV = \s -> lin AdV (ss s);
    mkAdA : Str -> AdA = \s -> lin AdA (ss s);
    mkAdN : Str -> AdN = \s -> lin AdN (ss s);

    mkPConj : Str -> PConj = \s -> lin PConj (ss s);
    
    mkConj = overload {
    	mkConj : Str -> Conj = \s -> lin Conj {s = s; p = s; n = Pl};
    	mkConj : Str -> Number -> Conj = \s,n -> lin Conj {s = s; p = s; n = n};
    	mkConj : Str -> Str -> Conj = \s,p -> lin Conj {s = s; p = p; n = Pl} ;
    } ;
    
    mkIAdv : Str -> Str -> IAdv = \s,small -> lin IAdv {s = s; small = small};
    	
}