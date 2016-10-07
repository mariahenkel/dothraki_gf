--# -path=.:../common:prelude

resource ResDot = ParamX ** open Prelude in {
	param
		Animacy = Anim | Inanim ;
		Case = Nom | Gen | Acc | All | Abl ;
		ACase = ANom | AOther ;
		
		VFormPN = Pers1 Number | Pers2 | Pers3 Number ;
		
		Agr = Ag Person Number ;
		
		VForm = APast Polarity Number | APresent Polarity VFormPN | AFuture Polarity VFormPN | ImpFormal Polarity | ImpInformal Polarity ;
		
		QuForm = QAnim Number | QInanim ;
		
	oper
		Noun : Type = {s : Number => Case => Str ; a : Animacy ; p : Person } ;
		
		Verb : Type = {
			s : VForm => Str ; 
			inf : Str ; 
			part : Str
		} ;
		
		-- In Dothraki, some determiners go before the subject ("jinak adra" -- "this turtle"),
		-- others come after ("adra anni" -- "my turtle"). Conceivably (though examples of this
		-- usage do not yet seem to exist), the determiner could consist of two parts, one
		-- before, one after the noun ("akat adrasi anni"?? -- "my two turtles"), hence
		-- the two fields here (from what we know, the postposition part does not seem to 
		-- inflect, so for now it is simply a Str here; this might have to be changed later).
		Quant : Type = {s : QuForm => Case => Str ; post : Str } ;
				
				
		agrToVFormPN : Agr -> VFormPN = \a -> case a of {
			Ag P2 _ => Pers2 ;
			Ag P1 n => Pers1 n ;
			Ag P3 n => Pers3 n
		} ;
		
		extrNum : Agr -> Number = \a -> case a of {
			Ag _ n => n
		} ;
		
		anToQuForm : Animacy -> Number -> QuForm = \a,n -> case a of {
			Anim => QAnim n ;
			Inanim => QInanim
		} ;

		tapaToVForm : Tense -> Anteriority -> Polarity -> Agr -> VForm = \t,ant,p,a -> case t of {
			Past => APast p (extrNum a) ;
			Fut => AFuture p (agrToVFormPN a) ;
			Pres => case ant of {
				Simul => APresent p (agrToVFormPN a) ;
				Anter => APast p (extrNum a)				-- The wiki is unclear on perfect tenses.
															-- It states that the *past* perfect is formed with
															-- the auxiliary "ray" and verb in past tense,
															-- but the example given ("anha ray addriv mahrazhes" -- 
															-- "I have killed the man") is actually translated as
															-- *present* perfect in English.
															-- Since present perfect is a lot more useful to have,
															-- let's assume that's what they meant.
			} ;
			Cond => APresent p (agrToVFormPN a)		-- conditional tense is not implemented yet,
															-- so defaults to present tense
		} ;

		
		-- the following are convenience methods, implementing the
		-- "worst case" constructors for nouns. The more sophisticated
		-- versions for constructing regular nouns are found in Paradigms
		-- and use these operations.
		
		-- An inanimate noun has at most 5 different forms (there is no
		-- differentiation of singular and plural) ...
		mk5Ni : (_,_,_,_,_:Str) -> Noun = \sondra,sondre,sondri,sondraan,sondroon -> {
			s = table {
				_ => table {
					Nom => sondra ;
					Acc => sondre ;
					Gen => sondri ;
					All => sondraan ;
					Abl => sondroon 
				}
			} ;
			a = Inanim ;
			p = P3 
		} ;
		
		-- ... but actually, it seems that allative and ablative can 
		-- always (?) be derived in a regular fashion from the genitive 
		-- form, so this method is probably more useful. 
		mk3Ni : (_,_,_:Str) -> Noun = \sondra,sondre,sondri ->
			let {sondr = Predef.tk 1 sondri} in
				(mk5Ni sondra sondre sondri (sondr + "aan") (sondr + "oon")) ;
		
		-- Animate nouns have at most 9 different forms...		
		mk9Na : (_,_,_,_,_,_,_,_,_:Str) -> Noun = \rizh,rizhi,rizhes,rizhis,rizhiG,rizhaan,rizhea,rizhoon,rizhoa -> {
			s = table {
				Sg => table {
					Nom => rizh ;
					Acc => rizhes ;
					Gen => rizhiG ;
					All => rizhaan ;
					Abl => rizhoon
				} ;
				Pl => table {
					Nom => rizhi ;
					Acc => rizhis ;
					Gen => rizhiG ;
					All => rizhea ;
					Abl => rizhoa
				}
			} ;
			a = Anim ;
			p = P3 
		} ;
		
		-- but again, 5 of those seem to *always* be regular:
		mk4Na : (_,_,_,_:Str) -> Noun = \rizh,rizhi,rizhes,rizhis -> 
			let {rizhR = Predef.tk 1 rizhi} in
				(mk9Na rizh rizhi rizhes rizhis rizhi (rizhR + "aan") (rizhR + "ea") (rizhR + "oon") (rizhR + "oa")) ;
				
				
		mkQuant : Str -> Quant = \jin -> {
			s = table {
				QInanim => table {
					Nom => jin + "i" ;
					Acc => jin ;
					Gen => jin + "i" ;
					All => jin + "aan" ;
					Abl => jin + "oon"
				} ;
				QAnim Sg => table {
					Nom => jin + "ak" ;
					Acc => jin + "akes";
					Gen => jin + "aki" ;
					All => jin + "akaan" ;
					Abl => jin + "akoon"
				} ;
				QAnim Pl => table {
					Nom => jin + "aki" ;
					Acc => jin + "akis" ;
					Gen => jin + "aki" ;
					All => jin + "akea" ;
					Abl => jin + "akoa"
				}
			} ;
			post = []
		} ;
		
		-- The rules for epenthetic -e in Dothraki are a little complex:
		-- * Words cannot end in w, g or q
		-- * Words cannot end in three or more consonants
		-- * Words cannot end in two consonants, the first of which is less sonorant than the second
		--   (i.e. "dorvi" becomes "dorv" in the accusative, because r is more sonorant than v, 
		--   but "alegra" becomes "alegre", since g is less sonorant than r, so "alegr" is disallowed)  	
		addepenthesis : Str -> Str = \w -> case w of {
			_ + ("a"|"e"|"i"|"o") => w ;
			_ + ("w"|"g"|"q") => w + "e" ;
			x + ("y"|"r"|"l") => case x of {
				_ + ("a"|"e"|"i"|"o") => w ;
				_ => w + "e"
			} ;
			x + ("m"|"n") => case x of {
				_ + ("a"|"e"|"i"|"o") => w ;
				y + ("w"|"y"|"r"|"l") => case y of {
					_ + ("a"|"e"|"i"|"o") => w ;
					_ => w + "e"
				} ;
				_ => w + "e"
			} ;
			x + ("th"|"s"|"sh"|"z"|"zh"|"kh"|"f"|"v") => case x of {
				_ + ("a"|"e"|"i"|"o") => w ;
				y + ("w"|"y"|"r"|"l"|"m"|"n") => case y of {
					_ + ("a"|"e"|"i"|"o") => w ;
					_ => w + "e"
				} ;
				_ => w + "e" 
			} ;
			x + ("j"|"ch"|"t"|"d"|"k") => case x of {
				_ + ("a"|"e"|"i"|"o") => w ;
				y + ("w"|"y"|"r"|"l"|"m"|"n"|"th"|"s"|"sh"|"z"|"zh"|"kh"|"f"|"v") => case y of {
					_ + ("a"|"e"|"i"|"o") => w ;
					_ => w + "e"
				} ;
				_ => w + "e"
			}
		} ;
		
		finalComma : Str = pre {"," | "." => []; "" => SOFT_BIND ++ ","; _ => []} ;
  		frontComma : Str = SOFT_BIND ++ "," ;
  		
  	conjAgr : Agr -> Agr -> Agr = \a0,b0 -> 
  	  case a0 of {
  	  	Ag p1 n1 => case b0 of {
  	  		Ag p2 n2 => Ag (conjPerson p1 p2) (conjNumber n1 n2)
  	  	}
  	  } ;
  		
  		
	verbStr : Verb -> Tense -> Anteriority -> Polarity -> Agr -> Str = \v,t,a,p,agr -> let vf = (tapaToVForm t a p agr) in 
		case <t,a> of {
			<Present,Anter> => "ray" ; 		-- the perfect tense marker
			_ => []		
		} ++
		case p of {
			Pos => []  ;
			Neg => "vos" 
		} ++
		v.s!vf ;
}