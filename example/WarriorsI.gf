--# -path=.:../simpleapi

incomplete concrete WarriorsI of Warriors = open SyntaxSimple, LexWarriors in {
	lincat
		Comment = Utt ;
		Stabber = NP ;
		Stabbee = NP ;
	lin
		Warrior = mkNP the_Det warrior_N ;
		Goat = mkNP the_Det goat_N ;
		Stabbing stabber stabbee = mkUtt (mkCl stabber stab_V2 stabbee) ;
}