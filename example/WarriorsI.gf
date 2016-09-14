--# -path=.:../simpleapi

incomplete concrete WarriorsI of Warriors = open SyntaxSimple, LexWarriors in {
	lincat
		Comment = Utt ;
		Actor = CN ;
		SpecActor = NP ;
		Detr = Det ;
		Action = V2;


	lin
		Warrior = mkCN warrior_N ;
        Queen = mkCN queen_N;
		Goat = mkCN  goat_N ;
        Turtle = mkCN turtle_N ;
        Woman = mkCN  woman_N ;
        Rider = mkCN rider_N;
        Mom = mkCN  mom_N ;
        Rabbit = mkCN rabbit_N ;
        Cheese = mkCN cheese_N ;
        
        I = i_NP ;
        YouSg = you_NP ;
        It = it_NP ;
        We = we_NP ;
        YouPl = youPl_NP ;
        They = they_NP ;
        YouPol = youPol_NP ;
        
        Spec det a = mkNP det a ;
        
        
		The = the_Det ;
		This = this_Det ;
		That = that_Det ;
		These = these_Det ;
		Those = those_Det ;

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