--# -path=.:../simpleabstract:../common

concrete CatSimpleDot of CatSimple = CommonX ** open ResDot in {
	lincat
		N = Noun ;
		CN = Noun ;
		NP = {s : Case => Str ; agr : Agr} ;
		
		Pron = {s : Case => Str ; p : Person ; n : Number} ;
		
		Det, Num = {n : Number} ; -- temporary. For now, determiners only choose the number of the NP
		Quant = {s : Str} ;
		
		Prep = {s : Str} ;
		
		S = {s : Str} ;
		Cl = {s : ResDot.Tense => Anteriority => Polarity => Str} ;
		
		V, V2 = Verb ;
		VP, VPSlash = Verb ** {compl : Str} ;
}