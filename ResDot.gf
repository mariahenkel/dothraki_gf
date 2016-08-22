resource ResDot = {
	param
		Animacy = Anim | Inanim ;
		Genus = Nom | Acc | Gen | All | Abl ;
		Number = Sing | Pl ;
		
		NForm = NAnim Genus Number | NInamin Genus ;
}