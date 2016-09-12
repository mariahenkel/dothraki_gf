resource ResDot = ParamX ** {
	param
		Animacy = Anim | Inanim ;
		Case = Nom | Gen | Acc | All | Abl ;
		
		Agr = Pers1 Number | Pers2 | Pers3 Number ;
		
	oper
		Noun : Type = {s : Number => Case => Str ; a : Animacy} ;
		
		Verb : Type = {s : Agr => Str ; inf : Str} ;
		
		
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
			a = Inanim
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
			a = Anim
		} ;
		
		-- but again, 5 of those seem to *always* be regular:
		mk4Na : (_,_,_,_:Str) -> Noun = \rizh,rizhi,rizhes,rizhis -> 
			let {rizhR = Predef.tk 1 rizhi} in
				(mk9Na rizh rizhi rizhes rizhis rizhi (rizhR + "aan") (rizhR + "ea") (rizhR + "oon") (rizhR + "oa")) ;
		

}