--# -path=../simpleapi:../simpleenglish

instance LexWarriorsEng of LexWarriors = open SyntaxSimpleEng, ParadigmsSimpleEng in {
	oper
	warrior_N = mkN human (mkN "warrior") ;
	goat_N = mkN "goat" ;
        turtle_N = mkN "turtle" ;
        queen_N = mkN human (mkN "queen");
	woman_N = mkN human (mkN "woman" "women");
	rider_N = mkN human (mkN "rider");
	mom_N = mkN human (mkN "mom") ;
	rabbit_N = mkN "rabbit" ;
	cheese_N = mkN "cheese" ;
	
	Drogo_PN = mkPN ("Khal" ++ "Drogo") ;

	stab_V2 = mkV2 "stab" ;
        kiss_V2 = mkV2 "kiss" ;
        protect_V2 = mkV2 "protect" ;
        meet_V2 = mkV2 (mkV "meet" "met" "met") ;
        heal_V2 = mkV2 "heal" ;
        respect_V2 = mkV2 "respect" ;
        
        mountain_N = mkN "mountain" ;
        sea_N = mkN "sea" ;
        tree_N = mkN "tree" ;
        
        stink_V = mkV "stink" "stank" "stunk";

        hot_A = mkA "hot" ;
        broken_A = mkA "broken" ;
}