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
		Prop = AP ;
		Mode = VV ;


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
        
        Drogo = mkNP Drogo_PN ;
        
        Spec det a = mkNP det a ;
           
		The = the_Det ;
		This = this_Det ;
		That = that_Det ;
		These = these_Det ;
		Those = those_Det ;

        Protect = protect_V2;
        Meet = meet_V2; 
        Kiss = kiss_V2;
        Stab = stab_V2;
        Heal = heal_V2 ;
        Respect = respect_V2 ;
        
        Stink = mkVP stink_V ;

        Hot = mkAP hot_A;
        Broken = mkAP broken_A ;
        
        Is actor prop = mkCl actor prop ;

		Relation action actor2 = mkVP action actor2 ;

		Zero actor actor2 = mkCl actor actor2 ;
		
		Act actor action = mkCl actor action ;
		
		Locate action location = mkVP action location ;

		Describe actor prop = mkCN actor prop ;

		Exist actor = mkCl actor ;
		
		Passive traction = passiveVP traction ;
		PassiveBy traction byActor = passiveVP traction byActor ;
		
		Rel actor action t p = mkCN actor (mkRS t p (mkRCl which_RP action)) ;

		RelObj actor traction t p a = mkCN actor (mkRS t p (mkRCl which_RP a traction)) ;
		
		Aux mode action = mkVP mode action ;

		Mountain = mkAdv on_Prep (mkNP the_Det mountain_N) ;
		Sea = mkAdv under_Prep (mkNP the_Det sea_N) ;
		Tree = mkAdv behind_Prep (mkNP that_Det tree_N) ;
		
		Can = can_VV ;
		Must = must_VV ;
		
		Past = mkTemp pastTense simultaneousAnt ;
		Pres = mkTemp presentTense simultaneousAnt ;
		PresPerf = mkTemp presentTense anteriorAnt ;
		Fut = mkTemp futureTense simultaneousAnt ;
		
		Pos = positivePol;
		Neg = negativePol;
		
		Say c p t = mkS t p c ;
		
}