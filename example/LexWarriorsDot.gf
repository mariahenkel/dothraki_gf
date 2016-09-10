--# -path=../simpleapi:../simpledothraki:../simpleabstract

instance LexWarriorsDot of LexWarriors = open SyntaxSimpleDot, ParadigmsSimpleDot in {
	oper
		warrior_N = mkN "lajak" animate ;
		goat_N = mkN "dorvi" inanimate ;
        turtle_N = mkN "adra" animate ;
        queen_N = mkN "khaleesi" animate;
        woman_N = mkN "chiori" animate; 
        rider_N = mkN "dothrak" animate; 

        stab_V2 = mkV2 "vindelat" ;
        kiss_V2 = mkV2 "zoqwat" ;
        protect_V2 = mkV2 "vijazerat" ;
        meet_V2 = mkV2 "shillolat" ;

}