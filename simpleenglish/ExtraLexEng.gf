--# -path=.:../simpleabstract

concrete ExtraLexEng of ExtraLex = CatSimpleEng ** open ParadigmsSimpleEng, IrregEng, DictSimpleEng in {
	lin
	Khal_Drogo_PN = mkPN ("Khal" ++ "Drogo") ;
	cut_off_V2 = mkV2 (partV IrregEng.cut_V "off");
	arakh_N = mkN "arakh" ;
	khalasar_N = DictSimpleEng.horde_N ;
	try_VV = mkVV (mkV "try" "tries" "tried" "tried" "trying");
}