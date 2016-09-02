--# -path=../simpleapi:../simpledothraki:../simpleabstract

instance LexWarriorsDot of LexWarriors = open SyntaxSimpleDot, ParadigmsSimpleDot in {
	oper
		warrior_N = mkN "lajak" animate ;
		goat_N = mkN "dorvi" inanimate ;
		stab_V2 = mkV2 "vindelat" ;
}