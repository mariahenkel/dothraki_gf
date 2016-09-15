--# -path=.:../simpleapi:../simpleabstract

incomplete concrete WarriorsI of Warriors = open SyntaxSimple, LexWarriors in {
	lincat
		Sentence = S ;
		Comment = Cl ;
		Actor, RelActor = CN ;
		SpecActor = NP ;
		Detr = Det ;
		Action = VP;
		TrAction = V2 ;
		Location = Adv ;
		Temp = SyntaxSimple.Temp ;
		Pol = SyntaxSimple.Pol ;


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
        Respect = respect_V2 ;
        
        Stink = mkVP stink_V ;

		Relation action actor2 = mkVP action actor2 ;
		
		Act actor action = mkCl actor action ;
		
		Locate action location = mkVP action location ;

		Exist actor = mkCl actor ;
		
		Rel actor action t p = mkCN actor (mkRS t p (mkRCl which_RP action)) ;

		Mountain = mkAdv on_Prep (mkNP the_Det mountain_N) ;
		Sea = mkAdv under_Prep (mkNP the_Det sea_N) ;
		Tree = mkAdv behind_Prep (mkNP that_Det tree_N) ;
		
		Past = mkTemp pastTense simultaneousAnt ;
		Pres = mkTemp presentTense simultaneousAnt ;
		PresPerf = mkTemp presentTense anteriorAnt ;
		Fut = mkTemp futureTense simultaneousAnt ;
		
		Pos = positivePol;
		Neg = negativePol;
		
		Say c p t = mkS t p c ;
		
}