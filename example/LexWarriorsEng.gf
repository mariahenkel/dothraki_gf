--# -path=../simpleapi:../simpleenglish

instance LexWarriorsEng of LexWarriors = open SyntaxSimpleEng, ParadigmsSimpleEng in {
	oper
		warrior_N = mkN "warrior" ;
		goat_N = mkN "goat" ;
        turtle_N = mkN "turtle" ;
        queen_N = mkN "queen";
		woman_N = mkN "woman";
		rider_N = mkN "rider";
		mom_N = mkN "mom" ;

		stab_V2 = mkV2 "stab" ;
        kiss_V2 = mkV2 "kiss" ;
        protect_V2 = mkV2 "protect" ;
        meet_V2 = mkV2 "meet" ;
}