--# -path=../simpleapi:../simpledothraki:../simpleabstract

instance LexWarriorsDot of LexWarriors = open SyntaxSimpleDot, ParadigmsSimpleDot in {
	oper
		warrior_N = mkN "lajak" animate ;
		goat_N = mkN "dorvi" inanimate ;
        turtle_N = mkN "adra" animate ;
        queen_N = mkN "khaleesi" animate;

        stab_V2 = mkV2 "vindelat" ;
        kiss_V2 = mkV2 "zoqwat" ;

}