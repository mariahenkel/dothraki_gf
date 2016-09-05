--# -path=../simpleapi:../simpleenglish

instance LexWarriorsEng of LexWarriors = open SyntaxSimpleEng, ParadigmsSimpleEng in {
	oper
		warrior_N = mkN "warrior" ;
		goat_N = mkN "goat" ;
        turtle_N = mkN "turtle" ;
        queen_N = mkN "queen";

		stab_V2 = mkV2 "stab" ;
        kiss_V2 = mkV2 "kiss" ;
}