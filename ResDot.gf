resource ResDot = {
	param
		Animacy = Anim | Inanim ;
		Genus = Nom | Acc | Gen | All | Abl ;
		Number = Sing | Pl ;
	
	oper
		NForm = {g : Genus ; n : Number} ;
}