--# -path=.:../simpleabstract:../common

concrete CatSimpleDot of CatSimple = CommonX ** open ResDot in {
	lincat
		N = Noun ;
		CN = Noun ;
		NP = {s : Case => Str ; agr : Agr } ;
		
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
		
		RP = {s : QuForm => Case => Str } ;
		RCl = {s : ResDot.Tense => Anteriority => Polarity => Animacy => Number => Str } ;
		RS = {s : Animacy => Number => Str } ;
		
		V = Verb ;
		V2, VPSlash = Verb ** {objCase : Case} ;
		VP = Verb ** {compl : Str} ;

		Comp = {s : VForm => Str} ; 
}