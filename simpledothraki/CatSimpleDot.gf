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
		
		Prep = {s : Str} ;
		
		S = {s : Str} ;
		Cl = {s : ResDot.Tense => Anteriority => Polarity => Str} ;
		
		V, V2 = Verb ;
		VP, VPSlash = Verb ** {compl : Str} ;
}