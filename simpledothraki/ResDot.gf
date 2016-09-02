resource ResDot = ParamX ** {
	param
		Animacy = Anim | Inanim ;
		Case = Nom | Gen | Acc | All | Abl ;
		
		Agr = Pers1 Number | Pers2 | Pers3 Number ;
		
	oper
		Noun : Type = {s : Number => Case => Str ; a : Animacy} ;
		
		Verb : Type = {s : Agr => Str ; inf : Str} ;

}