resource ResDot = ParamX ** {
	param
		Animacy = Anim | Inanim ;
		Case = Nom | Acc | Gen | All | Abl ;
	
	oper
		NForm = {g : Case ; n : Number} ;
}