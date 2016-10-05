--# -path=.:../simpleabstract:../common

concrete CatSimpleDot of CatSimple = CommonX - [IAdv] ** open ResDot in {
	lincat
		N = Noun ;
		CN = Noun ;
		NP = {s : Case => Str ; agr : Agr } ;
    	PN = {s : Case => Str } ;
		
		Pron = {s : Case => Str ; agr : Agr } ;
		
		Num = {n : Number} ; 	-- this is a dummy. 
								-- We don't actually implement numerals in determiners ("these five") so far.
								-- So, for now, the "numeral part" is only used to determine the number agreement
								-- of the Quant part of Det. 
		Quant = ResDot.Quant ;
		Det = {s : Animacy => Case => Str ; n : Number } ;
		
		Prep = {s : Str ; c : Case} ;
		
		S, QS = {s : Str} ;
		Cl, QCl = {s : ResDot.Tense => Anteriority => Polarity => Str} ;
		
		-- ClSlash (clause with a missing object) is used in relative sentences 
		-- ("the goat whom the warrior kisses") and questions ("Whom does the warrior kiss?")
		-- In Dothraki, the word order in the clause depends on how it is used:
		-- Relative sentences use VSO word order ("dorvi fin zoqwa lajak", not to be
		-- confused with "dorvi fini zoqwa lajakes" -- "the goat which kisses the warrior"; unlike in
		-- English, where word order helps in figuring out what is the subject and what is the object,
		-- in Dothraki relative clauses this can only be read from the case suffixes), whereas
		-- questions use the regular SVO word order ("Fin lajak zoqwa?"). Therefore, in order to
		-- keep word order open in ClSlash, we need to remember the subject separately here, instead
		-- of sticking it in the s (as we do in Cl).
		ClSlash = {s : ResDot.Tense => Anteriority => Polarity => Str; subj: Str ; objCase : Case} ;
		
		RP = {s : QuForm => Case => Str } ;
		RCl = {s : ResDot.Tense => Anteriority => Polarity => Animacy => Number => Str } ;
		RS = {s : Animacy => Number => Str } ;

		-- Sentences like "the food is hot" have to be expressed in Dothraki, by deriving 
		-- a verb "afazhat" ("to be hot") from the adjective "afazh" ("hot"). Therefore,
		-- in order to be able to implement a function like mkCl : NP -> AP -> Cl, we need
		-- to derive all the corresponding verb forms as part of the A category. 
		A = {s : Degree => Number => ACase => Str ; v : Verb } ;
		
		AP = {s : Number => ACase => Str ; v : Verb } ;
		
		V = Verb ;
		V2 = Verb ** {objCase : Case} ;
		
		-- We currently use the category VV (verbs with a verb phrase complement) only for constructions
		-- that use auxiliaries in English (can, must, should). These are rendered as non-inflecting
		-- particles in Dothraki, so for this purpose, it is sufficient to define it as below.
		-- Obviously, this should be considered a temporary solution.
		-- Not all VV verbs (want to do sth, start to do sth, bother to do sth, decide to do sth etc) can be 
		-- rendered just as particles in Dothraki, but so far, information on how such constructions work
		-- in Dothraki is very scarce (they seem to be rendered as subordinate clauses, i.e.
		-- "The Khaleesi wants to eat something different" -- "Khaleesi zala meme adakha esinakh" --
		-- literally "The Khaleesi wants that she eats something different"). 
		VV = {s : Str} ;
		
		VPSlash = Verb ** {objCase : Case ; subjpost : Str} ;
		VP = Verb ** {compl : Str; subjpost : Str} ;

		Comp = {s : VForm => Str} ; 
		
		IAdv = {s, small : Str} ;   -- interrogative adverbs seem to have two forms in Dothraki
		                            -- depending on use:
		                            -- Finne me remeka? -- Where does he sleep?
		                            -- Anha nesok rekke remeka me. -- I don't know where he sleeps.
		                            
		Conj = {s: Str; p: Str} ;   -- Some conjuctions change when used as phrasal conjuctions (ma/majin)
}