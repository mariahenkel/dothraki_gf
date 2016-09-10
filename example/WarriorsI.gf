--# -path=.:../simpleapi

incomplete concrete WarriorsI of Warriors = open SyntaxSimple, LexWarriors in {
	lincat
		Comment = Utt ;
		Actor = NP ;
		Undergoer = NP ;

	lin
		Warrior = mkNP the_Det warrior_N ;
        Queen = mkNP the_Det queen_N;
		Goat = mkNP the_Det goat_N ;
        Turtle = mkNP the_Det turtle_N ;

		Relation actor undergoer = mkUtt (mkCl actor kiss_V2 undergoer) ; -- this only uses stab, not other Actions TODO!

}