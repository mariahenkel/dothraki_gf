--# -path=.:../simpleabstract:../common

concrete StructuralSimpleDot of StructuralSimple = CatSimpleDot ** open ParamX, MorphoSimpleDot, ResDot, ParadigmsSimpleDot in {
lin
-- This choice of pronouns is dictated by the abstract StructuralSimple.gf
-- (which just copies the one from the original RGL).

-- They fit the actual range of personal pronouns in Dothraki only somewhat
-- roughly (Dothraki has no distinction between "he"/"she"/"it").

  i_Pron = mkPron "anha" "anna" "anni" "anhaan" "anhoon" P1 Sg ;
  youSg_Pron = mkPron "yer" "yera" "yeri" "yeraan" "yeroon" P2 Sg ; -- you (singular)
  youPol_Pron = mkPron "shafka" "shafka" "shafki" "shafkea" "shafkoa" P3 Pl ; -- you (polite)
  he_Pron = mkPron "me" "mae" "mae" "maan" "moon" P3 Sg ;
  it_Pron = mkPron "me" "mae" "mae" "maan" "moon" P3 Sg ;
  she_Pron = mkPron "me" "mae" "mae" "maan" "moon" P3 Sg ;
  we_Pron = mkPron "kisha" "kisha" "kishi" "kishaan" "kishoon" P1 Pl ;
  youPl_Pron = mkPron "yeri" "yeri" "yeri" "yerea" "yeroa" P2 Pl ; -- you (plural)
  they_Pron = mkPron "mori" "mora" "mori" "morea" "moroa" P3 Pl ;
  
  this_Quant = mkQuant "jin" ;
  that_Quant = mkQuant "rek" ;
}