--# -path=.:../simpleapi

incomplete concrete WarriorsI of Warriors = open SyntaxSimple, LexWarriors in {
	lincat
		Comment = Utt ;
		Actor = NP ;
		Action = V2;


	lin
		Warrior = mkNP the_Det warrior_N ;
        Queen = mkNP the_Det queen_N;
		Goat = mkNP the_Det goat_N ;
        Turtle = mkNP the_Det turtle_N ;
        Woman = mkNP the_Det woman_N ;
        Rider = mkNP the_Det rider_N;
        Mom = mkNP the_Det mom_N ;
        Rabbit = mkNP the_Det rabbit_N ;
        Cheese = mkNP the_Det cheese_N ;
        I = mkNP i_Pron ;
        YouSg = mkNP youSg_Pron ;
        It = mkNP it_Pron ;
        We = mkNP we_Pron ;
        YouPl = mkNP youPl_Pron ;
        They = mkNP they_Pron ;
        YouPol = mkNP youPol_Pron ; 

        Protect = protect_V2;
        Meet = meet_V2; 
        Kiss = stab_V2;
        Stab = kiss_V2;
        Heal = heal_V2 ;

		Relation actor action actor2 = variants {
			mkUtt (mkS presentTense positivePol (mkCl actor action actor2));
			mkUtt (mkS presentTense negativePol (mkCl actor action actor2));
			mkUtt (mkS pastTense positivePol (mkCl actor action actor2)) ;			
			mkUtt (mkS pastTense negativePol (mkCl actor action actor2)) ;			
			mkUtt (mkS futureTense positivePol (mkCl actor action actor2)) ;		
			mkUtt (mkS futureTense negativePol (mkCl actor action actor2)) 		
		} ;

}