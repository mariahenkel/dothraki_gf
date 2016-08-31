--# -path=../simpleapi:../simpleenglish

instance LexWarriorsEng of LexWarriors = open SyntaxSimpleEng, ParadigmsSimpleEng in {
	oper
		warrior_N = mkN "warrior" ;
		goat_N = mkN "goat" ;
		stab_V2 = mkV2 "stab" ;
}