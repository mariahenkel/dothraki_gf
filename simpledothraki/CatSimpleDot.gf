--# -path=.:../simpleabstract:../common

concrete CatSimpleDot of CatSimple = CommonX ** open ResDot in {
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
		
		S = {s : Str} ;
		Cl = {s : ResDot.Tense => Anteriority => Polarity => Str} ;
		
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

		A = {s : Degree => Number => ACase => Str} ;
		AP = {s : Number => ACase => Str} ;
		
		V = Verb ;
		V2, VPSlash = Verb ** {objCase : Case} ;
		VP = Verb ** {compl : Str} ;

		Comp = {s : VForm => Str} ; 
}