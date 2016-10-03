--# -path=../simpleapi:../simpledothraki:../simpleabstract

instance LexWarriorsDot of LexWarriors = open SyntaxSimpleDot, ParadigmsSimpleDot in {
	oper
	warrior_N = mkN "lajak" animate ;
	goat_N = mkN "dorvi" inanimate ;
        turtle_N = mkN "adra" animate ;
        queen_N = mkN "khaleesi" animate;
        woman_N = mkN "chiori" animate; 
        rider_N = mkN "dothrak" animate;
        mom_N = mkN "mai" animate ;
        rabbit_N = mkN "mawizzi" inanimate ;
        cheese_N = mkN "jelli" "jel" ;
        
        Drogo_PN = mkPN (mkN "Khal" animate) "Drogo" ;

        stab_V2 = mkV2 "vindelat" ;
        kiss_V2 = mkV2 "zoqwat" ;
        protect_V2 = mkV2 "vijazerat" ;
        meet_V2 = mkV2 "shillolat" ;
        heal_V2 = mkV2 "akkoalat" ;
        respect_V2 = mkV2 "chomat" allative ;
        
        stink_V = mkV "vachrarat" ;

        mountain_N = mkN "krazaaj" inanimate ;
        sea_N = mkN "havazh" inanimate ;
        tree_N = mkN "feshith" animate ;
        
        hot_A = mkA "afazh" ;
        broken_A = mkA "samva" ;
}